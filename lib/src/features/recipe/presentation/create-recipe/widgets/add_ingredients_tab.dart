import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_cubit.dart';
import 'package:rechef_app/src/shared/shrink_widget.dart';
import '../cubit/create_recipe_state.dart';
import 'add_ingredient_card.dart';

class AddIngredients extends StatelessWidget {
  const AddIngredients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRecipeCubit, CreateRecipeState>(
      builder: (context, state) {
        var cubitState = context.read<CreateRecipeCubit>();
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ListView.builder(
                  itemCount:
                      cubitState.recipe.ingredientCategories?.length ?? 0,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AddIngredientCard(
                      ingredientCategory:
                          cubitState.recipe.ingredientCategories![index],
                      categoryIndex: index,
                    ),
                  ),
                ),
                ShrinkWidget(
                  onTap: () {
                    context
                        .read<CreateRecipeCubit>()
                        .addNewIngredientCategories();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Styles.color.primary,
                          ),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Tambah Bahan',
                          style: Styles.font.blg,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
