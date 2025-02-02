import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  // Create (Add Data)
  Future<void> addDate(String morningHighlight, String eveningReflection, String journalEntry, DateTime date) async {
    DocumentReference docRef = await _usersCollection.add({
      'morningHighlight': morningHighlight,
      'eveningReflection': eveningReflection,
      'journalEntry': journalEntry,
      'date': date.toIso8601String(),
    });
    await docRef.update({'id': docRef.id});
  }

  // Read (Fetch Data)
  Stream<QuerySnapshot> getUsers() {
    return _usersCollection.snapshots();
  }

  // Update (Edit Data)
  Future<void> updateDate(String docId, String morningHighlight, String eveningReflection, String journalEntry, DateTime date) async {
    await _usersCollection.doc(docId).update({
      'morningHighlight': morningHighlight,
      'eveningReflection': eveningReflection,
      'journalEntry': journalEntry,
      'date': date.toIso8601String(),
    });
  }

  // Delete (Remove Data)
  Future<void> deleteUser(String docId) async {
    await _usersCollection.doc(docId).delete();
  }
}
