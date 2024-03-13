import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class offlineImage{
   static Future<String?> saveImage(String imageUrl) async {
    String? base64Image;
    try {
      // Fetch the image from the URL
      http.Response response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Convert image data to Base64
         base64Image = base64Encode(response.bodyBytes);

        // Save Base64 image data to local file
       return base64Image;
      }
    } catch (e) {
      print('Failed to save image: $e');
      return base64Image;
    }
  }
  // static Future<Image?> loadImage(String base64Image) async {
  //   try {
  //     // Read Base64 image data from local file
   

  //     // Decode Base64 image data
  //     Uint8List bytes = base64Decode(base64Image);

  //     // Create Image widget
  //     return Image.memory(bytes);
  //   } catch (e) {
  //     print('Failed to load image: $e');
  //     return null;
  //   }
  // }
}