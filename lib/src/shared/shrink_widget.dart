import 'package:flutter/material.dart';

class ShrinkWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;

  const ShrinkWidget({this.onTap, required this.child});

  @override
  _ShrinkWidgetState createState() => _ShrinkWidgetState();
}

class _ShrinkWidgetState extends State<ShrinkWidget>
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
        child: widget.child,
      ),
    );
  }
}
