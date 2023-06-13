import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/constants/image_path.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/ui/auth/widgets/oauth_button.dart';
import 'package:rechef_app/src/ui/auth/widgets/shrink_button.dart';

import 'widgets/text_input.dart';

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
    return Scaffold(
      body: Center(
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
                    border: Border.all(
                      color: Styles.color.primary,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextInput(
                          label: 'Kata Sandi',
                          hint: '******',
                          validator: (value) {
                            if (_passwordController.text == '') {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                          textController: _passwordController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Belum punya akun? ',
                              style: Styles.font.bsm,
                            ),
                            InkWell(
                              onTap: () {},
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
                          height: 15,
                        ),
                        Center(child: Text('Atau', style: Styles.font.bold)),
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
                          height: 15,
                        ),
                        const SizedBox(
                          height: 40,
                          child: ShrinkButton(text: 'Masuk'),
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
                                  style: TextStyle(color: Styles.color.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                const TextSpan(text: ' dan telah membaca '),
                                TextSpan(
                                  text: 'Kebijakan Privasi',
                                  style: TextStyle(color: Styles.color.primary),
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
    );
  }
}
