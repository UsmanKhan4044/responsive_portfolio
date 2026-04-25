import 'package:flutter/material.dart';
import '../constants.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    Key? key,
    required this.value,
    this.text,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  final int value;
  final String? text;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: duration,
      builder: (context, value, child) {
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$value',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (text != null)
                TextSpan(
                  text: text,
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}