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

        // 🔥 REAL-TIME DATA FROM FIREBASE
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('projects').snapshots(),
          builder: (context, snapshot) {

            // Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding * 2),
                  child: CircularProgressIndicator(color: primaryColor),
                ),
              );
            }

            // Error state
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 60, color: Colors.red),
                      SizedBox(height: defaultPadding),
                      Text("Error loading projects", style: TextStyle(color: Colors.red)),
                      SizedBox(height: defaultPadding / 2),
                      Text(
                        "${snapshot.error}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Empty state
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding * 2),
                  child: Column(
                    children: [
                      Icon(Icons.folder_open, size: 60, color: Colors.grey),
                      SizedBox(height: defaultPadding),
                      Text("No projects yet", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: defaultPadding / 2),
                      Text(
                        "Add projects in Firebase Console",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );
            }

            // ✅ SUCCESS: Build project list from Firebase
            // FIXED: Proper type casting
            var projects = snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

              return Project(
                id: doc.id,
                title: data['title'] ?? 'Untitled',
                description: data['description'] ?? 'No description',
                imageUrl: data['imageUrl'],
                projectUrl: data['projectUrl'],
              );
            }).toList();

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
          },
        )
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