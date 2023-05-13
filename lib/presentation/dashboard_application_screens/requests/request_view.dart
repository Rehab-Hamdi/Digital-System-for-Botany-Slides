import 'package:flutter/material.dart';
import 'package:our_test_project/core/api_manager.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/alretTextFormFiled.dart';
import 'package:our_test_project/core/custom_widgets/selectDate.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/database_models/requests/GetAllRequests.dart';
import 'package:our_test_project/models/requests_model.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/request_view_model.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/requet_navigator.dart';
import 'package:provider/provider.dart';

class RequestsView extends StatefulWidget {
  static const String routeName = 'RequestsView';

  const RequestsView({super.key});

  @override
  State<RequestsView> createState() => _RequestsTableState();
}

class _RequestsTableState extends BaseState<RequestsView, RequestViewModel>
    implements RequestNavigator {
  List<Request>? _requests;
  List<Request> _filteredRequests = [];
  String _searchQuery = ''; //
  Widget _buildSearchBar() {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: MyColors.userInfoColor)),
      child: TextField(
        onChanged: (query) {
          setState(() {
            _searchQuery = query;
            _filteredRequests = _requests!
                .where((request) =>
                    request.name
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()) ||
                    request.id
                        .toString()
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()))
                .toList();
          });
        },
        decoration: const InputDecoration(
          hintText: 'Search by name or ssn',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  var editkeyForm = GlobalKey<FormState>();
  FocusNode blockedFocusNode = FocusNode();
  FocusNode startDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();
  FocusNode returnedDateFocusNode = FocusNode();
  FocusNode returnedStateFocusNode = FocusNode();
  FocusNode notesFocusNode = FocusNode();
  TextEditingController blockedController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController returnedDateController = TextEditingController();
  TextEditingController returnedStateController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    blockedFocusNode.addListener(() {
      setState(() {});
    });
    startDateFocusNode.addListener(() {
      setState(() {});
    });
    endDateFocusNode.addListener(() {
      setState(() {});
    });
    returnedDateFocusNode.addListener(() {
      setState(() {});
    });
    returnedStateFocusNode.addListener(() {
      setState(() {});
    });
    notesFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
            body: FutureBuilder<GetAllRequests>(
                future: APIManager.getAllRequestsInfo(),
                builder: (buildContex, snapshot) {
                  // if (snapshot.hasError) {
                  //   return Center(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         SizedBox(
                  //           width: MediaQuery.of(context).size.width*0.40,
                  //           height: MediaQuery.of(context).size.height*0.60,
                  //           child: Image.asset(
                  //             'assets/images/noNetwork.png',
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                  //           child: Text(
                  //             'Check your network!',
                  //             style: TextStyle(fontSize: 25),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   );
                  // }
                  if (snapshot.hasError)

                  /// Ex : no internet
                  {
                    return Center(child: Text('Please, Check yout network '));
                  }
                  // else if (snapshot.connectionState ==
                  //     ConnectionState.waiting) {
                  //   return Center(child: CircularProgressIndicator());
                  // }
                  var data = snapshot.data;
                  if ('error' == data?.status) {
                    /// there is an error
                    return Center(child: Text('${data?.message}'));
                  }
                  var requests_list = data?.requests;
                  _requests = requests_list?.map((request) {
                        return Request(
                          id: request.id,
                          name: request.userName!,
                          email: request.email!,
                          slideName: request.arabicName ?? '',
                          requestedAt: request.requestedAt!,
                          updatedAt: request.updatedAt,
                          endDate: request.endDate,
                          slide_id: request.slide_id,
                        );
                      }).toList() ??
                      [];
                  List<Request> _requestsToDisplay =
                      _searchQuery.isEmpty ? _requests! : _filteredRequests;
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      _buildSearchBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        MyColors.lightGrey.withOpacity(0.2)),
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    'User ID',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Name',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                    label: Text(
                                      'Email',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  DataColumn(
                                      label: Text(
                                    'Slide Id',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Slide Name',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Section Type',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Requested At',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Updated At',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Ended At',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Actions',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )),
                                ],
                                rows: _requestsToDisplay.map((request) {
                                  return DataRow(cells: [
                                    DataCell(
                                      Text(
                                        '${request.id}',
                                        style: TextStyle(
                                            color: MyColors.userInfoColor),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    DataCell(Text(
                                      request.name,
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      request.email,
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      '${request.slide_id}',
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      request.slideName,
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      "Leaf & stem",
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      request.requestedAt,
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      request.updatedAt!,
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(Text(
                                      request.endDate!,
                                      style: TextStyle(
                                          color: MyColors.userInfoColor),
                                      overflow: TextOverflow.clip,
                                    )),
                                    DataCell(
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: OutlinedButton.icon(
                                              onPressed: () {
                                                ApproveRequestButton(
                                                    request.id!,
                                                    request.slide_id!);
                                              },
                                              icon: const Icon(
                                                Icons.done,
                                                color: Colors.black,
                                              ),
                                              label: const Text(
                                                'Approve',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            Colors.green),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: OutlinedButton.icon(
                                              onPressed: () {
                                                EditRequest(request.id!,
                                                    request.slide_id!);
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.black,
                                              ),
                                              label: const Text(
                                                'Edit',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: OutlinedButton.icon(
                                              onPressed: () {
                                                RejectRequestButton(request.id,
                                                    request.slide_id);
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.black,
                                              ),
                                              label: const Text(
                                                'Reject',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            Colors.red),
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
                        height: MediaQuery.of(context).size.height * 0.10,
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
                  );
                })),
      ),
    );
  }

  @override
  RequestViewModel initViewModel() {
    return RequestViewModel();
  }

  DateTime? selectedStartDate;
  Future? EditRequest(int user_id, int slide_id) {
    showDialog(
        context: context,
        builder: (contextBuilder) {
          return AlertDialog(
            title: Text(
              'Edit Request',
              style: TextStyle(color: Colors.black),
            ),
            titleTextStyle: TextStyle(fontSize: 20),
            titlePadding: EdgeInsets.all(12.0),
            contentPadding: EdgeInsets.all(12.0),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.23,
              child: SingleChildScrollView(
                child: WillPopScope(
                  onWillPop: () async {
                    return false; // Prevents closing the dialog by pressing the back button
                  },
                  child: Form(
                    key: editkeyForm,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                              viewModel.endDateValidation(
                            text,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SelectDate(
                          label: 'Returned Date',
                          focusNode: returnedDateFocusNode,
                          controller: returnedDateController,
                          validatorFunction: (text) =>
                              viewModel.returnedDateValidation(
                            text,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AlertTextFormField(
                            focusNode: returnedStateFocusNode,
                            controller: returnedStateController,
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
                    EditRequestButton(user_id, slide_id);
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

  void ApproveRequestButton(int user_id, int slide_id) {
    //APIManager.putApproveRequest(user_id, slide_id);
    print(
        'Request approved with data -> user_id= ${user_id}, slide_id=${slide_id}');
    showDialog(
        context: context,
        builder: (contextBuilder) {
          return AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.23,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/apiPic/acceptRequest.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'The request for user ${user_id} has been accepted',
                      style: TextStyle(fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  EditRequestButton(int user_id, int slide_id) {
    if (editkeyForm.currentState!.validate() == true) {

      // print('Data');
      // print('user ${user_id} make request for slide id = ${slide_id}');
      // print(startDateController.text);
      // print(endDateController.text);
      // print(returnedDateController.text);
      // print(returnedStateController.text);
      // print(notesController.text);
      print("check data in edit data done");
      APIManager.putUpdateRequest(
          user_id,
          slide_id,
          startDateController.text,
          endDateController.text,
          returnedDateController.text,
          returnedStateController.text,
          notesController.text);
      clearAllControllars();
      Navigator.pop(context);

    }
  }

  RejectRequestButton(var user_id, var slide_id) {
    print(
        'Request rejected with data -> user_id= ${user_id}, slide_id=${slide_id}');
    showDialog(
        context: context,
        builder: (contextBuilder) {
          return AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.23,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/apiPic/rejectRequest.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'The request for user ${user_id} has been rejected',
                      style: TextStyle(fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(bottom: 8.0),
            //     child: Center(child: Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(30),
            //             border: Border.all(
            //                 color: Colors.black
            //             )
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(4.0),
            //           child: IconButton( onPressed: (){Navigator.of(context).pop(); }, icon:  Icon(Icons.delete, color:Colors.red,size: 30,),),
            //         ))),
            //   )
            // ],
          );
        });
  }

  clearAllControllars() {
    blockedController.clear();
    startDateController.clear();
    returnedDateController.clear();
    endDateController.clear();
    returnedStateController.clear();
    notesController.clear();
  }
  // void dispose() {
  //   startDateController.dispose();
  //   endDateController.dispose();
  //   returnedDateController.dispose();
  //   returnedStateController.dispose();
  //   notesController.dispose();
  // }
}