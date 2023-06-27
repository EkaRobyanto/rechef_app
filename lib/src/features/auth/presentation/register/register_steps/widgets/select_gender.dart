import 'package:flutter/material.dart';

import '../../../../../../constants/image_path.dart';
import 'select_gender_card.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({
    super.key,
  });

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SelectGenderCard(
          image: genderMale,
          value: 'Laki-laki',
        ),
        SelectGenderCard(
          image: genderFemale,
          value: 'Perempuan',
        ),
      ],
    );
  }
}
