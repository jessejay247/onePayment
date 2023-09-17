import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
CollectionReference users = _firestore.collection('userProfile');

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required String name,
    required String dateOfBirth,
    required String gender,
    required String country,
    required String state,
    required String email,
    required String phoneNumber,
    required String address,
    required Uint8List file,
  }) async {
    String resp = "some error occured";
    try {
      if (name.isNotEmpty ||
          dateOfBirth.isNotEmpty ||
          gender.isNotEmpty ||
          country.isNotEmpty ||
          state.isNotEmpty ||
          email.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          address.isNotEmpty) {
        String imageUrl = await uploadImageToStorage('ProfileImage', file);
        ({
          'name': name,
          'dateOfBirth': dateOfBirth,
          'gender': gender,
          'country': country,
          'state': state,
          'email': email,
          'phoneNumber': phoneNumber,
          'address': address,
          'imageLink': imageUrl
        });
        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
