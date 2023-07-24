// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../constants/image_path.dart';
import '../../../../../constants/styles.dart';
import '../../../../../shared/shrink_widget.dart';
import '../cubit/create_recipe_cubit.dart';
import 'ingredient_item.dart';

class AddIngredients extends StatelessWidget {
  AddIngredients({
    super.key,
    required this.categoryIndex,
  });

  final int categoryIndex;
  final Map<String, dynamic> itemImage = {
    'Sayuran dan Biji-bijian': sayurBiji,
    'Daging dan Seafood': daging,
    'Olahan Susu dan Telur': susu,
    'Produk Bebas Susu dan Pengganti Daging': bebasSusu,
    'Rempah-rempah': rempah,
    'Sayuran': vegan,
    'Gula dan Pemanis': gulaPemanis,
    'Bahan Roti': bahanRoti,
    'Pasta': pasta,
    'Minyak, Cuka, dan Ekstrak': minyak,
    'Suplemen, Saus, dan Olesan': saus,
  };

  @override
  Widget build(BuildContext context) {
    var cubitState =
        context.read<CreateRecipeCubit>().recipe.ingredientCategories;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.color.accent,
                    ),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Image.asset(
                      itemImage[cubitState?[categoryIndex].name],
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    cubitState?[categoryIndex].name ?? 'error',
                    style: Styles.font.bold,
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<CreateRecipeCubit>()
                          .removeIngredientCategoriesAtIndex(categoryIndex);
                    },
                    icon: const Icon(
                      BoxIcons.bx_trash,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Styles.color.darkGreen,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: cubitState?[categoryIndex].ingredients?.length ?? 0,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, ingredientIndex) {
              return IngredientItem(
                ingredientIndex: ingredientIndex,
                categoryIndex: categoryIndex,
              );
            },
          ),
          ShrinkWidget(
            onTap: () {
              context.read<CreateRecipeCubit>().addIngredient(categoryIndex);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Styles.color.primary,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Tambah Bahan',
                  style: Styles.font.bsm,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
