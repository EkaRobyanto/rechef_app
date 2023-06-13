import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/blocs/auth/auth_bloc.dart';
import 'package:rechef_app/src/blocs/auth/auth_event.dart';
import 'package:rechef_app/src/blocs/auth/auth_states.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/presentation/auth/widgets/shrink_button.dart';
import 'package:rechef_app/src/presentation/auth/widgets/text_input.dart';
import 'package:rechef_app/src/repo/auth/auth_repository.dart';
import 'package:rechef_app/src/utills/loading_indicator.dart';

import '../../../routes/routes/app_router.dart';
import '../widgets/dialogs.dart';

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
    void _submit(ctx) {
      // if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(ctx).add(AuthRegist('tes'));
      // }
    }

    Future<bool> _doPop() async {
      await showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) => Container(),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          var curve = Curves.easeInOut.transform(animation.value);
          return Transform.scale(
            scale: curve,
            child: const CancelRegisDialog(),
          );
        },
      );
      return false;
    }

    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: RepositoryProvider.of<AuthRepository>(context),
      ),
      child: WillPopScope(
        onWillPop: () {
          FocusManager.instance.primaryFocus?.unfocus();
          return _doPop();
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
                  await _doPop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthRequest) {
                  LoadingIndicator.show(context);
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is UserRegistered) {
                    LoadingIndicator.hide(context);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      router.pushReplacement('/auth/optionalRegistration');
                    });
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
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
                                  _submit(context);
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sudah punya akun?'),
                                TextButton(
                                  onPressed: () {
                                    _doPop();
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
      ),
    );
  }
}
