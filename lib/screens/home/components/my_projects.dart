import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/responsive.dart';
import '../../../constants.dart';
import 'project_card.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My Projects", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: defaultPadding),

        // 1. First, try to load from Firestore
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('projects')
              .snapshots()   // no orderBy to avoid index errors
              .handleError((error) {
            debugPrint('🔥 STREAM ERROR: $error');
          }),
          builder: (context, snapshot) {
            // Print state for debugging
            debugPrint('📡 Stream state: ${snapshot.connectionState}, error: ${snapshot.hasError}, data: ${snapshot.hasData}');

            // Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: primaryColor));
            }

            // Error
            if (snapshot.hasError) {
              debugPrint('❌ Firestore error: ${snapshot.error}');
              return _buildDemoFallback(context);
            }

            // No data or empty
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              debugPrint('📭 No documents in Firestore, using demo data.');
              return _buildDemoFallback(context);
            }

            // Success – build from Firestore
            debugPrint('✅ ${snapshot.data!.docs.length} projects loaded from Firestore');
            var projects = snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return Project(
                id: doc.id,
                title: data['title'] ?? 'Untitled',
                description: data['description'] ?? '',
                imageUrl: data['imageUrl'],
                projectUrl: data['projectUrl'],
              );
            }).toList();

            return _buildGrid(context, projects);
          },
        ),
      ],
    );
  }

  // Build the responsive grid
  Widget _buildGrid(BuildContext context, List<Project> projects) {
    return Responsive(
      mobile: ProjectsGridView(
        crossAxisCount: 1,
        childAspectRatio: 1.7,
        projects: projects,
      ),
      mobileLarge: ProjectsGridView(
        crossAxisCount: 2,
        projects: projects,
      ),
      tablet: ProjectsGridView(
        childAspectRatio: 1.1,
        projects: projects,
      ),
      desktop: ProjectsGridView(projects: projects),
    );
  }

  // Fallback widget when Firestore fails or is empty
  Widget _buildDemoFallback(BuildContext context) {
    return Column(
      children: [
        _buildGrid(context, demo_projects),
        SizedBox(height: defaultPadding / 2),
        Text(
          "⚠️ Showing demo data – Firebase collection 'projects' empty or permission denied.",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
    required this.projects,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }
}