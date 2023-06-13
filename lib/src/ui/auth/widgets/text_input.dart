import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class TextInput extends StatefulWidget {
  TextInput({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.textController,
  });

  final String label;
  final String hint;
  final String? Function(String?)? validator;
  TextEditingController textController;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Styles.font.bsm,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            style: Styles.font.bold,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.label.contains('Sandi') ? _isObsecure : false,
            validator: widget.validator,
            decoration: Styles.input.accent.copyWith(
              hintText: widget.hint,
              errorStyle: Styles.font.sm.copyWith(color: Styles.color.danger),
              suffixIcon: widget.label.contains('Sandi')
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      icon: Icon(
                        _isObsecure ? Icons.visibility : Icons.visibility_off,
                        color: Styles.color.hint,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
