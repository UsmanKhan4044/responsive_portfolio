import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

// ✅ IMPORT YOUR MODELS AND DATA
import '../../models/CVData.dart';
import '../../data/my_cv_data.dart';
import '../../constants.dart';

class CVScreen extends StatelessWidget {
  const CVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("My CV / Resume"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),

            SizedBox(height: defaultPadding * 2),

            _buildSectionTitle("Professional Summary"),
            _buildSummary(),

            SizedBox(height: defaultPadding * 2),

            _buildSectionTitle("Technical Skills"),
            _buildSkillsSection(),

            SizedBox(height: defaultPadding * 2),

            _buildSectionTitle("Work Experience"),
            ...myCVData.experiences.map((exp) => _buildExperienceCard(exp)),

            SizedBox(height: defaultPadding * 2),

            _buildSectionTitle("Education"),
            ...myCVData.educations.map((edu) => _buildEducationCard(edu)),

            if (myCVData.certifications.isNotEmpty) ...[
              SizedBox(height: defaultPadding * 2),
              _buildSectionTitle("Certifications"),
              ...myCVData.certifications.map((cert) => _buildCertCard(cert)),
            ],

            SizedBox(height: defaultPadding * 2),

            _buildDownloadButton(),

            SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultPadding * 1.5),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/images/IMG_7344.jpg"),
          ),
          SizedBox(height: 15),
          Text(
            myCVData.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryColor),
            ),
            child: Text(
              myCVData.title,
              style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),

          // Contact Info
          _buildInfoRow(Icons.email, myCVData.email),
          _buildInfoRow(Icons.phone, myCVData.phone),
          _buildInfoRow(Icons.location_on, myCVData.location),

          SizedBox(height: 15),

          // Social Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(Icons.link, myCVData.linkedin),
              SizedBox(width: 12),
              _buildSocialButton(Icons.code, myCVData.github),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.grey[400]),
        SizedBox(width: 6),
        Text(text, style: TextStyle(color: Colors.grey[400])),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return IconButton(
      onPressed: () => _launchURL(url),
      icon: Icon(icon, size: 22),
      color: Colors.grey[400],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 12),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Text(myCVData.summary.trim(), style: TextStyle(height: 1.6, color: Colors.grey[300], fontSize: 14)),
    );
  }

  Widget _buildSkillsSection() {
    Map<String, List<Skill>> categories = {};
    for (var skill in myCVData.skills) {
      if (!categories.containsKey(skill.category)) {
        categories[skill.category] = [];
      }
      categories[skill.category]!.add(skill);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.entries.map((entry) {
        return Padding(
          padding: EdgeInsets.only(bottom: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.key.toUpperCase(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor, letterSpacing: 1.2)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: entry.value.map((Skill skill) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: darkColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey[800]!)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(skill.name, style: TextStyle(fontSize: 13)),
                      SizedBox(width: 8),
                      Text("${(skill.level * 100).toInt()}%", style: TextStyle(fontSize: 11, color: _getSkillColor(skill.level), fontWeight: FontWeight.bold)),
                    ]),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getSkillColor(double level) {
    if (level >= 0.9) return Color(0xFF51cf66);
    if (level >= 0.75) return Color(0xFFfcc419);
    if (level >= 0.6) return Color(0xFFff922b);
    return Color(0xFFff6b6b);
  }

  Widget _buildExperienceCard(Experience exp) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: primaryColor, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(exp.role, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                child: Text(exp.duration, style: TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(exp.company, style: TextStyle(fontSize: 15, color: primaryColor, fontWeight: FontWeight.w500)),
          SizedBox(height: 12),
          ...exp.responsibilities.map((String resp) => Padding(
            padding: EdgeInsets.only(left: 8, bottom: 6),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("• ", style: TextStyle(color: primaryColor, fontSize: 16)),
              Expanded(child: Text(resp, style: TextStyle(color: Colors.grey[400], height: 1.5))),
            ]),
          )),
          SizedBox(height: 12),
          Wrap(spacing: 6, children: exp.technologies.map((String tech) => Chip(label: Text(tech, style: TextStyle(fontSize: 11)), backgroundColor: darkColor, labelStyle: TextStyle(color: Colors.grey[400]), visualDensity: VisualDensity.compact)).toList()),
        ],
      ),
    );
  }

  Widget _buildEducationCard(Education edu) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Icon(Icons.school_outlined, color: primaryColor, size: 24), SizedBox(width: 10), Expanded(child: Text(edu.degree, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)))]),
          SizedBox(height: 6),
          Text(edu.institution, style: TextStyle(fontSize: 15, color: primaryColor, fontWeight: FontWeight.w500)),
          SizedBox(height: 4),
          Row(children: [Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey[500]), SizedBox(width: 4), Text(edu.duration, style: TextStyle(color: Colors.grey[500], fontSize: 13))]),
          SizedBox(height: 12),
          Text(edu.field, style: TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic)),
          if (edu.achievements.isNotEmpty) ...[
            SizedBox(height: 10),
            ...edu.achievements.map((String ach) => Padding(padding: EdgeInsets.only(left: 8, bottom: 4), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("✓ ", style: TextStyle(color: Color(0xFF51cf66), fontSize: 14)), Expanded(child: Text(ach, style: TextStyle(color: Colors.grey[400], fontSize: 13)))]))),
          ],
        ],
      ),
    );
  }

  Widget _buildCertCard(Certification cert) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey[800]!)),
      child: Row(children: [
        Icon(Icons.workspace_premium_outlined, color: primaryColor, size: 28),
        SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(cert.name, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
          SizedBox(height: 4),
          Text(cert.issuer, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          SizedBox(height: 2),
          Row(children: [Icon(Icons.event_outlined, size: 12, color: Colors.grey[600]), SizedBox(width: 4), Text(cert.date, style: TextStyle(color: Colors.grey[600], fontSize: 12))]),
        ])),
        Icon(Icons.verified, color: Color(0xFF51cf66), size: 24),
      ]),
    );
  }

  Widget _buildDownloadButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () async {
          String cvUrl = "https://your-cv-url-here.com/resume.pdf";
          final uri = Uri.parse(cvUrl);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            print("CV URL not configured");
          }
        },
        icon: SvgPicture.asset("assets/icons/download.svg", width: 22, height: 22),
        label: Text("DOWNLOAD FULL CV (PDF)", style: TextStyle(color: darkColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}