import 'package:flutter/material.dart';
import 'package:flutter_profile/components/animated_counter.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';

class HighLightsInfo extends StatelessWidget {
  const HighLightsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? Column(children: [
        _buildStatCard(
          context,
          icon: Icons.code,
          iconColor: Color(0xFF61DAFB),
          value: 8,
          suffix: "+",
          label: "Technologies Mastered",
          onTap: () => _showMessage(context, 'Skills'),
          animationDelay: 0,
        ),
        SizedBox(height: defaultPadding),
        _buildStatCard(
          context,
          icon: Icons.phone_android,
          iconColor: Color(0xFF4CAF50),
          value: 5,
          suffix: "+",
          label: "Mobile Apps Built",
          onTap: () => _showMessage(context, 'Projects'),
          animationDelay: 200,
        ),
        SizedBox(height: defaultPadding),
        _buildStatCard(
          context,
          icon: Icons.web,
          iconColor: Color(0xFF2196F3),
          value: 3,
          suffix: "+",
          label: "Web Applications",
          onTap: () => _showMessage(context, 'Projects'),
          animationDelay: 400,
        ),
        SizedBox(height: defaultPadding),
        _buildStatCard(
          context,
          icon: Icons.developer_mode,
          iconColor: Colors.white,
          value: 150,
          suffix: "+",
          label: "GitHub Commits",
          onTap: () => _launchGitHub(),
          animationDelay: 600,
        ),
      ])
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: defaultPadding / 2),
              child: _buildStatCard(
                context,
                icon: Icons.code,
                iconColor: Color(0xFF61DAFB),
                value: 8,
                suffix: "+",
                label: "Technologies Mastered",
                onTap: () => _showMessage(context, 'Skills'),
                animationDelay: 0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: defaultPadding / 2),
              child: _buildStatCard(
                context,
                icon: Icons.phone_android,
                iconColor: Color(0xFF4CAF50),
                value: 5,
                suffix: "+",
                label: "Mobile Apps Built",
                onTap: () => _showMessage(context, 'Projects'),
                animationDelay: 200,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: defaultPadding / 2),
              child: _buildStatCard(
                context,
                icon: Icons.web,
                iconColor: Color(0xFF2196F3),
                value: 3,
                suffix: "+",
                label: "Web Applications",
                onTap: () => _showMessage(context, 'Projects'),
                animationDelay: 400,
              ),
            ),
          ),
          Expanded(
            child: _buildStatCard(
              context,
              icon: Icons.developer_mode,
              iconColor: Colors.white,
              value: 150,
              suffix: "+",
              label: "GitHub Commits",
              onTap: () => _launchGitHub(),
              animationDelay: 600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      BuildContext context, {
        required IconData icon,
        required Color iconColor,
        required int value,
        required String suffix,
        required String label,
        required VoidCallback onTap,
        required int animationDelay,
      }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + animationDelay),
      curve: Curves.easeOutBack,
      builder: (context, animValue, child) {
        return Transform.scale(
          scale: animValue,
          child: Opacity(
            opacity: animValue,
            child: GestureDetector(
              onTap: onTap,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: primaryColor.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated rotating icon
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 1200 + animationDelay),
                        builder: (context, rotationValue, child) {
                          return Transform.rotate(
                            angle: rotationValue * 6.28,
                            child: Icon(
                              icon,
                              size: 32,
                              color: iconColor,
                            ),
                          );
                        },
                      ),

                      SizedBox(height: defaultPadding / 2),

                      // Animated Counter
                      AnimatedCounter(
                        value: value,
                        text: suffix,
                        duration: Duration(seconds: 2),
                      ),

                      SizedBox(height: defaultPadding / 4),

                      // Label
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.grey[400],
                          fontSize: Responsive.isMobileLarge(context) ? 12 : 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMessage(BuildContext context, String section) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigate to $section section'),
        backgroundColor: primaryColor,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _launchGitHub() async {
    final uri = Uri.parse('https://github.com/UsmanKhan4044/responsive_portfolio');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}