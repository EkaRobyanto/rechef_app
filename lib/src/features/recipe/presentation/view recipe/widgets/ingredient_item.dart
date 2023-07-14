import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Styles.color.primary,
                  ),
                  child: Text(
                    'Daging sapi',
                    style: Styles.font.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.2,
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Styles.color.accent,
                ),
                child: Text(
                  '1 Kg',
                  style: Styles.font.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Catatan untuk bahan ',
                      style: Styles.font.sm,
                      children: [
                        TextSpan(
                          text: 'Daging sapi :',
                          style: Styles.font.bsm,
                        ),
                      ]),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: Styles.font.sm,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
