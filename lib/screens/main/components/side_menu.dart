import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';  // For social links

// ✅ FIXED: Added this import!
import 'package:flutter_profile/screens/cv/cv_screen.dart';

import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(title: "Residence", text: "Pakistan"),
                    AreaInfoText(title: "City", text: "Peshawar"),
                    AreaInfoText(title: "Age", text: "25"),

                    Skills(),
                    SizedBox(height: defaultPadding),

                    Coding(),
                    Knowledges(),

                    Divider(),
                    SizedBox(height: defaultPadding / 2),

                    // Download CV Button
                    TextButton.icon(
                      onPressed: () async {
                        String cvUrl = "https://your-cv-url.com/resume.pdf";
                        final uri = Uri.parse(cvUrl);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        }
                      },
                      icon: SvgPicture.asset("assets/icons/download.svg"),
                      label: Text(
                        "DOWNLOAD CV",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),

                    SizedBox(height: defaultPadding / 2),

                    // ✅ NEW: View Full CV Button (Fixed!)
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CVScreen()),
                        );
                      },
                      icon: Icon(Icons.description, color: primaryColor),
                      label: Text(
                        "VIEW FULL CV",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),

                          // LinkedIn
                          IconButton(
                            onPressed: () => _launchURL('https://linkedin.com/in/YOUR_PROFILE'),
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                            tooltip: "LinkedIn",
                          ),

                          // GitHub
                          IconButton(
                            onPressed: () => _launchURL('https://github.com/YOUR_USERNAME'),
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                            tooltip: "GitHub",
                          ),

                          // Twitter
                          IconButton(
                            onPressed: () => _launchURL('https://twitter.com/YOUR_HANDLE'),
                            icon: SvgPicture.asset("assets/icons/twitter.svg"),
                            tooltip: "Twitter",
                          ),

                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper function for launching URLs
void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}