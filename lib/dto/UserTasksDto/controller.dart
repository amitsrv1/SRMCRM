import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:crmsrv/dto/UserTasksDto/model.dart';
import 'package:crmsrv/dto/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class UserTaskController with ChangeNotifier {
  bool isDataLoading = false;
  bool hasData = true;
  bool isTimerVisible = false;
  // bool isplayEnabled = false;
  String play = "";
  UserTaksModel userTaskModel = UserTaksModel();

  List<Datum>? userTaskLists = [];
  // static const countdownDuration = Duration(minutes: 10);
  // Duration duration = Duration();
  // Timer? timer;

  // bool countDown = true;
  // void reset() {
  //   if (countDown) {
  //     duration = countdownDuration;
  //     notifyListeners();
  //   } else {
  //     duration = Duration();
  //   }
  // }

  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  // }

  // void addTime() {
  //   final addSeconds = countDown ? -1 : 1;
  //   notifyListeners();
  //   final seconds = duration.inSeconds + addSeconds;
  //   notifyListeners();
  //   if (seconds < 0) {
  //     timer?.cancel();
  //     notifyListeners();
  //   } else {
  //     duration = Duration(seconds: seconds);
  //     notifyListeners();
  //   }
  //   // notifyListeners();
  // }

  // void stopTimer({bool resets = true}) {
  //   if (resets) {
  //     reset();
  //     notifyListeners();
  //   }
  //   timer?.cancel();
  //   notifyListeners();
  // }
  
  getTaskList() async {
    print(userDataInformation.read('user_id'));
    print(userDataInformation.read('user_token'));
    if (userDataInformation.read('user_id') != null) isDataLoading = true;
    userTaskLists = [];
    notifyListeners();

    /// print(token);
    String url = "https://crmapi.srvinfotech.com/project_dashboard/my_tasks";
    //  String url="${coreUrl}web/applied_job?candidate_id=$candidateId";
    print(url);

    // try {
    https.Response response = await https.get(Uri.parse(url),
        headers: {"x-access-token": userDataInformation.read('user_token')});
    //print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
        userTaskModel = UserTaksModel.fromJson(data);
      userTaskLists?.clear();
      userTaskLists?.addAll(userTaskModel.data ?? []);

      print(userTaskLists?.length);

      isDataLoading = false;
      hasData = true;
      notifyListeners();
    } else {
      userTaskLists = [];
      isDataLoading = false;
      hasData = false;
      notifyListeners();
    }
    // } catch (e) {
    //   isSavedLoading = false;
    //   notifyListeners();
    //   return e.toString();
    // }
  }
}
