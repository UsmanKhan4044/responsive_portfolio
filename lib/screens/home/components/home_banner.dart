import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/responsive.dart';
import '../../../constants.dart';

// ==================== MAIN BANNER WIDGET ====================
class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "assets/images/bg.jpeg",
            fit: BoxFit.cover,
          ),

          // Dark Overlay
          Container(color: darkColor.withOpacity(0.66)),

          // Content Layer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Main Title Text
                Text(
                  "Discover my Amazing\nArt Space!",
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                      : Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // Spacing for mobile
                if (Responsive.isMobileLarge(context))
                  SizedBox(height: defaultPadding / 2),

                // Animated Text Section
                MyBuildAnimatedText(),

                SizedBox(height: defaultPadding),

                // CTA Button (hidden on small mobile)
                if (!Responsive.isMobileLarge(context))
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation or action here
                      print("Explore Now clicked!");
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 2,
                        vertical: defaultPadding,
                      ),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      "EXPLORE NOW",
                      style: TextStyle(color: darkColor),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== ANIMATED TEXT WIDGET ====================
class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // ✅ FIXED: Using modern Flutter 3.x text style
      style: Theme.of(context).textTheme.titleMedium!,
      maxLines: 1,
      child: Row(
        children: [
          // Show Flutter tags on larger screens only
          if (!Responsive.isMobileLarge(context)) FlutterCodedText(),
          if (!Responsive.isMobileLarge(context)) SizedBox(width: defaultPadding / 2),

          // Static text
          Text("I build "),

          // Animated typing text
          Responsive.isMobile(context)
              ? Expanded(child: AnimatedText())
              : AnimatedText(),

          // Closing Flutter tag on larger screens
          if (!Responsive.isMobileLarge(context)) SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) FlutterCodedText(),
        ],
      ),
    );
  }
}

// ==================== TYPING ANIMATION COMPONENT ====================
class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "complete e-Commerce app UI.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Chat app with dark and light theme.",
          speed: Duration(milliseconds: 60),
        ),
      ],
    );
  }
}

// ==================== FLUTTER CODE STYLE TEXT ====================
class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: primaryColor),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}