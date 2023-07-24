// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../constants/image_path.dart';
import '../../../../../constants/styles.dart';
import '../../../domain/ingredient_category/ingredient_category.dart';
import '../cubit/create_recipe_cubit.dart';
import 'category_card.dart';

class ChooseIngredientCategory extends StatelessWidget {
  ChooseIngredientCategory({
    super.key,
    required this.ingredientCategory,
    required this.categoryIndex,
  });

  IngredientCategory ingredientCategory;
  int categoryIndex;
  final List<Map<String, dynamic>> _categoryItems = [
    {
      'pic': sayurBiji,
      'name': 'Sayuran dan Biji-bijian',
    },
    {
      'pic': daging,
      'name': 'Daging dan Seafood',
    },
    {
      'pic': susu,
      'name': 'Olahan Susu dan Telur',
    },
    {
      'pic': bebasSusu,
      'name': 'Produk Bebas Susu dan Pengganti Daging',
    },
    {
      'pic': rempah,
      'name': 'Rempah-rempah',
    },
    {
      'pic': vegan,
      'name': 'Sayuran',
    },
    {
      'pic': gulaPemanis,
      'name': 'Gula dan Pemanis',
    },
    {
      'pic': bahanRoti,
      'name': 'Bahan Roti',
    },
    {
      'pic': pasta,
      'name': 'Pasta',
    },
    {
      'pic': minyak,
      'name': 'Minyak, Cuka, dan Ekstrak',
    },
    {
      'pic': saus,
      'name': 'Suplemen, Saus, dan Olesan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Styles.color.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Kategori Bahan',
                    style: Styles.font.blg,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<CreateRecipeCubit>()
                          .removeIngredientCategoriesAtIndex(categoryIndex);
                    },
                    child: const Icon(
                      BoxIcons.bx_trash,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Styles.color.darkGreen,
                thickness: 1.5,
              ),
              SizedBox(
                height: 275,
                child: ListView.builder(
                  itemCount: _categoryItems.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CategoryCard(
                      categoryItem: _categoryItems[i],
                      categoryIndex: categoryIndex,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
