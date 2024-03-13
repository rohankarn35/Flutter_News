import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_news/UI/widgets/customToast.dart';
import 'package:flutter_news/models/firebaseNewsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteNewsService {
  final CollectionReference favouriteNews =
      FirebaseFirestore.instance.collection('news');

  Future<void> addFavourite(FirebaseNewsModel news) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email") ?? "";

    try {
      await favouriteNews.doc(email).update({
        'favouriteNews': FieldValue.arrayUnion([
          {
            'title': news.title,
            'description': news.description,
            'imageUrl': news.imageUrl,
            'newsUrl': news.newsUrl
          }
        ])
      });
    } catch (e) {
      ToastMessage.showToast("Error adding favourite news");
    }
  }

  void deleteFavourite(String titleToDelete) async {
    // Reference to the Firestore collection
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String userEmail = prefs.getString("email") ?? "";

  //   try {
  //     // Get the document snapshot for the specified user email
  //     DocumentSnapshot userDoc = await favouriteNews.doc(userEmail).get();

  //     // Check if the document exists
  //     if (userDoc.exists) {
  //       // Get the current favourites array
  //       List<dynamic> favourites = userDoc.get(userEmail);

  //       // Find the index of the object with the specified title
  //       int indexToDelete = favourites
  //           .indexWhere((favourite) => favourite['title'] == titleToDelete);

  //       // If the index is found, remove the object from the array
  //       if (indexToDelete != -1) {
  //         favourites.removeAt(indexToDelete);

  //         // Update the document with the modified favourites array
  //         await favouriteNews.doc(userEmail).update({'favourite': favourites});

  //         print('Object with title "$titleToDelete" deleted successfully.');
  //       } else {
  //         print('Object with title "$titleToDelete" not found.');
  //       }
  //     } else {
  //       print('User document with email "$userEmail" not found.');
  //     }
  //   } catch (e) {
  //     print('Error deleting object: $e');
  //   }
  }
}
