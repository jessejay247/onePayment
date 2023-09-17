import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

// Function to upload the profile image and get the download URL
Future<String?> uploadProfileImage() async {
  final picker = ImagePicker();

  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final file = File(pickedFile.path);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_images/${DateTime.now()}.jpg');
    final uploadTask = storageRef.putFile(file);

    final TaskSnapshot uploadSnapshot =
        await uploadTask.whenComplete(() => null);

    if (uploadSnapshot.state == TaskState.success) {
      final downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } else {
      // Handle image upload failure
      ('Image upload failed');
      return null;
    }
  }
  return null;
}
