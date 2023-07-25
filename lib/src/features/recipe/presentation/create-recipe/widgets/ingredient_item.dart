import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_cubit.dart';

import '../../../../../constants/styles.dart';

class IngredientItem extends StatefulWidget {
  IngredientItem({
    super.key,
    required this.ingredientIndex,
    required this.categoryIndex,
  });

  final int ingredientIndex;
  final int categoryIndex;

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  var ingredientNameController = TextEditingController();
  var ingredientQuantityController = TextEditingController();
  var ingredientUnitController = TextEditingController();

  @override
  void dispose() {
    ingredientNameController.dispose();
    ingredientQuantityController.dispose();
    ingredientUnitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nama Bahan',
              style: Styles.font.bsm,
            ),
            Row(
              children: [
                Text(
                  'Jumlah',
                  style: Styles.font.bsm,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    context.read<CreateRecipeCubit>().removeIngredient(
                        widget.categoryIndex, widget.ingredientIndex);
                  },
                  child: const Icon(
                    BoxIcons.bx_trash,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 30,
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: ingredientNameController,
                  decoration: InputDecoration(
                    hintText: 'Cari bahan',
                    hintStyle: Styles.font.bsm.copyWith(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Styles.color.primary,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Styles.color.darkGreen,
                      ),
                    ),
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  await Future.delayed(const Duration(seconds: 1));
                  return ['test', 'test2'];
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion.toString()),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  ingredientNameController.text = suggestion.toString();
                  context.read<CreateRecipeCubit>().addIngredientInfo(
                        categoryIndex: widget.categoryIndex,
                        ingredientIndex: widget.ingredientIndex,
                        name: ingredientNameController.text,
                      );
                },
                errorBuilder: (context, error) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(error.toString()),
                  );
                },
                loadingBuilder: (context) {
                  return SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Styles.color.primary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 30,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<CreateRecipeCubit>().addIngredientInfo(
                            categoryIndex: widget.categoryIndex,
                            ingredientIndex: widget.ingredientIndex,
                            quantity: int.parse(value),
                          );
                    },
                    decoration: InputDecoration(
                      hintText: 'Jumlah',
                      hintStyle: Styles.font.bsm.copyWith(
                        color: Colors.grey[400],
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.color.primary,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.color.darkGreen,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                  child: TextField(
                    onChanged: (value) {
                      context.read<CreateRecipeCubit>().addIngredientInfo(
                            categoryIndex: widget.categoryIndex,
                            ingredientIndex: widget.ingredientIndex,
                            unit: value,
                          );
                    },
                    decoration: InputDecoration(
                      hintText: 'Satuan',
                      hintStyle: Styles.font.bsm.copyWith(
                        color: Colors.grey[400],
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.color.primary,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.color.darkGreen,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(Icons.edit_outlined),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              // height: 30,
              child: TextField(
                onChanged: (value) {
                  context.read<CreateRecipeCubit>().addIngredientInfo(
                        categoryIndex: widget.categoryIndex,
                        ingredientIndex: widget.ingredientIndex,
                        note: value,
                      );
                },
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Catatan',
                  hintStyle: Styles.font.bsm.copyWith(
                    color: Colors.grey[400],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Styles.color.primary,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Styles.color.darkGreen,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Styles.color.darkGreen,
          thickness: 1.5,
        ),
      ],
    );
  }
}
