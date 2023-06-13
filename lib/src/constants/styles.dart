import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final color = _Color();
  static final font = _Font();
  static final button = _Btn(font, color);
  static final input = _Input(color);
  static final decor = _Decor();

  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.encodeSansSemiCondensed().fontFamily,
  );
}

class _Color {
  Color get primary => const Color(0xFF5FD068);
  Color get accent => const Color(0xFFF5DF99);
  Color get danger => const Color(0xFFFD312E);
  Color get hint => Colors.black.withOpacity(0.3);
}

class _Font {
  static final TextStyle _default =
      GoogleFonts.encodeSansSemiCondensed(color: Colors.black);
  static final _bold = _default.copyWith(fontWeight: FontWeight.w600);

  TextStyle get xsm => _default.copyWith(fontSize: 12);
  TextStyle get sm => _default.copyWith(fontSize: 14);
  TextStyle get base => _default.copyWith(fontSize: 16);
  TextStyle get lg => _default.copyWith(fontSize: 18);
  TextStyle get xl => _default.copyWith(fontSize: 20);
  TextStyle get xl2 => _default.copyWith(fontSize: 22);
  TextStyle get xl3 => _default.copyWith(fontSize: 24);
  //
  TextStyle get bxsm => _bold.copyWith(fontSize: 12);
  TextStyle get bsm => _bold.copyWith(fontSize: 14);
  TextStyle get bold => _bold.copyWith(fontSize: 16);
  TextStyle get blg => _bold.copyWith(fontSize: 18);
  TextStyle get bxl => _bold.copyWith(fontSize: 20);
  TextStyle get bxl2 => _bold.copyWith(fontSize: 22);
  TextStyle get bxl3 => _bold.copyWith(fontSize: 24);
  TextStyle get bxl4 => _bold.copyWith(fontSize: 28);
  TextStyle get bxl5 => _bold.copyWith(fontSize: 32);
  TextStyle get bxl6 => _bold.copyWith(fontSize: 36);
}

class _Input {
  late _Color _color;

  _Input(_Color color) {
    _color = color;
  }

  InputDecoration get accent => InputDecoration(
        hintStyle: TextStyle(color: _color.hint),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        isDense: true,
        filled: true,
        fillColor: _color.accent,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      );
}

class _Decor {
  BoxShadow get underShadow => const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        blurRadius: 4,
        spreadRadius: 0,
        offset: Offset(0, 4),
      );

  BoxShadow get spreadShadow => const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.4),
        blurRadius: 10,
        spreadRadius: 0,
        offset: Offset(0, 0),
      );
}

class _Btn {
  late _Color _color;
  late _Font _typo;

  _Btn(_Font typo, _Color color) {
    _typo = typo;
    _color = color;
  }

  ButtonStyle get primary => ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        backgroundColor: _color.primary,
        foregroundColor: Colors.white,
        side: BorderSide(color: _color.primary),
        textStyle: _typo.bsm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  ButtonStyle get primarySm => primary.copyWith(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      );

  ButtonStyle get primaryShadow => primary.copyWith(
        elevation: MaterialStateProperty.all(4),
      );

  ButtonStyle get primaryOutline => primary.copyWith(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(_color.primary),
      );

  ButtonStyle get primaryOutlineSm => primaryOutline.copyWith(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10),
        ),
      );

  ButtonStyle get danger => primary.copyWith(
        backgroundColor: MaterialStateProperty.all(_color.danger),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        side: MaterialStateProperty.all(
          BorderSide(color: _color.danger),
        ),
      );
}
