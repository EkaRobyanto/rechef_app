import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/constants/image_path.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/home/presentation/widgets/recipe_category_card.dart';
import 'package:rechef_app/src/shared/recipe_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    //rebusan, tumisan, gorengan, bakaran,
// daging, sayuran, buah, produk susu
// non susu, mie dan pasta, saus, snack
// fast food, bakery, chinese, korean,
// timur tengah, thai, indian, western,
// japanese, seafood, nasi, minuman

    List<Map<String, dynamic>> _categoryItems = [
      {
        'pic': boil,
        'name': 'Rebusan',
      },
      {
        'pic': tumis,
        'name': 'Tumisan',
      },
      {
        'pic': fried,
        'name': 'Gorengan',
      },
      {
        'pic': barbeque,
        'name': 'Bakaran',
      },
      {
        'pic': daging,
        'name': 'Daging',
      },
      {
        'pic': vegan,
        'name': 'Sayuran',
      },
      {
        'pic': buah,
        'name': 'Buah',
      },
      {
        'pic': susu,
        'name': 'Produk Susu',
      },
      {
        'pic': dairyFree,
        'name': 'Non Susu',
      },
      {
        'pic': pasta,
        'name': 'Mie dan Pasta',
      },
      {
        'pic': saus,
        'name': 'Saus',
      },
      {
        'pic': snack,
        'name': 'Snack',
      },
      {
        'pic': burger,
        'name': 'Fast Food',
      },
      {
        'pic': bakery,
        'name': 'Bakery',
      },
      {
        'pic': cino,
        'name': 'Chinese',
      },
      {
        'pic': korean,
        'name': 'Korean',
      },
      {
        'pic': timurTengah,
        'name': 'Timur Tengah',
      },
      {
        'pic': thai,
        'name': 'Thai',
      },
      {
        'pic': indian,
        'name': 'Indian',
      },
      {
        'pic': western,
        'name': 'Western',
      },
      {
        'pic': japanese,
        'name': 'Japanese',
      },
      {
        'pic': seafood,
        'name': 'Seafood',
      },
      {
        'pic': nasi,
        'name': 'Nasi',
      },
      {
        'pic': minuman,
        'name': 'Minuman',
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            size: 30,
            Icons.arrow_back_rounded,
            color: Styles.color.darkGreen,
          ),
        ),
        title: Text(
          'Kategori',
          style: Styles.font.blg,
        ),
      ),
      body: SizedBox(
        height: _categoryItems.length / 4 * 200,
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
          ),
          itemCount: _categoryItems.length,
          itemBuilder: (context, index) => RecipeCategoryCard(
            image: _categoryItems[index]['pic'],
            name: _categoryItems[index]['name'],
          ),
        ),
      ),
    );
  }
}
