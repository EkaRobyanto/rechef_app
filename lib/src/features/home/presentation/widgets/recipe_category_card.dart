import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class RecipeCategoryCard extends StatelessWidget {
  final String image, name;
  const RecipeCategoryCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Styles.color.accent,
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: Image.asset(image).image,
              alignment: Alignment.center,
              scale: 4.5,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: Styles.font.bold,
        )
      ],
    );
  }
}
