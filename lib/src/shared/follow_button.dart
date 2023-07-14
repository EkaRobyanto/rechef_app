import 'package:flutter/material.dart';
import 'package:rechef_app/src/shared/shrink_widget.dart';

import '../constants/styles.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkWidget(
      onTap: () {},
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Styles.color.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Ikuti',
            style: Styles.font.bsm,
          ),
        ),
      ),
    );
  }
}
