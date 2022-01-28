import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PostViewModel extends GetxController {
  final postKey = GlobalKey<FormState>();
  addPost() {
    var formState = postKey.currentState;
    if(formState!.validate()){
      
    }
  }
}
