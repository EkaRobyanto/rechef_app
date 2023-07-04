import 'package:flutter/material.dart';

import '../../../../../../constants/image_path.dart';
import 'interest_bubble.dart';

class InterestBubbles extends StatelessWidget {
  const InterestBubbles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 575,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 110,
            top: 20,
            child: InterestBubble(
              image: seafood,
              value: 'Seafood',
              size: 100,
            ),
          ),
          Positioned(
            right: 70,
            child: InterestBubble(
              image: japanese,
              value: 'Japanese',
              size: 120,
            ),
          ),
          Positioned(
            left: 30,
            top: 100,
            child: InterestBubble(
              image: dairyFree,
              value: 'Non Susu',
              size: 120,
            ),
          ),
          Positioned(
            left: 155,
            top: 120,
            child: InterestBubble(
              image: vegan,
              value: 'Sayuran',
              size: 100,
            ),
          ),
          Positioned(
            right: 40,
            top: 130,
            child: InterestBubble(
              image: bakery,
              value: 'Bakery',
              size: 110,
            ),
          ),
          Positioned(
            left: 50,
            bottom: 240,
            child: InterestBubble(
              image: burger,
              value: 'Fast Food',
              size: 110,
            ),
          ),
          Positioned(
            left: 160,
            bottom: 240,
            child: InterestBubble(
              image: indian,
              value: 'Indian',
              size: 110,
            ),
          ),
          Positioned(
            right: 20,
            bottom: 200,
            child: InterestBubble(
              image: boil,
              value: 'Rebus',
              size: 120,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 130,
            child: InterestBubble(
              image: fried,
              value: 'Goreng',
              size: 110,
            ),
          ),
          Positioned(
            left: 130,
            bottom: 120,
            child: InterestBubble(
              image: pasta,
              value: 'Pasta',
              size: 110,
            ),
          ),
          Positioned(
            right: 50,
            bottom: 80,
            child: InterestBubble(
              image: barbeque,
              value: 'Bakar',
              size: 120,
            ),
          ),
          Positioned(
            left: 30,
            bottom: 20,
            child: InterestBubble(
              image: homecook,
              value: 'Homecook',
              size: 100,
            ),
          ),
          Positioned(
            right: 160,
            bottom: 0,
            child: InterestBubble(
              image: pro,
              value: 'Profesonal',
              size: 110,
            ),
          ),
        ],
      ),
    );
  }
}
