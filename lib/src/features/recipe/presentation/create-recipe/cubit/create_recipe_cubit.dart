import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_state.dart';

import '../../../../../constants/styles.dart';
import '../../../../../core/repository/storage_repository.dart';
import '../../../domain/ingredient/ingredient.dart';
import '../../../domain/ingredient_category/ingredient_category.dart';
import '../../../domain/method/method.dart';
import '../../../repository/recipe_repository_impl.dart';

class CreateRecipeCubit extends Cubit<CreateRecipeState> {
  File? imageCubit;
  var recipe = Recipe();
  final RecipeRepositoryImpl recipeRepositoryImpl;
  final StorageRepository storageRepository;
  CreateRecipeCubit({
    required this.recipeRepositoryImpl,
    required this.storageRepository,
  }) : super(CreateRecipeInitial());

  submitRecipe() async {
    emit(Loading());
    try {
      final tokens = await storageRepository.getTokens();
      await recipeRepositoryImpl.createRecipe(
        tokens['access']!,
        recipe,
      );
      emit(CreateRecipeSucces());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

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

  //recipe info
  updateRecipeInfo({
    String? name,
    String? desc,
    String? difficulty,
    int? duration,
    int? portion,
    int? kalori,
  }) {
    recipe = recipe.copyWith(
      name: name ?? recipe.name,
      description: desc ?? recipe.description,
      duration: duration ?? recipe.duration,
      portion: portion ?? recipe.portion,
      calories: kalori ?? recipe.calories,
      difficulty: difficulty ?? recipe.difficulty,
    );
    emit(UpdateInput(recipe));
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

  void addIngredientInfo({
    required int categoryIndex,
    required int ingredientIndex,
    String? name,
    int? quantity,
    String? unit,
    String? note,
  }) {
    recipe = recipe.copyWith(ingredientCategories: [
      for (final ingredientCategory in recipe.ingredientCategories!)
        if (recipe.ingredientCategories!.indexOf(ingredientCategory) ==
            categoryIndex)
          ingredientCategory.copyWith(
            ingredients: [
              for (final ingredient in ingredientCategory.ingredients!)
                if (ingredientCategory.ingredients!.indexOf(ingredient) ==
                    ingredientIndex)
                  ingredient.copyWith(
                    ingredientName: name ?? ingredient.ingredientName,
                    quantity: quantity ?? ingredient.quantity,
                    unit: unit ?? ingredient.unit,
                    note: note ?? ingredient.note,
                  )
                else
                  ingredient
            ],
          )
        else
          ingredientCategory
    ]);
    emit(UpdateInput(recipe));
  }

  //method
  void addMethod() {
    recipe = recipe.copyWith(
      method: [
        ...recipe.method ?? [],
        Method(
          id: recipe.method?.length.toString() ?? '0',
        ),
      ],
    );
    emit(UpdateInput(recipe));
  }

  void removeMethod(int index) {
    recipe = recipe.copyWith(
      method: [
        for (final method in recipe.method!)
          if (recipe.method!.indexOf(method) != index) method
      ],
    );
    emit(UpdateInput(recipe));
  }

  void updateMethod(int index, String info) {
    recipe = recipe.copyWith(
      method: [
        for (final method in recipe.method!)
          if (recipe.method!.indexOf(method) == index)
            method.copyWith(methodText: info)
          else
            method
      ],
    );
    emit(UpdateInput(recipe));
  }

  @override
  void onChange(Change<CreateRecipeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
