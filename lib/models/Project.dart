class Project {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? projectUrl;

  Project({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.projectUrl,
  });

  // ✅ FROM FIRESTORE DOCUMENT
  factory Project.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Project(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      projectUrl: data['projectUrl'] ?? '',
    );
  }
}

// Demo fallback data (if Firebase fails)
List<Project> demo_projects = [
  Project(
    id: 'demo1',
    title: "Responsive Admin Panel - Flutter UI",
    description: "A complete admin dashboard built with Flutter that adapts flawlessly to mobile, tablet, and desktop. Features include interactive bar/line charts, sortable data tables, user management, dark/light theme toggle, and a collapsible sidebar. Perfect for SaaS dashboards or internal tools.",
  ),
  Project(
    id: 'demo2',
    title: "E-Commerce App - Flutter UI",
    description: "Feature-rich e‑commerce application with a beautiful product grid, advanced filtering and sorting, smooth cart animations, and a secure multi‑step checkout. Works seamlessly across phones and tablets. Includes wishlist, product reviews, and order tracking UI.",
  ),
  Project(
    id: 'demo3',
    title: "Chat Application - Dark & Light Theme",
    description: "Real‑time messaging app with instant push notifications, emoji picker, image sharing, and typing indicators. Supports both dark and light themes with smooth transitions. Responsive design works on phones, foldables, and tablets. Includes chat history and user online status.",
  ),
];