import 'package:flutter/material.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/page_title.dart';
import 'package:our_test_project/core/custom_widgets/title_and_textField.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/delete_user_navigator.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/delete_user_view_model.dart';
import 'package:provider/provider.dart';

class DeleteUserView extends StatefulWidget {
  static const String routeName = 'DeleteUser';

  const DeleteUserView({super.key});

  @override
  State<DeleteUserView> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends BaseState<DeleteUserView, DeleteViewModel> implements DeleteNavigator {


  @override
  DeleteViewModel initViewModel() {
    return DeleteViewModel();
  }

  FocusNode deleteFocusNode = FocusNode();
  var deleteController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    deleteController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (c) => viewModel,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      PageTitle(
                        title: 'Delete User Information',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TitleAndInputField(
                    txt: 'ID  : ',
                    left_margin:25,
                    controller: deleteController,
                    focusNode: deleteFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(right: 25),
                        width: 180,
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () {;
                            },
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius:
                                BorderRadius.circular(25)),
                                side: const BorderSide(color:MyColors.active)
                            ),
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.red),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
