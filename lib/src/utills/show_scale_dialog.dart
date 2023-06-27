import 'package:flutter/material.dart';

showScaledDialog(BuildContext context, Widget content) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut.transform(animation.value);
      return Transform.scale(
        scale: curve,
        child: content,
      );
    },
  );
}
