import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proklinik_contract_sign/core/api/hx_documents.dart';
import 'package:proklinik_contract_sign/providers/px_documents.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';
import 'package:proklinik_contract_sign/widgets/image_source_dialog.dart';
import 'package:provider/provider.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxDocuments>(
      builder: (context, docs, _) {
        while (docs.data == null) {
          return const Material(
            type: MaterialType.canvas,
            child: CentralLoading(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: ListTile(
              title: Text('دكتور / ${docs.data!.doctor.name_ar}'),
              subtitle: Text(docs.data!.doctor.speciality_ar),
            ),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              ...docs.documentKeys.entries.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card.outlined(
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.value),
                          ),
                          subtitle: FutureBuilder(
                            future: HxDocuments.getFileUrl(
                                docs.data!.documents.id, e.key),
                            builder: (context, snapshot) {
                              while (docs.data?.documents == null) {
                                return const Center(
                                  child: Text('لم يتم العثور علي المستند'),
                                );
                              }
                              return CachedNetworkImage(
                                imageUrl: snapshot.data.toString(),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        LinearProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              );
                            },
                          ),
                          trailing: IconButton.outlined(
                            onPressed: () async {
                              BuildContext? dialogContext;
                              final ImageSource? source =
                                  await showDialog<ImageSource>(
                                context: context,
                                builder: (context) {
                                  return const ImageSourceModal();
                                },
                              );
                              if (source == null) {
                                return;
                              }
                              final picker = ImagePicker();
                              try {
                                final result =
                                    await picker.pickImage(source: source);
                                if (result == null) {
                                  return;
                                }

                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      dialogContext = context;
                                      return const Material(
                                        type: MaterialType.card,
                                        child: CentralLoading(
                                          loadingText: 'جاري رفع المستند...',
                                        ),
                                      );
                                    },
                                  );
                                }
                                final bytes = await result.readAsBytes();
                                await docs
                                    .addDoctorDocoument(e.key, bytes)
                                    .whenComplete(() {
                                  Navigator.pop(dialogContext!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'تم رفع المستند بنجاح',
                                      ),
                                    ),
                                  );
                                });
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            icon: const Icon(Icons.camera_alt),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
