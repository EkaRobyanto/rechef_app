import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/widgets/recipe_calory.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/widgets/recipe_portion.dart';

import '../../../../../constants/styles.dart';
import '../cubit/create_recipe_cubit.dart';
import 'recipe_difficulty.dart';
import 'recipe_duration.dart';

class InputRecipeInformation extends StatefulWidget {
  const InputRecipeInformation({
    super.key,
  });

  @override
  State<InputRecipeInformation> createState() => _InputRecipeInformationState();
}

class _InputRecipeInformationState extends State<InputRecipeInformation> {
  final _formKey = GlobalKey<FormState>();
  final _recipeNameController = TextEditingController();
  final _recipeDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              alignment: Alignment.center,
              child: TextFormField(
                autocorrect: false,
                textAlign: TextAlign.center,
                controller: _recipeNameController,
                minLines: 1,
                maxLines: 2,
                onChanged: (value) {
                  context
                      .read<CreateRecipeCubit>()
                      .updateRecipeInfo(name: value);
                },
                decoration: InputDecoration(
                  hintText: 'Nama resep',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Styles.color.primary),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: Styles.font.bold.copyWith(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: TextFormField(
                onChanged: (value) {
                  context
                      .read<CreateRecipeCubit>()
                      .updateRecipeInfo(desc: value);
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                controller: _recipeDescriptionController,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Deskripsi resep',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Styles.color.primary),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: Styles.font.bold.copyWith(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecipeDifficulty(),
                      RecipeDuration(),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RecipePortion(),
                      RecipeCalory(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
