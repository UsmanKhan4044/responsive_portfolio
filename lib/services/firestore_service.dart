import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Project.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ✅ GET ALL PROJECTS (REAL-TIME STREAM)
  Stream<List<Project>> getProjects() {
    return _db
        .collection('projects')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Project.fromFirestore(doc.data()!, doc.id))
        .toList());
  }

  // ✅ GET SINGLE PROJECT
  Future<Project?> getProject(String projectId) async {
    DocumentSnapshot doc = await _db.collection('projects').doc(projectId).get();

    if (doc.exists) {
      return Project.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }
}