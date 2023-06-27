import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:im_stepper/stepper.dart';
import 'package:rechef_app/src/constants/image_path.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/auth/presentation/register/register_steps/cubit/select_gender_cubit.dart';
import 'package:rechef_app/src/routes/app_router.dart';

import 'choose_gender.dart';

class OptionalStep extends StatefulWidget {
  const OptionalStep({super.key});

  @override
  State<OptionalStep> createState() => _OptionalStepState();
}

class _OptionalStepState extends State<OptionalStep> {
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Lengkapi data dirimu',
            style: Styles.font.bold,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.8,
              child: NumberStepper(
                numbers: const [1, 2, 3],
                activeStepBorderColor: Colors.black,
                activeStepBorderWidth: 4,
                activeStepBorderPadding: 0,
                enableNextPreviousButtons: false,
                enableStepTapping: false,
                lineDotRadius: 2,
                lineColor: Styles.color.primary,
                numberStyle: Styles.font.bold,
                stepColor: Styles.color.accent,
                activeStep: 0,
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ChooseGender(
                    onBack: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    ),
                  ),
                  ChooseGender(
                    onBack: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
