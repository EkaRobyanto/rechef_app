// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ingredient/ingredient.dart';

part 'name_category.freezed.dart';
part 'name_category.g.dart';

@freezed
class NameCategory with _$NameCategory {
  factory NameCategory({
    List<Ingredient>? ingredient,
  }) = _Namecategory;
  factory NameCategory.fromJson(Map<String, dynamic> json) =>
      _$NameCategoryFromJson(json);
}
