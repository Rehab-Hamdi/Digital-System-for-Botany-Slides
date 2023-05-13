import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/models/users.dart';

abstract class UserNavigator extends BaseNavigator {
  void openDialog();
  Future openAddNewUserDialog();
  Future openUpdateUserDialog(Users user);
  Future<String?> openDeleteUserDialog();
}