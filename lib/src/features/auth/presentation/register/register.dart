import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles.dart';
import '../../../../routes/app_router.dart';
import '../../../../utills/loading_indicator.dart';
import '../../../../utills/show_scale_dialog.dart';
import '../../../shared/dialogs.dart';
import '../../../shared/shrink_button.dart';
import '../../../shared/text_input.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_states.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> doPop() async {
      await showScaledDialog(
        context,
        const CancelRegisDialog(),
      );
      return false;
    }

    return WillPopScope(
      onWillPop: () {
        FocusManager.instance.primaryFocus?.unfocus();
        return doPop();
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[100],
            leading: IconButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                await doPop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthRequest) {
                log(state.toString());
                log(state.props.toString());
                LoadingIndicator.show(context);
              } else if (state is UserRegistered) {
                log(state.toString());
                context.pop();
                // context.pop();
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    router.pushReplacementNamed('optionalRegistration');
                  },
                );
              } else if (state is AuthError) {
                log(state.toString());
                LoadingIndicator.hide(context);
                showScaledDialog(
                  context,
                  ErrorDialog(error: state.error),
                );
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (ctx, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Informasi Akun',
                            style: Styles.font.bxl3,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInput(
                            label: 'Nama',
                            hint: 'Sultan Kanjeng Romo',
                            validator: (value) {
                              if (nameController.text.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                            textController: nameController,
                          ),
                          TextInput(
                            label: 'Email',
                            hint: 'recheffuser@gmail.com',
                            validator: (value) {
                              if (emailController.text.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              return null;
                            },
                            textController: emailController,
                          ),
                          TextInput(
                            label: 'Kata Sandi',
                            hint: 'Password minimal berisi 6 karakter',
                            validator: (value) {
                              if (passwordController.text.isEmpty) {
                                return 'Kata sandi tidak boleh kosong';
                              } else if (passwordController.text.length < 6) {
                                return 'Kata sandi minimal berisi 6 karakter';
                              }
                              return null;
                            },
                            textController: passwordController,
                          ),
                          TextInput(
                            label: 'Konfirmasi Kata Sandi',
                            hint: 'Masukan kembali password',
                            validator: (value) {
                              if (confirmPasswordController.text.isEmpty) {
                                return 'Konfirmasi tidak boleh kosong';
                              }
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return 'Cek kembali password anda';
                              }
                              return null;
                            },
                            textController: confirmPasswordController,
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          SizedBox(
                            height: 45,
                            child: ShrinkButton(
                              text: 'Daftar',
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                // if (_formKey.currentState!.validate()) {
                                ctx.read<AuthBloc>().add(
                                      AuthRegist(
                                        {
                                          'name': nameController.text,
                                          'email': emailController.text,
                                          'password': passwordController.text,
                                        },
                                      ),
                                    );
                                // }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Sudah punya akun?'),
                              TextButton(
                                onPressed: () {
                                  doPop();
                                },
                                child: Text(
                                  'Masuk',
                                  style: Styles.font.bold.copyWith(
                                    color: Styles.color.primary,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
