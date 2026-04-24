import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Project.dart';

class ProjectService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collection = 'projects';

  // ✅ GET ALL PROJECTS (Real-time stream)
  Stream<List<Project>> getProjects() {
    return _firestore
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Project.fromFirestore(doc))
        .toList());
  }

  // ✅ GET SINGLE PROJECT
  Future<Project?> getProject(String projectId) async {
    DocumentSnapshot doc = await _firestore
        .collection(collection)
        .doc(projectId)
        .get();

    if (doc.exists) {
      return Project.fromFirestore(doc);
    }
    return null;
  }

  // ✅ ADD NEW PROJECT (Admin only)
  Future<void> addProject(Project project) async {
    await _firestore.collection(collection).add(project.toMap());
  }

  // ✅ UPDATE PROJECT
  Future<void> updateProject(String projectId, Project project) async {
    await _firestore.collection(collection).doc(projectId).update(project.toMap());
  }

  // ✅ DELETE PROJECT
  Future<void> deleteProject(String projectId) async {
    await _firestore.collection(collection).doc(projectId).delete();
  }
}