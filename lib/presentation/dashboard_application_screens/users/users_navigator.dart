import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/models/users.dart';

abstract class UserNavigator extends BaseNavigator {
  Future openAddNewUserDialog();
  Future openUpdateUserDialog(Users user);
  Future<String?> openDeleteUserDialog(int userId, String userName);
}