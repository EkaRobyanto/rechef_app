import 'package:equatable/equatable.dart';
import '../../../domain/recipe/recipe.dart';

abstract class CreateRecipeState extends Equatable {}

class CreateRecipeInitial extends CreateRecipeState {
  final Recipe recipe = Recipe();
  CreateRecipeInitial();
  @override
  List<Object> get props => [recipe];
}

class UpdateInput extends CreateRecipeState {
  final Recipe recipe;

  UpdateInput(this.recipe);

  @override
  List<Object> get props => [recipe];
}
