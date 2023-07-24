import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_cubit.dart';

import '../../../domain/ingredient_category/ingredient_category.dart';
import 'add_ingredients.dart';
import 'choose_category.dart';

// ignore: must_be_immutable
class AddIngredientCard extends StatelessWidget {
  AddIngredientCard({
    super.key,
    required this.ingredientCategory,
    required this.categoryIndex,
  });

  IngredientCategory ingredientCategory;
  int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: context
                  .read<CreateRecipeCubit>()
                  .recipe
                  .ingredientCategories?[categoryIndex]
                  .name ==
              null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
      firstCurve: Curves.linear,
      firstChild: ChooseIngredientCategory(
        ingredientCategory: ingredientCategory,
        categoryIndex: categoryIndex,
      ),
      secondChild: AddIngredients(
        categoryIndex: categoryIndex,
      ),
    );
  }
}
