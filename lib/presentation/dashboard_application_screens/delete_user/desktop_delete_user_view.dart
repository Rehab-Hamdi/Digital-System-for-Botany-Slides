import 'package:flutter/material.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/desktop_titleAndInputField.dart';
import 'package:our_test_project/core/custom_widgets/page_title.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/delete_user_navigator.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/delete_user_view_model.dart';
import 'package:provider/provider.dart';

class DesktopDeleteUserView extends StatefulWidget {
  static const String routeName = 'desktop DeleteUser';

  const DesktopDeleteUserView({super.key});

  @override
  State<DesktopDeleteUserView> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends BaseState<DesktopDeleteUserView, DeleteUserViewModel> implements DeleteNavigator {


  @override
  DeleteUserViewModel initViewModel() {
    return DeleteUserViewModel();
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
                        wdth: 0.30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'ID  : ',
                    left_margin:25,
                    controller: deleteController,
                    focusNode: deleteFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  Expanded(
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: 220,
                          height: MediaQuery.of(context).size.height*0.07,
                          child: OutlinedButton(
                              onPressed: () {
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(borderRadius:
                                BorderRadius.circular(25)),
                              ),
                              child: const Text(
                                "Delete",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
