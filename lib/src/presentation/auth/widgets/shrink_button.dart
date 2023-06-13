import 'package:flutter/material.dart';
import 'package:rechef_app/src/constants/styles.dart';

class ShrinkButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const ShrinkButton({required this.text, this.onTap});

  @override
  _ShrinkButtonState createState() => _ShrinkButtonState();
}

class _ShrinkButtonState extends State<ShrinkButton>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 50;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.delayed(
            const Duration(milliseconds: clickAnimationDurationMillis));
        _shrinkButtonSize();
        _restoreButtonSize();
        widget.onTap?.call();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: Container(
          decoration: BoxDecoration(
            color: Styles.color.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: Styles.font.bold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
