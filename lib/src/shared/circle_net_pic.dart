import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CircleNetPic extends StatelessWidget {
  CircleNetPic({
    super.key,
    this.img,
  });

  dynamic img;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        img ?? 'https://picsum.photos/200',
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null
                ? child
                : Center(
                    child: CircularProgressIndicator(
                      color: Styles.color.accent,
                    ),
                  ),
      ),
    );
  }
}
