import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:crmsrv/dto/CheckListUpdateDto/model.dart';
import 'package:crmsrv/dto/UserTasksDto/controller.dart';
import 'package:crmsrv/dto/storage/storage.dart';
import 'package:crmsrv/presentation/dashboard/components/new_tabel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CheckListUpdateController with ChangeNotifier {
  bool isDataLoading = false;
  bool hasData = true;
  static var client = http.Client();
  updateCheckList(bool checkStatus, String checkListId, double percentage,
      String assignId, int weightage, BuildContext context) async {
    print(assignId);
    print(checkListId);
    print(checkStatus);
    print(percentage);
    print(weightage);
    notifyListeners();
   
    var url =
        Uri.parse("https://crmapi.srvinfotech.com/taskassign/update_checklist");

    var response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "x-access-token": userDataInformation.read('user_token'),
      },
      body: jsonEncode({
        "assign_id": assignId, //assignId,
        "checklist_id": checkListId.toString(), //checkListId,
        "check_status": checkStatus,
        "percentage": percentage, //percentage,
        "weightage": weightage //weightage,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
       UserTaskController().getTaskList();
    notifyListeners();
      percentage = 0;
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      UpdateCheckListModel userTaskModel = UpdateCheckListModel.fromJson(data);
      notifyListeners();
      isDataLoading = false;
      hasData = true;
      notifyListeners();
    } else {
      //userTaskLists = [];
      isDataLoading = false;
      hasData = false;
      notifyListeners();
    }
  }
}
