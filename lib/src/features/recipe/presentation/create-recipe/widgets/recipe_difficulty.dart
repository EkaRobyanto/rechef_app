import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../constants/styles.dart';
import '../cubit/create_recipe_cubit.dart';

class RecipeDifficulty extends StatelessWidget {
  const RecipeDifficulty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          BoxIcons.bx_smile,
          size: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField(
            decoration: InputDecoration.collapsed(
              focusColor: Styles.color.primary,
              hintText: 'Tingkat Kesulitan',
              hintStyle: Styles.font.bold.copyWith(
                color: Colors.grey,
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Pemula',
                child: Text('Pemula'),
              ),
              DropdownMenuItem(
                value: 'Profesional',
                child: Text('Profesional'),
              ),
            ],
            onChanged: (value) {
              context
                  .read<CreateRecipeCubit>()
                  .updateRecipeInfo(difficulty: value);
            },
          ),
        )
      ],
    );
  }
}
