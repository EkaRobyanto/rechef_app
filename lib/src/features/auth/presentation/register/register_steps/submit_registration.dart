import 'package:flutter/material.dart';
import 'package:rechef_app/src/constants/image_path.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/shared/shrink_button.dart';

class SubmitRegist extends StatelessWidget {
  const SubmitRegist({
    super.key,
    required this.onCallBack,
    required this.onCallPrev,
  });
  final VoidCallback onCallBack;
  final VoidCallback onCallPrev;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(registStepCompleted),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pengaturan akun sukses diselesaikan ! Mari\njelajahi kuliner dan berbagi resep terenak\nbuatanmu',
            textAlign: TextAlign.center,
            style: Styles.font.blg,
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 50,
            child: ShrinkButton(
              text: 'Mulai Sekarang',
              onTap: onCallBack,
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
