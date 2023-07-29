import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_state.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/widgets/create_recipe_tabbar.dart';
import 'package:rechef_app/src/features/recipe/repository/recipe_repository_impl.dart';

import '../../../../core/repository/storage_repository.dart';
import '../../../../shared/dark_icon_button.dart';
import 'cubit/create_recipe_cubit.dart';
import 'widgets/input_recipe_information.dart';
import 'widgets/pick_recipe_image.dart';

class CreateRecipe extends StatelessWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRecipeCubit(
        recipeRepositoryImpl: context.read<RecipeRepositoryImpl>(),
        storageRepository: context.read<StorageRepository>(),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Styles.color.primary,
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: DarkIconButton(
                icon: Icons.arrow_back,
                onTap: () {
                  context.pop();
                },
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: BlocListener<CreateRecipeCubit, CreateRecipeState>(
              listener: (context, state) {},
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PickRecipeImage(),
                    SizedBox(
                      height: 15,
                    ),
                    InputRecipeInformation(),
                    CreateRecipeTabBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
