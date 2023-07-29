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

class Loading extends CreateRecipeState {
  @override
  List<Object> get props => [];
}

class CreateRecipeSucces extends CreateRecipeState {
  @override
  List<Object> get props => [];
}

class Error extends CreateRecipeState {
  final String message;

  Error(this.message);

  @override
  List<Object> get props => [message];
}
