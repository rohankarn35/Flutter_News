import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_news/UI/widgets/customToast.dart';

class FirebaseAddUser {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('news');
  Future<void> addUser(
    String email,
    String fullName,
  ) async {
    try {
      await userCollection.doc(email).set({
      'userinfo': {
        'fullname': fullName,
        'email': email,
      }
    });
      
    } catch (e) {
     print(e);
      
    }
  }
}
