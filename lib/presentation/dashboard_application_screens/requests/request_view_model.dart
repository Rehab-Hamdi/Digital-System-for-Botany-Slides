import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/requet_navifator.dart';
import 'package:intl/intl.dart';

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
      return 'Please enter a start date';
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
      return 'Please enter an end date';
    }
    DateTime? endDate;
    try {
      endDate = DateFormat('yyyy-MM-dd').parse(text);
    } catch (e) {
      return 'Invalid date format. Please enter a date in the format yyyy-mm-dd';
    }
    if (endDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return 'End date cannot be in the past';
    }
    return null;
  }

  String? stateValidation(String? state) {
    if (state == null|| state.trim().isEmpty) {
      return 'Please enter a state value';
    }
    if (state != '0' && state != '1') {
      return 'State value must be 0 or 1';
    }
    return null;
  }

  String? notesValidation(String? text) {
    return null;
  }


}
