import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/features/auth/repository/auth_repository_impl.dart';

import '../../../constants/image_path.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_router.dart';
import '../../../utills/loading_indicator.dart';
import '../../shared/dialogs.dart';
import '../../shared/shrink_button.dart';
import '../../shared/text_input.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_states.dart';
import 'register/widgets/oauth_button.dart';

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
    void _submit() {
      if (_formKey.currentState!.validate()) {
        var data = {
          'email': _emailController.text,
          'password': _passwordController.text,
        };
        context.read<AuthBloc>().add(
              AuthLogin(data),
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
            create: (context) => AuthBloc(
              authRepository:
                  RepositoryProvider.of<AuthRepositoryImpl>(context),
            ),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthRequest) {
                  LoadingIndicator.show(context);
                } else if (state is UserLoggedIn) {
                  LoadingIndicator.hide(context);
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      context.goNamed('home');
                    },
                  );
                } else if (state is AuthError) {
                  LoadingIndicator.hide(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          state.error,
                          style: Styles.font.bold,
                        ),
                        content: Text(state.error),
                        actions: [
                          InkWell(
                            child: Text(
                              'Ok',
                              style: Styles.font.bsm.copyWith(
                                color: Styles.color.primary,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
              },
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
                                        router.push('/auth/register');
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
                                Center(
                                    child:
                                        Text('Atau', style: Styles.font.bold)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OAuthButton(
                                      asset: googleAuth,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    OAuthButton(
                                      asset: facebookAuth,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: ShrinkButton(
                                    text: 'Masuk',
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      _submit();
                                    },
                                  ),
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
                                      ]),
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
