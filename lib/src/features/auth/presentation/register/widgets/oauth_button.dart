import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          Styles.decor.spreadShadow,
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Image.asset(asset),
      ),
    );
  }
}
