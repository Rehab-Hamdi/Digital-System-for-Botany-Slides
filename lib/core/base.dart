import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';

abstract class BaseNavigator {
  void showLoading();

  void hideLoading();

  void showMessage(String message, bool success);
}

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier {
  Nav? navigator;
}

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  // abstract setter for viewModel
  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    showDialog(
        context: context,
        builder: (c) {
          return const AlertDialog(
            title: Center(child: CircularProgressIndicator()),
          );
        });
  }

  @override
  void showMessage(String message, bool success) {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(message, style: TextStyle(color:
                    success ? Colors.green : Colors.red.shade400, fontSize: 17),),
              ),
            actions: [
              Center(child: IconButton( onPressed: (){Navigator.of(context).pop(); }, icon: const Icon(Icons.cancel, color:MyColors.designGreen,),))
            ],
          );
        });
  }
}
