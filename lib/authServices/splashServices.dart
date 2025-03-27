import 'dart:async';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';
import '../loginPage.dart';


class SplashServices {
  void isLogin(BuildContext context) {
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 5), () {
        Get.to(() => BottomNavBarPage(fullname: '',));
      });
    }else{
      Timer(Duration(seconds: 5), () {
        Get.to(() => LoginPage());
      });
    }

  }
}
