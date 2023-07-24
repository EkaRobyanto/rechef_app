import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_state.dart';

import '../../../../../constants/styles.dart';
import '../../../domain/ingredient/ingredient.dart';
import '../../../domain/ingredient_category/ingredient_category.dart';

class CreateRecipeCubit extends Cubit<CreateRecipeState> {
  File? imageCubit;
  var recipe = Recipe();
  CreateRecipeCubit() : super(CreateRecipeInitial());

  void pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) return;
    final imagePath = image.path;
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Sesuaikan Gambar',
          toolbarColor: Styles.color.primary,
          toolbarWidgetColor: const Color(0xFF000000),
          activeControlsWidgetColor: Styles.color.darkGreen,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        )
      ],
    );
    if (croppedImage == null) return;
    imageCubit = File(croppedImage.path);
    recipe = recipe.copyWith(image: croppedImage.path);
    emit(UpdateInput(Recipe(image: croppedImage.path)));
  }

  //category
  void addNewIngredientCategories() {
    recipe = recipe.copyWith(
      ingredientCategories: [
        ...recipe.ingredientCategories ?? [],
        IngredientCategory(
          id: recipe.ingredientCategories?.length.toString() ?? '0',
        ),
      ],
    );
    log(recipe.ingredientCategories!.length.toString());
    emit(UpdateInput(recipe));
  }

  void removeIngredientCategoriesAtIndex(int index) {
    log(index.toString());
    recipe = recipe.copyWith(
      ingredientCategories: [
        for (final ingredientCategory in recipe.ingredientCategories!)
          if (recipe.ingredientCategories!.indexOf(ingredientCategory) != index)
            ingredientCategory
      ],
    );

    emit(UpdateInput(recipe));
  }

  void chooseIngredientCategory(int index, String category) {
    recipe = recipe.copyWith(
      ingredientCategories: [
        for (final ingredientCategory in recipe.ingredientCategories!)
          if (recipe.ingredientCategories!.indexOf(ingredientCategory) == index)
            ingredientCategory.copyWith(name: category)
          else
            ingredientCategory
      ],
    );
    emit(UpdateInput(recipe));
  }

  //ingredient
  void addIngredient(int categoryIndex) {
    recipe = recipe.copyWith(ingredientCategories: [
      for (final ingredientCategory in recipe.ingredientCategories!)
        if (recipe.ingredientCategories!.indexOf(ingredientCategory) ==
            categoryIndex)
          ingredientCategory.copyWith(
            ingredients: [
              ...ingredientCategory.ingredients ?? [],
              Ingredient(
                id: ingredientCategory.ingredients?.length.toString() ?? '0',
              ),
            ],
          )
        else
          ingredientCategory
    ]);
    emit(UpdateInput(recipe));
  }

  void removeIngredient(int categoryIndex, int ingredientIndex) {
    recipe = recipe.copyWith(ingredientCategories: [
      for (final ingredientCategory in recipe.ingredientCategories!)
        if (recipe.ingredientCategories!.indexOf(ingredientCategory) ==
            categoryIndex)
          ingredientCategory.copyWith(
            ingredients: [
              for (final ingredient in ingredientCategory.ingredients!)
                if (ingredientCategory.ingredients!.indexOf(ingredient) !=
                    ingredientIndex)
                  ingredient
            ],
          )
        else
          ingredientCategory
    ]);
    emit(UpdateInput(recipe));
  }

  @override
  void onChange(Change<CreateRecipeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
