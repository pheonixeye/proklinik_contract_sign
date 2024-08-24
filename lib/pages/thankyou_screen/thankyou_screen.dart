// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:proklinik_contract_sign/assets/assets.dart';

class ThankyouScreen extends StatelessWidget {
  const ThankyouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets.thankyouImage,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.appLogo,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                const Text(
                  'ProKliniK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'شكرا علي اكمال التعاقد',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ' نود أن نعرب عن امتناننا لإتاحة الفرصة لنا للعمل معك خلال فترة العقد. ان دعمكم وتعاونكم لا يقدر بثمن بالنسبة لنا، ونحن ممتنون للثقة التي وضعتموها في خدماتنا. ومع بداية العقد، نود أن نعرب عن أطيب تمنياتنا لمساعيك المستقبلية. إذا كنت بحاجة إلى أي مساعدة في المستقبل، فلا تتردد في التواصل معنا. نحن ملتزمون بالحفاظ على علاقة إيجابية ومهنية معك. ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  html.window.open('https://doctor.proklinik.app', '');
                },
                label: const Text('لوحة التحكم'),
                icon: const Icon(Icons.check),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
