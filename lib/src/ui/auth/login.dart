import 'dart:io';

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
    void _submit() {
      if (_formKey.currentState!.validate()) {
        print('sip');
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
            child: AlertDialog(
              title: const Center(child: Text('Keluar dari aplikasi?')),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    exit(0);
                  },
                  child: Text(
                    "Ya",
                    style:
                        Styles.font.bold.copyWith(color: Styles.color.danger),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Tidak",
                    style: Styles.font.bold,
                  ),
                ),
              ],
            ),
          );
        },
      );
      return false;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () => _doPop(),
        child: Scaffold(
          backgroundColor: Colors.grey[100],
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
                            const SizedBox(
                              height: 10,
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
                                  onTap: () {
                                    context.push('/auth/register');
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
                                child: Text('Atau', style: Styles.font.bold)),
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
                                    FocusScope.of(context).unfocus();
                                    _submit();
                                  }),
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
                                    const TextSpan(text: ' dan telah membaca '),
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
    );
  }
}
