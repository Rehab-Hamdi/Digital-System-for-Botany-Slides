import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';

import 'bar_char_slides_request.dart';

class SlidesRequest extends StatefulWidget {
  SlidesRequest({Key? key}) : super(key: key);

  @override
  State<SlidesRequest> createState() => _SlidesRequestState();
}

class _SlidesRequestState extends State<SlidesRequest> {
  List<String>? yearsValue;
  String? dropDownValue ;

  List<String> getYears() {
    List<String> years =  <String>[];
    int dateFrom =  DateTime(2010).year;
    int dateTo =  DateTime.now().year;
    dropDownValue = dateTo.toString();
    for (int i = dateFrom; i <= dateTo; i++) {
      years.add(i.toString());
    }
    return years.toList();
  }

  @override
  void initState() {
    super.initState();
    yearsValue = getYears();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Slides Requests", style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),),
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  color: MyColors.myBlue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: DropdownButton(
                    style: const TextStyle(color: MyColors.myBlue, fontWeight: FontWeight.bold),
                    underline: const SizedBox(height: 0,),
                    items: yearsValue?.map((String val) => DropdownMenuItem(value: val,child: Text(val),)).toList(),
                    value: dropDownValue,
                    onChanged: (String? val){
                      setState(() {
                        dropDownValue = val;
                      });
                    }
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          const Expanded(child: BarChartSlidesRequest()),
        ],
      ),
    );
  }
}
