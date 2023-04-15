import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/update_user/update_user_navigator.dart';

class UpdateUserViewModel extends BaseViewModel<UpdateUserNavigator> {


  String? IDValidation(text) {
    bool IdValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter ID';
    } else if ((text.length < 6|| text.length>6)|| (text.length < 14|| text.length>14)) {
      return 'Id number must == 6 if you enter Faculty Id or id == 14 if you enter National Id ';
    } else if (!IdValid) {
      return 'ID must contain only numbers';
    }
    return null;
  }

  String? nameValidation(text) {
    bool nameValid = RegExp(r"^[a-zA-Z\s]+$").hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter name ';
    } else if (!nameValid) {
      return 'name must contains only characters';
    }
    return null;
  }

  String? emailValidation(text) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!emailValid) {
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  String? passwordValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your Password';
    } else if (text.length < 9) {
      return 'Password must be at least 9 characters';
    }
    return null;
  }

  String? phoneValidation(text) {
    bool phoneValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter Phone Number';
    } else if (text.length < 11 || text.length > 11) {
      return 'phone number must be exactly 11 number';
    } else if (!phoneValid) {
      return 'phone number must contains only numbers';
    }
    return null;
  }

  String? typeValidation(text) {
    bool typeValid = RegExp(r'\b(?:Doctor|doctor|Student|student|admin|Admin)\b').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter Type';
    } else if (text != 'Doctor' || text!='doctor' || text!='Admin' || text!='admin' || text!='Student' || text!='student') {
      return 'type must = Doctor , doctor , Admin , admin , Student or student';
    } else if (!typeValid) {
      return 'type must contain only characters';
    }
    return null;
  }


}