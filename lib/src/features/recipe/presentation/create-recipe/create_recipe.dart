import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/dark_icon_button.dart';

class CreateRecipe extends StatelessWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
