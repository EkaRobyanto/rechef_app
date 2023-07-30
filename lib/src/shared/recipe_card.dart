import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/shared/shrink_widget.dart';

import '../features/recipe/domain/recipe/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    this.recipe,
  });

  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    return ShrinkWidget(
      onTap: () => context.pushNamed('view-recipe'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 10,
                offset: Offset(0, 0),
                spreadRadius: 1,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: Image.network(recipe?.image ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNxebVRZaEqJkZOUL8cYZYcjUbm2-jhYY7gr0Z8VUH&s')
                        .image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    recipe?.name ?? 'Rendang Babi',
                    style: Styles.font.blg,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'dari ',
                        style: Styles.font.sm,
                      ),
                      Text(
                        recipe?.user ?? 'Shofinia',
                        style: Styles.font.bsm,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      recipe?.description ??
                          'Rendang ayam Padang adalah masakan yang terbuat dari daging ayam yang dimasak lama untuk mendapatkan rasa yang otentik. ',
                      style: Styles.font.sm,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
