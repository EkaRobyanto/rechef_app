import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rechef_app/src/features/recipe/presentation/create-recipe/cubit/create_recipe_cubit.dart';
import 'package:rechef_app/src/utills/show_scale_dialog.dart';

import '../../../../../constants/styles.dart';
import '../cubit/create_recipe_state.dart';

class PickRecipeImage extends StatelessWidget {
  const PickRecipeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRecipeCubit, CreateRecipeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showScaledDialog(
              context,
              AlertDialog(
                title: const Text('Pilih Gambar'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        context
                            .read<CreateRecipeCubit>()
                            .pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: const Text('Kamera'),
                    ),
                    ListTile(
                      onTap: () {
                        context
                            .read<CreateRecipeCubit>()
                            .pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      leading: const Icon(Icons.photo_library_outlined),
                      title: const Text('Galeri'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: context.read<CreateRecipeCubit>().recipe.image == null
              ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        size: 200,
                        color: Colors.grey,
                      ),
                      Text(
                        'Tambahkan Foto Makanan',
                        style: Styles.font.xl.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              : Image.file(
                  context.read<CreateRecipeCubit>().imageCubit!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        );
      },
    );
  }
}
