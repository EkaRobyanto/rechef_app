import 'package:flutter/material.dart';
import 'package:rechef_app/src/shared/shrink_button.dart';

import '../../../../../constants/styles.dart';
import 'widgets/interest_bubbles.dart';

class ChooseInterest extends StatelessWidget {
  const ChooseInterest(
      {super.key, required this.onCallBack, required this.onCallPrev});
  final VoidCallback onCallBack;
  final VoidCallback onCallPrev;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Pilih berdasarkan\npersonalisasimu!',
            style: Styles.font.blg,
          ),
          const SizedBox(
            height: 10,
          ),
          const InterestBubbles(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              child: ShrinkButton(
                text: 'Lanjut',
                onTap: onCallBack,
              ),
            ),
          ),
          TextButton(
            onPressed: onCallPrev,
            child: const Text(
              'Kembali',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
