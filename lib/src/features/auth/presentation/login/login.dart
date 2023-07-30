import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/core/bloc/auth_event.dart';

import 'package:rechef_app/src/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:rechef_app/src/features/auth/presentation/login/bloc/login_event.dart';
import 'package:rechef_app/src/features/auth/presentation/login/bloc/login_state.dart';
import 'package:rechef_app/src/utills/loading_indicator.dart';
import 'package:rechef_app/src/utills/show_scale_dialog.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../constants/styles.dart';
import '../../../../core/bloc/auth_bloc.dart';
import '../../../../core/bloc/auth_states.dart';

import '../../../../core/repository/storage_repository.dart';
import '../../../../shared/dialogs.dart';
import '../../../../shared/shrink_button.dart';
import '../../../../shared/text_input.dart';

import '../../../../core/repository/auth_repository_impl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _submit(BuildContext ctx) {
      if (_formKey.currentState!.validate()) {
        BlocProvider.of<LoginBloc>(ctx, listen: false).add(
          LoginRequest(
            _emailController.text,
            _passwordController.text,
          ),
        );
      }
    }

    Future<bool> _doPop() async {
      await showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) => Container(),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          var curve = Curves.easeInOut.transform(animation.value);
          return Transform.scale(
            scale: curve,
            child: const ExitAppDialog(),
          );
        },
      );
      return false;
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => _doPop(),
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: BlocProvider(
            create: (context) => LoginBloc(
              RepositoryProvider.of<AuthRepositoryImpl>(context),
              RepositoryProvider.of<StorageRepository>(context),
            ),
            child: MultiBlocListener(
              listeners: [
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      LoadingIndicator.show(context);
                    } else if (state is LoginFailed) {
                      LoadingIndicator.hide(context);
                      showScaledDialog(
                          context, ErrorDialog(error: state.message));
                    } else if (state is LoginSuccess) {
                      LoadingIndicator.hide(context);
                      context.read<AuthBloc>().add(UserLoggedIn());
                    }
                  },
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterSucces) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: "Registrasi Berhasil!\nSilahkan Login",
                          icon: Icon(
                            Icons.soup_kitchen_rounded,
                            size: 120,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      );
                    }
                    if (state is Authenticated) {
                      context.goNamed('home');
                    }
                  },
                ),
              ],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masuk',
                          style: Styles.font.bxl6,
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextInput(
                                  label: 'Email',
                                  hint: 'rechefuser@gmail.com',
                                  validator: (value) {
                                    if (_emailController.text == '') {
                                      return 'Email tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  textController: _emailController,
                                ),
                                TextInput(
                                  label: 'Kata Sandi',
                                  hint: '******',
                                  validator: (value) {
                                    if (_passwordController.text == '') {
                                      return 'Kata sandi tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  textController: _passwordController,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Belum punya akun? ',
                                      style: Styles.font.bsm,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.pushNamed('register');
                                      },
                                      child: Text(
                                        'Daftar',
                                        style: Styles.font.bold.copyWith(
                                          color: Styles.color.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                // const OAuthOptions(),
                                const SizedBox(
                                  height: 50,
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (ctx, state) {
                                    return SizedBox(
                                      height: 40,
                                      child: ShrinkButton(
                                        text: 'Masuk',
                                        onTap: () {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          _submit(ctx);
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        'Dengan melanjutkan salah satu opsi berikut, Anda menyetujui ',
                                    style: Styles.font.bxsm,
                                    children: [
                                      TextSpan(
                                        text: 'Persyaratan Layanan',
                                        style: TextStyle(
                                            color: Styles.color.primary),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                          text: ' dan telah membaca '),
                                      TextSpan(
                                        text: 'Kebijakan Privasi',
                                        style: TextStyle(
                                            color: Styles.color.primary),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(text: ' kami.'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
