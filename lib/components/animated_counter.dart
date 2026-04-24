import 'package:flutter/material.dart';
import '../constants.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    Key? key,
    required this.value,
    this.text,
  }) : super(key: key);

  final int value;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: defaultDuration,
      builder: (context, value, child) => Text(
        "$value$text",
        // ✅ FIXED: headline6 → titleLarge
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: primaryColor),
      ),
    );
  }
}