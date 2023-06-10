import 'package:Botany/checkNetwork/check_network.dart';
import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/alretTextFormFiled.dart';
import 'package:Botany/core/custom_widgets/selectDate.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/database_models/GetAllRequests.dart';
import 'package:Botany/models/requests_model.dart';
import 'package:Botany/presentation/dashboard_application_screens/requests/request_view_model.dart';
import 'package:Botany/presentation/dashboard_application_screens/requests/requet_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/drop_box.dart';

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
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.015,
              left: MediaQuery.of(context).size.width * 0.12,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * .02,
            ),
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
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search by user name or user ID',
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: MyColors.lightGray,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: MyColors.lightGray,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ),
      ],
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
                  if (snapshot.hasError) {
                    return NoNetworkApp();
                  }
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    var requests_list = data?.requests;
                    _requests = requests_list?.map((request) {
                          return Request(
                            id: request.id,
                            name: request.userName!,
                            email: request.email!,
                            slideName: request.arabicName ?? '',
                            requestedAt: request.requestedAt!,
                            updatedAt: request.updatedAt ?? '',
                            endDate: request.endDate ?? '',
                            slide_id: request.slideId,
                            notes: request.notes ?? '',
                            returnedState: request.returnedState ?? 0,
                            startDate: request.startDate ?? '',
                            returnedDate: request.returnedDate ?? '',
                          );
                        }).toList() ??
                        [];
                    List<Request> _requestsToDisplay =
                        _searchQuery.isEmpty ? _requests! : _filteredRequests;
                    return Center(
                      child: Column(
                        children: [
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
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => MyColors.userInfoColor
                                                .withOpacity(0.1)),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'User ID',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'User Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Slide Id',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Slide Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )),
                                      // DataColumn(
                                      //     label: Text(
                                      //   'Section Type',
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .headline6,
                                      // )),
                                      DataColumn(
                                          label: Text(
                                        'Requested At',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Actions',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
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
                                        // DataCell(Text(
                                        //   "Leaf & stem",
                                        //   style: TextStyle(
                                        //       color: MyColors.userInfoColor),
                                        //   overflow: TextOverflow.clip,
                                        // )),
                                        DataCell(Text(
                                          request.requestedAt,
                                          style: TextStyle(
                                              color: MyColors.userInfoColor),
                                          overflow: TextOverflow.clip,
                                        )),
                                        DataCell(
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    viewRequest(request);
                                                  },
                                                  icon: Icon(
                                                    Icons.visibility_outlined,
                                                    color:
                                                        MyColors.userInfoColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                            .resolveWith(
                                                                (states) =>
                                                                    Colors
                                                                        .green),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: OutlinedButton.icon(
                                                  onPressed: () {
                                                    RejectRequestButton(
                                                        request.id,
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
                                                            .resolveWith(
                                                                (states) =>
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
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Image.asset(
                                  "assets/images/plant1.png",
                                ),
                              ),
                              Image.asset("assets/images/plant1.png")
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  ;
                  return const Center(
                      child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff39A552),
                      backgroundColor: Colors.transparent,
                    ),
                  ));
                })),
      ),
    );
  }

  @override
  RequestViewModel initViewModel() {
    return RequestViewModel();
  }

  DateTime? selectedStartDate;


  EditRequest(int user_id, int slide_id) {
    showDialog(
        context: context,
        builder: (contextBuilder) {
          return AlertDialog(
            title: Text(
              'Edit Request',
              style: TextStyle(color: Colors.black),
            ),
            titleTextStyle: TextStyle(fontSize: 25),
            titlePadding: EdgeInsets.all(12.0),
            contentPadding: EdgeInsets.all(12.0),
            content: SingleChildScrollView(
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
                      DropBox(),
                      // AlertTextFormField(
                      //     focusNode: returnedStateFocusNode,
                      //     controller: returnedStateController,
                      //     validatorFunction: (text) =>
                      //         viewModel.stateValidation(text),
                      //     label:
                      //         'Returned Status (0 for not returned , 1 for returned)'),
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
                    if (editkeyForm.currentState!.validate() == true) {
                      print("check data in edit data done");
                      viewModel.updateRequest(
                          user_id,
                          slide_id,
                          startDateController.text,
                          endDateController.text,
                          returnedDateController.text,
                          DropBox.returnedState=='not returned'?'0':'1',
                          notesController.text,
                          context);
                      clearAllControllars();
                    }
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
    viewModel.acceptRequest(user_id, slide_id, context);
    print(
        'Request approved with data -> user_id= ${user_id}, slide_id=${slide_id}');
  }

  RejectRequestButton(var user_id, var slide_id) {
    viewModel.rejectRequest(user_id, slide_id, context);
    print(
        'Request rejected with data -> user_id= ${user_id}, slide_id=${slide_id}');
  }

  TextStyle textStyle = TextStyle(
      fontSize: 15, color: MyColors.active, fontWeight: FontWeight.bold);
  TextStyle subtitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  Future viewRequest(Request request) => showDialog(
        context: context,
        builder: (context) => Container(
          child: AlertDialog(
            scrollable: true,
            title: Center(
              child: Text(
                ('Request Information'),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 18, color: Colors.black),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'User ID:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.assignment_ind,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    '${request.id!}',
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Name:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.person,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    request.name,
                    style: subtitleStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: Text(
                      'Email:',
                      style: textStyle,
                    ),
                    leading: Icon(
                      Icons.email,
                      color: MyColors.active,
                    ),
                    subtitle: Text(
                      request.email,
                      style: subtitleStyle,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Slide Id:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.eco_rounded,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    '${request.slide_id}',
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Slide Name:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.eco_rounded,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    request.slideName,
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Returned Status:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.block,
                    color: request.returnedState == 0
                        ? Colors.red
                        : MyColors.active,
                  ),
                  subtitle: Text(
                    request.returnedState == 1 ? 'returned' : 'not returned',
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Request Created At:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.date_range,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    (request.requestedAt),
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Request Started At:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.date_range,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    (request.startDate)!,
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Request Ended At:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.date_range,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    (request.endDate)!,
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Slide returned At:',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.date_range,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    (request.returnedDate ?? 'No returned Date exist'),
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Notes',
                    style: textStyle,
                  ),
                  leading: Icon(
                    Icons.notes,
                    color: MyColors.active,
                  ),
                  subtitle: Text(
                    request.notes!,
                    style: subtitleStyle,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: MyColors.active,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  clearAllControllars() {
    blockedController.clear();
    startDateController.clear();
    returnedDateController.clear();
    endDateController.clear();
    returnedStateController.clear();
    notesController.clear();
  }
}
