import 'package:flutter/material.dart';
import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/planet_info_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanetInfoViewModel extends BaseViewModel<PlanetInfoNavigator> {
  Future<void> makeRequest(int? slideId) async{
    //get current user id from SharedPreferences
    SharedPreferences prefs= await SharedPreferences.getInstance();
    int? userId= prefs.getInt('user_id');
    APIManager.makeNewRequest(slideId: slideId, userId: userId,);
    navigator!.showDialogWithGif(
      img: "assets/images/success.gif",
      title: "The request was successful",
      content: "Please wait for an email with the time of receipt.",
      titleColor: Colors.green,
      contentColor: MyColors.successBlue
    );
  }
}