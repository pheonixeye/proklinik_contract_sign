import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proklinik_contract_sign/models/contract_signature_result.dart';
import 'package:signature/signature.dart';

class ContractSignDialog extends StatefulWidget {
  const ContractSignDialog({super.key});

  @override
  State<ContractSignDialog> createState() => _ContractSignDialogState();
}

class _ContractSignDialogState extends State<ContractSignDialog> {
  final formKey = GlobalKey<FormState>();
  late final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: const Color(0xff00563B),
  );
  late final TextEditingController _nationalIdController =
      TextEditingController();
  late final TextEditingController _arabicAddressController =
      TextEditingController();

  bool _acceptedTerms = false;

  @override
  void dispose() {
    _controller.dispose();
    _nationalIdController.dispose();
    _arabicAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      insetPadding: EdgeInsets.zero,
      title: Row(
        children: [
          const SizedBox(width: 10),
          const CircleAvatar(),
          const SizedBox(width: 10),
          const Text('توقيع العقد'),
          const Spacer(),
          IconButton.outlined(
            onPressed: () {
              Navigator.pop(context, null);
            },
            icon: const Icon(Icons.close),
          ),
          const SizedBox(width: 10),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: Column(
              children: [
                const Divider(),
                ListTile(
                  title: const Text('رقم البطاقة الشخصية'),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _nationalIdController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء ادخال رقم البطاقة';
                        }
                        if (value.length != 14) {
                          return 'برجاء ادخال رقم بطاقة صحيح مكون من (١٤) رقم';
                        }
                        return null;
                      },
                      maxLength: 14,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('العنوان'),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _arabicAddressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء ادخال العنوان';
                        }
                        if (RegExp(r'^[a-zA-Z0-9$@$!%*?&#^-_. +]+$')
                            .hasMatch(value)) {
                          return 'برجاء ادخال العنوان باللغة العربية';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('التوقيع'),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 4,
                      ),
                      child: Signature(
                        controller: _controller,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text(
                    'لقد قرأت العقد و اوافق على التعاقد مع بروكلينيك بناء على الشروط الواردة فى العقد.',
                  ),
                  trailing: Checkbox(
                    value: _acceptedTerms,
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _acceptedTerms = val;
                        });
                      }
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (!_acceptedTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Row(
                                  children: [
                                    Text(
                                      'برجاء الموافقة على شروط العقد اولا. ',
                                    ),
                                  ],
                                ),
                              ),
                            );
                            return;
                          }
                          if (_controller.isEmpty ||
                              _controller.value.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Row(
                                  children: [
                                    Text(
                                      'برجاء ادخال التوقيع',
                                    ),
                                  ],
                                ),
                              ),
                            );
                            return;
                          }
                          if (formKey.currentState!.validate() &&
                              _controller.value.isNotEmpty) {
                            final signature = await _controller.toPngBytes();
                            if (context.mounted) {
                              Navigator.pop(
                                context,
                                ContractSignatureResult(
                                  arabic_address: _arabicAddressController.text,
                                  national_id: _nationalIdController.text,
                                  signature: signature,
                                ),
                              );
                            }
                          }
                        },
                        label: const Text('حفظ'),
                        icon: const Icon(Icons.save),
                      ),
                      const SizedBox(height: 10),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     final img = await _controller.toPngBytes();
                      //     saveImg(img!, 'signature.png');
                      //   },
                      //   child: const Text('save sign'),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void saveImg(Uint8List bytes, String fileName) {
//   final html.Blob blob = html.Blob([bytes], 'image/png');

//   final String url = html.Url.createObjectUrlFromBlob(blob);

//   html.AnchorElement(href: url)
//     ..setAttribute('download', fileName)
//     ..click();

//   html.Url.revokeObjectUrl(url);
// }
