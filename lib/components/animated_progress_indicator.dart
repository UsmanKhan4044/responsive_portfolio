import 'package:flutter/material.dart';
import '../constants.dart';

// ✅ CIRCULAR PROGRESS INDICATOR (FIXED)
class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: percentage),
            duration: defaultDuration,
            // ✅ FIXED: Proper type handling for Flutter 3.x
            builder: (context, value, child) {
              double animatedValue = (value as num).toDouble();
              return Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: animatedValue,
                    color: primaryColor,
                    backgroundColor: darkColor,
                  ),
                  Center(
                    child: Text(
                      "${(animatedValue * 100).toInt()}%",
                      // ✅ FIXED: subtitle1 → titleMedium
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // ✅ FIXED: subtitle2 → titleSmall
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

// ✅ LINEAR PROGRESS INDICATOR (FIXED)
class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: percentage),
        duration: defaultDuration,
        // ✅ FIXED: Type handling
        builder: (context, value, child) {
          double animatedValue = (value as num).toDouble();
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: TextStyle(color: Colors.white)),
                  Text("${(animatedValue * 100).toInt()}%"),
                ],
              ),
              SizedBox(height: defaultPadding / 2),
              LinearProgressIndicator(
                value: animatedValue,
                color: primaryColor,
                backgroundColor: darkColor,
              ),
            ],
          );
        },
      ),
    );
  }
}