import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../constants/styles.dart';
import '../cubit/create_recipe_cubit.dart';

class RecipePortion extends StatelessWidget {
  const RecipePortion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          BoxIcons.bx_bowl_rice,
          size: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          // width: 140,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  minLines: 1,
                  keyboardType: TextInputType.number,
                  style: Styles.font.bsm.copyWith(color: Colors.black),
                  onChanged: (value) {
                    context
                        .read<CreateRecipeCubit>()
                        .updateRecipeInfo(portion: int.parse(value));
                  },
                  decoration: InputDecoration(
                    hintText: 'Porsi',
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Styles.color.primary),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: Styles.font.bold.copyWith(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
