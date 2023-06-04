import 'package:flutter/material.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/title_and_textField.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/dashboard_application_screens/edit_request/edit_request_navigator.dart';
import 'package:Botany/presentation/dashboard_application_screens/edit_request/edit_request_view_model.dart';
import 'package:provider/provider.dart';

class MobileEditRequestView extends StatefulWidget {
  static const String routeName = 'Mobile edit request view';

  const MobileEditRequestView({super.key});

  @override
  State<MobileEditRequestView> createState() => _MobileUpdateUserView();
}

class _MobileUpdateUserView extends BaseState<MobileEditRequestView, EditRequestViewModel> implements EditRequestNavigator {


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
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  /*SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        PageTitle(
                          title: 'Update User Information',
                          wdth: 0.47,
                        ),
                      ],
                    ),
                  ),*/
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),

                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'User ID  : ',
                    left_margin:27,
                    controller: userIdController,
                    focusNode: userIdFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),

                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'Slide ID  : ',
                    left_margin:24,
                    controller: slideIDController,
                    focusNode: slideIdFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'Start Date  : ',
                    left_margin:5,
                    controller: startDateController,
                    focusNode: startDateFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'End Date   : ',
                    left_margin:7,
                    controller: endDateController,
                    focusNode: endDateFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'status  : ',
                    left_margin:35,
                    controller:statusController,
                    focusNode: statusFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'Notes  : ',
                    left_margin:37,
                    controller: notesController,
                    focusNode: notesFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),

                  Expanded(
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width*0.52,
                          height: MediaQuery.of(context).size.height*0.06,
                          child: OutlinedButton(
                              onPressed: () {
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: MyColors.active
                                ),
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(borderRadius:
                                BorderRadius.circular(25)),
                              ),
                              child: const Text(
                                "Update Request",
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
        ),
      ),
    );
  }

}
