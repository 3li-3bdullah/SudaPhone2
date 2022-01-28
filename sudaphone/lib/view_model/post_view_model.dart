import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostViewModel extends GetxController {
  /// Declaring Variables
  final postKey = GlobalKey<FormState>();
  CollectionReference addNewData =
      FirebaseFirestore.instance.collection("users");
  String? text;
  String? urlToImage;
  DateTime? postTime;
  bool like = false;
  File? file;
  ImagePicker? pickedImage;
  Reference? uploadToStorage;

  /// All Methods
  addPost() async {
    FormState? formState = postKey.currentState;
    if (formState!.validate()) {
      Get.defaultDialog(
        content: 
      );
      formState.save();
      await uploadToStorage!.putFile(file!);
      urlToImage = await uploadToStorage!.getDownloadURL();
      await addNewData
          .add({"text": text, "imageurl": urlToImage, "dateTime": postTime});
    }
  }

  uploadFromCamera() async {
    XFile? picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      file = File(picked.path);
      int rand = Random().nextInt(100000);
      var imageName = "$rand" + basename(picked.path);
      uploadToStorage = FirebaseStorage.instance.ref("images/$imageName");
      Get.back();
    }
  }

  uploadFromGallery() async {
    XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      file = File(picked.path);
      int rand = Random().nextInt(100000);
      var imageName = "$rand" + basename(picked.path);
      uploadToStorage = FirebaseStorage.instance.ref("images/$imageName");
      Get.back();
    }
  }

  isLiked() {
    return like != like;
  }
}
