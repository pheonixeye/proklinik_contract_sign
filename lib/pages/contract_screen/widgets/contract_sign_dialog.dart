import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signature/signature.dart';

class ContractSignDialog extends StatefulWidget {
  const ContractSignDialog({super.key});

  @override
  State<ContractSignDialog> createState() => _ContractSignDialogState();
}

class _ContractSignDialogState extends State<ContractSignDialog> {
  final formKey = GlobalKey<FormState>();
  late final SignatureController _controller = SignatureController();
  late final TextEditingController _nationalIdController =
      TextEditingController();
  late final TextEditingController _arabicAddressController =
      TextEditingController();
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
      title: Row(
        children: [
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
        child: Form(
          child: ListView(
            children: [
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
              ListTile(
                title: const Text('التوقيع'),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Signature(
                    height: MediaQuery.sizeOf(context).height - 100,
                    controller: _controller,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            _controller.value.isNotEmpty) {
                          Navigator.pop(
                            context,
                            {
                              'national_id': _nationalIdController.text,
                              'arabic_address': _arabicAddressController.text,
                              'signature': _controller.toPngBytes(),
                            },
                          );
                        }
                      },
                      label: const Text('حفظ'),
                      icon: const Icon(Icons.save),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
