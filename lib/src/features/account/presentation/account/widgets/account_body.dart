import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../../../shared/recipe_card.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(color: Styles.color.primary, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Boxicons.bx_book_alt),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Resep Saya',
                style: Styles.font.bsm,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 1,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const RecipeCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
