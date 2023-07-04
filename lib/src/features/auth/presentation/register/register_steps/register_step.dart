import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:im_stepper/stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/core/auth/bloc/auth_bloc.dart';
import 'package:rechef_app/src/core/auth/bloc/auth_event.dart';
import 'package:rechef_app/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:rechef_app/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:rechef_app/src/features/auth/presentation/register/bloc/register_state.dart';
import 'package:rechef_app/src/features/auth/presentation/register/register_steps/submit_registration.dart';
import 'package:rechef_app/src/shared/dialogs.dart';
import 'package:rechef_app/src/utills/loading_indicator.dart';
import 'package:rechef_app/src/utills/show_scale_dialog.dart';
import 'package:rechef_app/src/features/auth/presentation/register/register_steps/choose_interest.dart';
import 'choose_gender.dart';

class RegistrationStep extends StatefulWidget {
  const RegistrationStep({super.key, required this.registerbloc});

  final RegisterBloc registerbloc;

  @override
  State<RegistrationStep> createState() => _RegistrationStepState();
}

class _RegistrationStepState extends State<RegistrationStep> {
  final pageController = PageController(initialPage: 0);
  int? _currentPage;
  @override
  void initState() {
    _currentPage = 0;
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page?.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.registerbloc,
      child: WillPopScope(
        onWillPop: () {
          showScaledDialog(context, const CancelRegisDialog());
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                showScaledDialog(
                  context,
                  const CancelRegisDialog(),
                );
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
          body: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                LoadingIndicator.show(context);
              } else if (state is RegisterFailed) {
                LoadingIndicator.hide(context);
                showScaledDialog(
                  context,
                  ErrorDialog(error: state.error),
                );
              } else if (state is RegisterSuccess) {
                LoadingIndicator.hide(context);
                context.read<AuthBloc>().add(
                      UserRegistered(
                        email: context.read<RegisterBloc>().data.email ?? '',
                      ),
                    );
                context.goNamed('login');
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: NumberStepper(
                        lineDotRadius: 2,
                        numbers: const [1, 2, 3],
                        activeStepBorderWidth: 4,
                        enableStepTapping: false,
                        activeStep: _currentPage!,
                        activeStepBorderPadding: 0,
                        numberStyle: Styles.font.bold,
                        stepColor: Styles.color.accent,
                        lineColor: Styles.color.primary,
                        enableNextPreviousButtons: false,
                        activeStepColor: Styles.color.primary,
                        activeStepBorderColor: Colors.black,
                        stepReachedAnimationEffect: Curves.easeInOut,
                        stepReachedAnimationDuration:
                            const Duration(milliseconds: 400),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ChooseGender(
                            onCallBack: () {
                              context.read<RegisterBloc>().data.gender != null
                                  ? pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    )
                                  : null;
                            },
                          ),
                          ChooseInterest(
                            onCallBack: () => pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            ),
                            onCallPrev: () => pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            ),
                          ),
                          SubmitRegist(
                            onCallBack: () =>
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(SubmitRegistration()),
                            onCallPrev: () => pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
