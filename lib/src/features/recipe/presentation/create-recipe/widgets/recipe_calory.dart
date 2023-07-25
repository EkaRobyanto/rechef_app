import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../constants/styles.dart';
import '../cubit/create_recipe_cubit.dart';

class RecipeCalory extends StatelessWidget {
  const RecipeCalory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          BoxIcons.bx_walk,
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
                  keyboardType: TextInputType.number,
                  minLines: 1,
                  onChanged: (value) {
                    context
                        .read<CreateRecipeCubit>()
                        .updateRecipeInfo(kalori: int.parse(value));
                  },
                  style: Styles.font.bsm.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Kalori',
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
