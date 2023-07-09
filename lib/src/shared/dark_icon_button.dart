import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'shrink_widget.dart';

class DarkIconButton extends StatelessWidget {
  const DarkIconButton({super.key, required this.onTap, required this.icon});

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ShrinkWidget(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Styles.color.dark,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 25,
          color: Styles.color.accent,
        ),
      ),
    );
  }
}
