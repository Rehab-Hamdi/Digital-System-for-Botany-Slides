import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/alretTextFormFiled.dart';
import 'package:our_test_project/core/custom_widgets/selectDate.dart';
import 'package:our_test_project/core/custom_widgets/text_field.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/requests_model.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/edit_request/desktop_edit_request_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/request_view_model.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/requet_navifator.dart';
import 'package:sizer/sizer.dart';

class DesktopRequestsView extends StatefulWidget {
  static const String routeName = 'desktopRequestsView';

  const DesktopRequestsView({super.key});

  @override
  State<DesktopRequestsView> createState() => _RequestsTableState();
}

class _RequestsTableState
    extends BaseState<DesktopRequestsView, RequestViewModel>
    implements RequestNavigator {
  final List<Request> _requests = [
    Request(
        ssn: '14785236941',
        name: 'Mahmoud',
        email: 'mahmoud@gmail.com',
        slideName: 'stem , pinus',
        date: '12:8:00'),
    Request(
        ssn: '17853524042',
        name: 'Hagar',
        email: 'hagar@gmail.com',
        slideName: 'stem , pinus',
        date: '16:8:50'),
    Request(
        ssn: '45545786541',
        name: 'Rehab',
        email: 'rehab@gmail.com',
        slideName: 'stem , pinus',
        date: '09:8:05'),
    Request(
        ssn: '54200472941',
        name: 'Mohamed',
        email: 'mohamed@gmail.com',
        slideName: 'stem , pinus',
        date: '17:00:08'),
    Request(
      ssn: '44104054712',
      name: 'Eman',
      email: 'Eman@gmail.com',
      slideName: 'stem , pinus',
      date: '10:08:30',
    ),
    Request(
        ssn: '27504072872',
        name: 'Ahmed',
        email: 'ahmed@gmail.com',
        slideName: 'stem , pinus',
        date: '12:08:01'),
    Request(
        ssn: '27442502572',
        name: 'Sohaila',
        email: 'Sohaila@gmail.com',
        slideName: 'stem , pinus',
        date: '08:00:00'),
    Request(
        ssn: '24275875722',
        name: 'Asmaa',
        email: 'asmaagmail.com',
        slideName: 'stem , pinus',
        date: '01:8:12'),
    Request(
        ssn: '14785236941',
        name: 'Mahmoud',
        email: 'mahmoud@gmail.com',
        slideName: 'stem , pinus',
        date: '12:8:00'),
    Request(
        ssn: '17853524042',
        name: 'Hagar',
        email: 'hagar@gmail.com',
        slideName: 'stem , pinus',
        date: '16:8:50'),
    Request(
        ssn: '45545786541',
        name: 'Rehab',
        email: 'rehab@gmail.com',
        slideName: 'stem , pinus',
        date: '09:8:05'),
    Request(
        ssn: '54200472941',
        name: 'Mohamed',
        email: 'mohamed@gmail.com',
        slideName: 'stem , pinus',
        date: '17:00:08'),
    Request(
      ssn: '44104054712',
      name: 'Eman',
      email: 'Eman@gmail.com',
      slideName: 'stem , pinus',
      date: '10:08:30',
    ),
    Request(
        ssn: '27504072872',
        name: 'Ahmed',
        email: 'ahmed@gmail.com',
        slideName: 'stem , pinus',
        date: '12:08:01'),
    Request(
        ssn: '27442502572',
        name: 'Sohaila',
        email: 'Sohaila@gmail.com',
        slideName: 'stem , pinus',
        date: '08:00:00'),
    Request(
        ssn: '24275875722',
        name: 'Asmaa',
        email: 'asmaagmail.com',
        slideName: 'stem , pinus',
        date: '01:8:12'),
  ];
  List<Request> _filteredRequests = [];
  String _searchQuery = ''; //
  Widget _buildSearchBar() {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: MyColors.userInfoColor)),
      child: TextField(
        onChanged: (query) {
          setState(() {
            _searchQuery = query;
            _filteredRequests = _requests
                .where((request) =>
                    request.name
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()) ||
                    request.ssn
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()))
                .toList();
          });
        },
        decoration: InputDecoration(
          hintText: 'Search by name or ssn',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  var keyForm = GlobalKey<FormState>();
  FocusNode userIdFocusNode = FocusNode();
  FocusNode slideIdFocusNode = FocusNode();
  FocusNode startDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();
  FocusNode statusFocusNode = FocusNode();
  FocusNode notesFocusNode = FocusNode();
  TextEditingController userIdController = TextEditingController();
  TextEditingController slideIdController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userIdFocusNode.addListener(() {
      setState(() {});
    });
    slideIdFocusNode.addListener(() {
      setState(() {});
    });
    startDateFocusNode.addListener(() {
      setState(() {});
    });
    endDateFocusNode.addListener(() {
      setState(() {});
    });
    statusFocusNode.addListener(() {
      setState(() {});
    });
    notesFocusNode.addListener(() {
      setState(() {});
    });
  }

  // @override
  // void dispose() {
  //   userIdController.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    List<Request> _requestsToDisplay =
        _searchQuery.isEmpty ? _requests : _filteredRequests;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            _buildSearchBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => MyColors.lightGrey.withOpacity(0.2)),
                      columns: [
                        DataColumn(
                            label: Text(
                          'User ID',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        DataColumn(
                            label: Text(
                          'Name',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        DataColumn(
                            label: Text(
                          'Email',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        DataColumn(
                            label: Text(
                          'Slide Name',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        DataColumn(
                            label: Text(
                          'Requested Date',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        DataColumn(
                            label: Text(
                          'Actions',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                      ],
                      rows: _requestsToDisplay.map((request) {
                        return DataRow(cells: [
                          DataCell(Text(
                            request.ssn,
                            style: TextStyle(color: MyColors.userInfoColor),
                          )),
                          DataCell(Text(
                            request.name,
                            style: TextStyle(color: MyColors.userInfoColor),
                          )),
                          DataCell(Text(
                            request.email,
                            style: TextStyle(color: MyColors.userInfoColor),
                          )),
                          DataCell(Text(
                            request.slideName,
                            style: TextStyle(color: MyColors.userInfoColor),
                          )),
                          DataCell(Text(
                            request.date,
                            style: TextStyle(color: MyColors.userInfoColor),
                          )),
                          DataCell(
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.done,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      'Approve',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.green),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      EditRequest();
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      'Reject',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.red),
                                      //   textStyle: MaterialStateProperty<TextStyle> ,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/plant1.png",
                ),
                Image.asset("assets/images/plant1.png")
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  RequestViewModel initViewModel() {
    return RequestViewModel();
  }

  Future? EditRequest() {
    showDialog(
        context: context,
        builder: (contextBuilder) {
          return AlertDialog(
            title: Text('Edit Request'),
            titleTextStyle: TextStyle(fontSize: 20, color: MyColors.active),
            titlePadding: EdgeInsets.all(12.0),
            contentPadding: EdgeInsets.all(12.0),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.30,
              child: SingleChildScrollView(
                child: WillPopScope(
                  onWillPop: () async {
                    return false; // Prevents closing the dialog by pressing the back button
                  },
                  child: Form(
                    key: keyForm,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AlertTextFormField(
                          focusNode: userIdFocusNode,
                          controller: userIdController,
                          validatorFunction: (text) =>
                              viewModel.userIdValidation(text),
                          label: 'User Id',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        AlertTextFormField(
                          focusNode: slideIdFocusNode,
                          controller: slideIdController,
                          validatorFunction: (text) =>
                              viewModel.slideIdValidation(text),
                          label: 'Slide Id',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SelectDate(
                          label: 'Start Date',
                          focusNode: startDateFocusNode,
                          controller: startDateController,
                          validatorFunction: (text) =>
                              viewModel.startDateValidation(text),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SelectDate(
                            label: 'End Date',
                            focusNode: endDateFocusNode,
                            controller: endDateController,
                            validatorFunction: (text) =>
                                viewModel.endDateValidation(text)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AlertTextFormField(
                            focusNode: statusFocusNode,
                            controller: statusController,
                            validatorFunction: (text) =>
                                viewModel.stateValidation(text),
                            label: 'Returned Status'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AlertTextFormField(
                          focusNode: notesFocusNode,
                          controller: notesController,
                          validatorFunction: (text) =>
                              viewModel.notesValidation(text),
                          label: 'Notes',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
                child: TextButton(
                  onPressed: () {
                    clearAllControllars();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                child: TextButton(
                  onPressed: () {
                    EditRequestButton();
                  },
                  child: Text(
                    'Update Request',
                    style: TextStyle(fontSize: 18, color: MyColors.active),
                  ),
                ),
              )
            ],
          );
        });
  }

  EditRequestButton() {
    if (keyForm.currentState!.validate() == true) {
      print("check data is done");
      clearAllControllars();
      Navigator.pop(context);
    }
  }

  clearAllControllars() {
    userIdController.clear();
    slideIdController.clear();
    startDateController.clear();
    endDateController.clear();
    statusController.clear();
    notesController.clear();
  }
}
