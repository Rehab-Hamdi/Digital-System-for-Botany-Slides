import 'package:flutter/material.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/desktop_titleAndInputField.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/dashboard_application_screens/edit_request/edit_request_navigator.dart';
import 'package:Botany/presentation/dashboard_application_screens/edit_request/edit_request_view_model.dart';

class DesktopEditRequestView extends StatefulWidget {
  static const String routeName = 'desktop edit request view';

  const DesktopEditRequestView({super.key});

  @override
  State<DesktopEditRequestView> createState() => _DesktopEditRequestView();
}

class _DesktopEditRequestView extends BaseState<DesktopEditRequestView, EditRequestViewModel> implements EditRequestNavigator {


  @override
  EditRequestViewModel initViewModel() {
    return EditRequestViewModel();
  }
  FocusNode userIdFocusNode= FocusNode();
  FocusNode slideIdFocusNode=FocusNode();
  FocusNode startDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();
  FocusNode notesFocusNode = FocusNode();
  FocusNode statusFocusNode = FocusNode();
  var userIdController = TextEditingController();
  var slideIDController= TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var notesController = TextEditingController();
  var statusController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    startDateController.addListener(() {
      setState(() {});
    });
    endDateController.addListener(() {
      setState(() {});
    });
    notesController.addListener(() {
      setState(() {});
    });
    statusController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Request'),
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                DesktopTitleAndInputField(
                  containerPadding: 30.0,
                  txt: 'User ID : ',
                  left_margin:25.0,
                  controller: userIdController,
                  focusNode: userIdFocusNode,
                  // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                DesktopTitleAndInputField(
                  containerPadding: 30.0,
                  txt: 'Slide ID : ',
                  left_margin:23.0,
                  controller: slideIDController,
                  focusNode: slideIdFocusNode,
                  // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                DesktopTitleAndInputField(
                  containerPadding: 30.0,
                  txt: 'Start Date : ',
                  left_margin:5,
                  controller: startDateController,
                  focusNode: startDateFocusNode,
                  // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                DesktopTitleAndInputField(
                  containerPadding: 30.0,
                  txt: 'End Date : ',
                  left_margin:13,
                  controller: endDateController,
                  focusNode: endDateFocusNode,
                  // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                DesktopTitleAndInputField(
                  containerPadding: 30.0,
                  txt: 'Status  : ',
                  left_margin:29,
                  controller: statusController,
                  focusNode: statusFocusNode,
                  // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                DesktopTitleAndInputField(
                  containerPadding: 30.0,
                  txt: 'Notes  : ',
                  left_margin:33,
                  controller: notesController,
                  focusNode: notesFocusNode,
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
                              backgroundColor:Colors.transparent,
                              side:BorderSide(
                                  color:MyColors.active
                              ) ,
                              shape: RoundedRectangleBorder(borderRadius:
                              BorderRadius.circular(25)),
                            ),
                            child: const Text(
                              "Update request",
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: MyColors.active),
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
    );
  }

}
