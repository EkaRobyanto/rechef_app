import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_cubit.dart';

import '../../../../../constants/styles.dart';
import '../../../../../shared/shrink_widget.dart';
import '../cubit/create_recipe_state.dart';

class AddMethod extends StatelessWidget {
  const AddMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<CreateRecipeCubit, CreateRecipeState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      context.read<CreateRecipeCubit>().recipe.method?.length ??
                          0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                            child: Text(
                              '${(index + 1).toString()}.',
                              style: Styles.font.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            child: TextField(
                              onChanged: (value) {
                                context
                                    .read<CreateRecipeCubit>()
                                    .updateMethod(index, value);
                              },
                              decoration: InputDecoration(
                                hintText: 'Masukkan Metode',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Styles.color.darkGreen,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Styles.color.primary,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ShrinkWidget(
                            onTap: () {
                              context
                                  .read<CreateRecipeCubit>()
                                  .removeMethod(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Styles.color.primary,
                              ),
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.delete,
                                size: 20,
                                color: Styles.color.accent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ShrinkWidget(
              onTap: () {
                context.read<CreateRecipeCubit>().addMethod();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Styles.color.primary,
                      ),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tambah Metode',
                      style: Styles.font.blg,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }
}
