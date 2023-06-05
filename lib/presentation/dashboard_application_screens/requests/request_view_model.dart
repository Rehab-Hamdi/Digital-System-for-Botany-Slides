import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/database_models/GetAllRequests.dart';
import 'package:Botany/presentation/dashboard_application_screens/requests/requet_navigator.dart';
import 'package:http/http.dart' as http;

class RequestViewModel extends BaseViewModel<RequestNavigator> {
  String? userIdValidation(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter an ID';
    }
    if (text.length != 6 && text.length != 14) {
      return 'ID must be either 6 digits (Faculty ID) or 14 digits (National ID)';
    }
    if (!RegExp(r'^\d+$').hasMatch(text)) {
      return 'ID must contain only digits';
    }
    return null;
  }

  String? slideIdValidation(text) {
    bool slideIdValid = RegExp(r'^\d{1,2}$').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter Slide ID';
    } else if (!slideIdValid) {
      return 'Slide ID must contains only digits, it can be one or two digits';
    }
    return null;
  }

  String? startDateValidation(String? text) {
    if (text == null || text.trim().isEmpty) {
      // return 'Please enter a start date';
      return null;
    }
    DateTime? startDate;
    try {
      startDate = DateFormat('yyyy-MM-dd').parse(text);
    } catch (e) {
      return 'Invalid date format. Please enter a date in the format yyyy-mm-dd';
    }
    if (startDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return 'Start date cannot be in the past';
    }
    return null;
  }

  String? endDateValidation(String? text) {
    if (text == null || text.trim().isEmpty) {
      //return 'Please enter a end date';
      return null;
    }
    DateTime? endDate;
    try {
      endDate = DateFormat('yyyy-MM-dd').parse(text);
    } catch (e) {
      return 'Invalid date format. Please enter a date in the format yyyy-mm-dd';
    }
    if (endDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return 'end date cannot be in the past';
    }
    return null;
  }

  String? returnedDateValidation(String? text) {
    if (text == null || text.trim().isEmpty) {
      return null;
    }
    DateTime? returnedDate;
    try {
      returnedDate = DateFormat('yyyy-MM-dd').parse(text);
    } catch (e) {
      return 'Invalid date format. Please enter a date in the format yyyy-mm-dd';
    }
    if (returnedDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return 'End date cannot be in the past';
    }
    return null;
  }

  String? stateValidation(String? state) {
    if (state == null || state.trim().isEmpty) {
      //return 'Please enter a state value';
      return null;
    }
    if (state != '0' && state != '1') {
      return 'blocked State value must be 0 (not blocked) or 1 (blocked)';
    }
    return null;
  }

  String? blockedValidation(String? state) {
    if (state == null || state.trim().isEmpty) {
      return 'Please enter a state value';
    }
    if (state != '0' && state != '1') {
      return 'State value must be 0 (not returned) or 1(returned)';
    }
    return null;
  }

  String? notesValidation(String? text) {
    return null;
  }

  void acceptRequest(int? user_id, int? slide_id, BuildContext context) {
    navigator!.showLoading();
    APIManager.approveUserRequest(user_id, slide_id);
    navigator!.hideLoading();
    navigator!.showDialogWithGif(
      img: "assets/images/success.gif",
      title: "Request approved successfully..!",
      titleColor: Colors.green,
    );
  }

  void updateRequest(
      int? user_id,
      int? slide_id,
      String? startDate,
      String? endDate,
      String? returnedDate,
      String? bloked,
      String? notes,
      BuildContext context) {
    navigator!.showLoading();
    APIManager.EditUserRequest(
        user_id, slide_id, startDate, endDate, returnedDate, bloked, notes);
    Navigator.pop(context);
    navigator!.hideLoading();
    navigator!.showDialogWithGif(
      img: "assets/images/success.gif",
      title: "Request updated successfully..!",
      titleColor: Colors.black,
    );
  }

  void rejectRequest(int? user_id, int? slide_id, BuildContext context) {
    navigator!.showLoading();
    APIManager.rejectUserRequest(user_id, slide_id);
    navigator!.hideLoading();
    navigator!.showDialogWithGif(
      img: "assets/images/success.gif",
      title: "Request rejected successfully..!",
      titleColor: Colors.red,
    );
  }
}
