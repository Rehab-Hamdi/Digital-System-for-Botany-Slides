import 'package:Botany/core/base.dart';
import 'package:Botany/database_models/users.dart';

abstract class UserNavigator extends BaseNavigator {
  Future openAddNewUserDialog();
  Future openUpdateUserDialog(Users user);
  Future<String?> openDeleteUserDialog(int userId, String userName);
}