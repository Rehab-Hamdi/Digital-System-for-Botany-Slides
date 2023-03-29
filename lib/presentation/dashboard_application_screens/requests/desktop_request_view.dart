import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:our_test_project/core/custom_widgets/page_title.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/requests_model.dart';
class DesktopRequestsView extends StatefulWidget {

  static const String routeName = 'desktopRequestsView';

  const DesktopRequestsView({super.key});

  @override
  State<DesktopRequestsView> createState() => _RequestsTableState();
}

class _RequestsTableState extends State<DesktopRequestsView> {

  final List<Request> _requests = [
    Request(ssn: '14785236941', name: 'Mamhoud', email: 'mahmoud@gmail.com', slideName: 'stem , pinus', date: '12:8:00'),
    Request(ssn: '17853524042', name: 'Hagar', email: 'hagar@gmail.com', slideName: 'stem , pinus', date: '18:8:50'),
    Request(ssn: '45545786541', name: 'Rehab', email: 'rehab@gmail.com', slideName: 'stem , pinus', date: '09:8:05'),
    Request(ssn: '54200472941', name: 'Mohamed', email: 'mohamed@gmail.com', slideName: 'stem , pinus', date: '17:00:08'),
    Request(ssn: '44104054712', name: 'Eman', email: 'Eman@gmail.com', slideName: 'stem , pinus', date: '10:08:30',),
    Request(ssn: '27504072872', name: 'Ahmed', email: 'ahmed@gmail.com', slideName: 'stem , pinus', date: '12:08:01'),
    Request(ssn: '27442502572', name: 'Sohaila', email: 'Sohaila@gmail.com', slideName: 'stem , pinus', date: '08:00:00'),
    Request(ssn: '24275875722', name: 'Asmaa', email: 'asmaagmail.com', slideName: 'stem , pinus', date: '01:8:12'),
    Request(ssn: '14785236941', name: 'Mamhoud', email: 'mahmoud@gmail.com', slideName: 'stem , pinus', date: '12:8:00'),
    Request(ssn: '17853524042', name: 'Hagar', email: 'hagar@gmail.com', slideName: 'stem , pinus', date: '18:8:50'),
    Request(ssn: '45545786541', name: 'Rehab', email: 'rehab@gmail.com', slideName: 'stem , pinus', date: '09:8:05'),
    Request(ssn: '54200472941', name: 'Mohamed', email: 'mohamed@gmail.com', slideName: 'stem , pinus', date: '17:00:08'),
    Request(ssn: '44104054712', name: 'Eman', email: 'Eman@gmail.com', slideName: 'stem , pinus', date: '10:08:30',),
    Request(ssn: '27504072872', name: 'Ahmed', email: 'ahmed@gmail.com', slideName: 'stem , pinus', date: '12:08:01'),
    Request(ssn: '27442502572', name: 'Sohaila', email: 'Sohaila@gmail.com', slideName: 'stem , pinus', date: '08:00:00'),
    Request(ssn: '24275875722', name: 'Asmaa', email: 'asmaagmail.com', slideName: 'stem , pinus', date: '01:8:12'),

  ];
  @override
  void initState() {
    super.initState();
    _getRequests();
  }

  Future<void> _getRequests() async {
    final response = await http.get(Uri.parse('https://example.com/api/requests'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        //_requests = List<Request>.from(data.map((item) => Request.fromJson(item)));
      });
    } else {
      throw Exception('Failed to load requests');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            PageTitle(title: 'Requests', wdth: 0.30),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                height:MediaQuery.of(context).size.height*0.85,
                width: MediaQuery.of(context).size.width*0.62,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: MyColors.active,
                    )
                ),
                child:
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor:MaterialStateColor.resolveWith((states) => MyColors.lightGrey.withOpacity(0.2)),
                      columns: const [
                        DataColumn(label: Text('SSN')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Slide Name')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: _requests.map((request) {
                        return DataRow(cells: [
                          DataCell(Text(request.ssn)),
                          DataCell(Text(request.name)),
                          DataCell(Text(request.email)),
                          DataCell(Text(request.slideName)),
                          DataCell(Text(request.date)),
                          DataCell(
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color:Colors.green,
                                    ),
                                    child: InkWell(
                                      onTap: (){},
                                      child: Row(
                                        children: const [
                                          Icon(Icons.done, size: 20,),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Accept"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color:Colors.red,
                                    ),
                                    child: InkWell(
                                      onTap: (){},
                                      child: Row(
                                        children: const [
                                          Icon(Icons.close, size: 20,),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Refuse"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}