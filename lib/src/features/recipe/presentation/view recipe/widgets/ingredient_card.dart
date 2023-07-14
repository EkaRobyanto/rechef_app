import 'package:flutter/material.dart';

import '../../../../../constants/image_path.dart';
import '../../../../../constants/styles.dart';
import 'ingredient_item.dart';

class IngredientCard extends StatefulWidget {
  const IngredientCard({
    super.key,
  });

  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Styles.color.darkGreen,
        ),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          iconColor: Styles.color.darkGreen,
          childrenPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Styles.color.accent,
                backgroundImage: Image.asset(daging).image,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Daging dan Seafood',
                style: Styles.font.bold,
              )
            ],
          ),
          children: [
            Column(
              children: [
                Divider(
                  color: Styles.color.darkGreen,
                  thickness: 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nama Bahan',
                      style: Styles.font.bold,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Jumlah',
                        style: Styles.font.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => const IngredientItem(),
                ),
                // const IngredientItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
