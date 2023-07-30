import 'package:flutter/material.dart';
import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';

import '../../../../constants/styles.dart';

class RecomendationCard extends StatelessWidget {
  RecomendationCard({
    super.key,
    required this.recipe,
  });

  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: 260,
            child: Image.network(
              recipe.image ?? 'https://picsum.photos/200/300/?blur',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: 150,
            width: 260,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                ],
                stops: const [0.3, 0.6, 1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name!,
                  style: Styles.font.bold.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  recipe.description!,
                  style: Styles.font.xsm.copyWith(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
