import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rechef_app/src/routes/app_router.dart';

import '../../constants/styles.dart';

class ExitAppDialog extends StatelessWidget {
  const ExitAppDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            style: Styles.font.bold.copyWith(color: Styles.color.danger),
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
    );
  }
}

class CancelRegisDialog extends StatelessWidget {
  const CancelRegisDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text('Batalkan Registrasi?'),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            router.pop();
            router.pop();
          },
          child: Text(
            "Ya",
            style: Styles.font.bold.copyWith(color: Styles.color.danger),
          ),
        ),
        TextButton(
          onPressed: () {
            router.pop();
          },
          child: Text(
            "Tidak",
            style: Styles.font.bold,
          ),
        ),
      ],
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Terjadi Kesalahan',
        style: Styles.font.bold,
      ),
      content: Text(error),
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
  }
}
