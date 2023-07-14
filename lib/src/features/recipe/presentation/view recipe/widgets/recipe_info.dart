import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../constants/styles.dart';

class RecipeInformation extends StatelessWidget {
  const RecipeInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color(0xFfE0E0E0),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          RecipeInfo(
            icon: BoxIcons.bx_time,
            value: '330',
            unit: 'Menit',
          ),
          RecipeInfo(
            icon: BoxIcons.bx_bowl_rice,
            value: '4',
            unit: 'Porsi',
          ),
          RecipeInfo(
            icon: BoxIcons.bx_walk,
            value: '468',
            unit: 'Kalori',
          ),
          RecipeInfo(
            icon: BoxIcons.bx_smile,
            value: '',
            unit: 'Pemula',
          ),
        ],
      ),
    );
  }
}

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({
    super.key,
    required this.icon,
    required this.value,
    required this.unit,
  });

  final IconData icon;
  final String value, unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text('$value ', style: Styles.font.base),
            Text(unit, style: Styles.font.base),
          ],
        ),
      ],
    );
  }
}
