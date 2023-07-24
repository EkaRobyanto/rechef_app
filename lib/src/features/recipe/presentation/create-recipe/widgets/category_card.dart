import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/styles.dart';
import '../cubit/create_recipe_cubit.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryItem,
    required this.categoryIndex,
  });

  final Map<String, dynamic> categoryItem;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<CreateRecipeCubit>()
            .chooseIngredientCategory(categoryIndex, categoryItem['name']);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Styles.color.accent,
                ),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Image.asset(
                  categoryItem['pic'],
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                categoryItem['name'],
                style: Styles.font.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
