import 'package:crmsrv/dto/CheckListUpdateDto/contoller.dart';
import 'package:crmsrv/dto/CheckListUpdateDto/model.dart';
import 'package:crmsrv/dto/UserTasksDto/controller.dart';
import 'package:crmsrv/dto/UserTasksDto/model.dart';
import 'package:crmsrv/dto/storage/storage.dart';
import 'package:crmsrv/presentation/dashboard/components/no_data.dart';
import 'package:crmsrv/presentation/dashboard/components/recent_tasks.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';

//bool isDisabled = false;
double percentage = 0;
double remainingPercentage = 0;

class NewTabel extends StatefulWidget {
  NewTabel({
    Key? key,
  }) : super(key: key);

  @override
  State<NewTabel> createState() => _NewTabelState();
}

class _NewTabelState extends State<NewTabel> {
  String? customerId;
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<UserTaskController>(context, listen: false).getTaskList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var taskObserver = context.watch<UserTaskController>().userTaskLists;
    return Consumer<UserTaskController>(
      builder: (context, userTaskController, child) {
        return userTaskController.isDataLoading == true
            ? Center(
                child: ProgressBar(),
              )
            : userTaskController.hasData == true
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: userTaskController.userTaskLists?.length,
                    itemBuilder: (context, index) {
                      // Datum complaint = controller.complaintData[index];

                      return TaskStatusTile(
                        index: index,
                        controller: userTaskController,
                      );
                    })
                : const NoData(message: "No Data Found");
      },
    );
  }
}

class TaskStatusTile extends StatefulWidget {
  TaskStatusTile({
    Key? key,
    this.onTap,
    this.index,
    required this.controller,
  }) : super(key: key);

  void Function()? onTap;

  UserTaskController? controller;
  int? index;
  bool? status;
  bool? dropdownVisible;

  @override
  _TaskStatusTileState createState() => _TaskStatusTileState();
}

class _TaskStatusTileState extends State<TaskStatusTile> {
  bool isExtended = false;
  bool selected_task = false;
  bool buttonEnabled = true;
  bool isExtendedVisible = false;
  bool isPlayButtonEnabled = true;
  bool isPauseButtonEnabled = true;

  String id = "--";
  // void showContentDialog(BuildContext context, String? task) async {
  //   final result = await showDialog<String>(
  //     context: context,
  //     builder: (context) => ContentDialog(
  //       title: Text(task.toString()),
  //       content: Text('Please select to start and stop your task!!',
  //           style: GoogleFonts.mulish()),
  //       actions: [
  //         FilledButton(
  //           style: ButtonStyle(backgroundColor: ButtonState.all(Colors.green)),
  //           child: const Text('Start'),
  //           onPressed: () {
  //             Navigator.pop(context, 'User canceled dialog');
  //             if (buttonEnabled) {
  //               selected_task = true; //green
  //               widget.controller?.isTimerVisible = true;
  //               isDisabled = false;
  //               isExtendedVisible = true;
  //             }
  //           },
  //         ),
  //         // FilledButton(
  //         //   style: ButtonStyle(backgroundColor: ButtonState.all(Colors.orange)),
  //         //   child: const Text('Pause'),
  //         //   onPressed: () => Navigator.pop(context, 'User canceled dialog'),
  //         // ),
  //         FilledButton(
  //           style: ButtonStyle(backgroundColor: ButtonState.all(Colors.red)),
  //           child: const Text('Stop'),
  //           onPressed: () {
  //             selected_task = false;
  //             buttonEnabled = true;
  //             isDisabled = true;
  //             isExtendedVisible = false;
  //             widget.controller?.isTimerVisible = false;
  //             WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //               Provider.of<UserTaskController>(context, listen: false)
  //                   .getTaskList();
  //             });
  //             userDataInformation.remove('task_name');
  //             Navigator.pop(context, 'User canceled dialog');
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //   setState(() {});
  // }

  // int _selectedItem = 0;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var taskObserver = context.watch<UserTaskController>().userTaskLists;
    percentage = 0;
    final observer = taskObserver?[widget.index!];
    List<Checklist>? checklist;
    checklist?.clear();
    double? p = widget
        .controller?.userTaskLists?[widget.index!].assignCompletePercentage
        ?.toDouble();

    remainingPercentage = p!;
    // if (p != null)
    //  widget
    //       .controller!.userTaskLists![widget.index!].assignCompletePercentage!
    //       .toDouble();
    // widget.controller?.notifyListeners();
    // remainingPercentage = p!;
    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //Text(widget.controller!.play.toString()),
          GestureDetector(
            onTap: () {
              // // print(id);
              // if (userDataInformation.read('task_name') ==
              //     widget.controller?.userTaskLists?[widget.index!].taskName) {
              //   // showContentDialog(context,
              //   //     widget.controller!.userTaskLists![widget.index!].taskName);
              //   // buttonEnabled = true;
              // } else {
              //   buttonEnabled = false;
              //   isExtended = false;
              // }
              // userDataInformation.writeIfNull('task_name',
              //     widget.controller!.userTaskLists![widget.index!].taskName);
              // //widget.controller!.userTaskLists![widget.index!].taskName!
              // widget.controller?.notifyListeners();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 401,
                  height: 35,
                  //color: const Color(0xff5E88E5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 228, 228, 228)),
                  ),
                  //padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: isExtendedVisible == true,
                        child: GestureDetector(
                            child: isExtended == false
                                ? Icon(
                                    FluentIcons.chevron_right_med,
                                    size: 12,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    FluentIcons.caret_solid_down,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                            onTap: () => setState(() {
                                  isExtended = !isExtended;
                                })),
                      ),
                      if (widget.controller!.userTaskLists![widget.index!]
                              .taskName !=
                          null)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            widget.controller!.userTaskLists![widget.index!]
                                    .taskName
                                    .toString() +
                                widget.controller!.play.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(51, 122, 183, 1),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  width: 84,
                  height: 35,
                  //color: const Color(0xff5E88E5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 228, 228, 228)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 7)
                      .copyWith(right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.controller!.userTaskLists![widget.index!]
                            .assignStartdate
                            .toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 14, 13, 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 84,
                  height: 35,
                  // color: const Color(0xff5E88E5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 223, 223, 223)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.controller!.userTaskLists![widget.index!]
                          .assignEnddate
                          .toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 15, 13, 13),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 98,
                    height: 35,
                    // color: const Color(0xff5E88E5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 228, 228, 228)),
                    ),
                    //padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFProgressBar(
                        percentage: p /
                            100, //observer!.assignCompletePercentage! / 100,
                        lineHeight: 18,
                        alignment: MainAxisAlignment.spaceBetween,
                        backgroundColor: Color.fromARGB(255, 197, 191, 191),
                        progressBarColor: Color.fromARGB(255, 97, 97, 214),
                        child: Center(
                          child: Text(
                            widget.controller!.userTaskLists![widget.index!]
                                .assignCompletePercentage
                                .toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 254, 254)),
                          ),
                        ),
                      ),
                    )),
                // Container(
                //     width: 40,
                //     height: 35,
                //     // color: const Color(0xff5E88E5),
                //     decoration: BoxDecoration(
                //       border: Border.all(
                //           width: 1, color: Color.fromARGB(255, 228, 228, 228)),
                //     ),
                //     padding: const EdgeInsets.symmetric(horizontal: 2),
                //     child: Container(
                //         margin: EdgeInsets.all(5.0),
                //         decoration: BoxDecoration(
                //             color: selected_task
                //                 ? Color.fromARGB(255, 109, 190, 15)
                //                 : Color.fromARGB(255, 192, 189, 189),
                //             shape: BoxShape.circle))),
                Container(
                    width: 40,
                    height: 35,
                    // color: const Color(0xff5E88E5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 228, 228, 228)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Button(
                      child: isPlayButtonEnabled
                          ? Icon(FluentIcons.play_solid)
                          : Center(
                              child: Icon(
                              FluentIcons.pause,
                              color: Colors.black,
                            )),
                      onPressed: () {
                        //isPlayButtonEnabled = !isPlayButtonEnabled;
                        userDataInformation.writeIfNull(
                            'task_name',
                            widget.controller!.userTaskLists![widget.index!]
                                .taskName);
                        if (userDataInformation.read('task_name') ==
                            widget.controller?.userTaskLists?[widget.index!]
                                .taskName) {
                          isPlayButtonEnabled = !isPlayButtonEnabled;

                          widget.controller!.notifyListeners();
                          if (isPlayButtonEnabled) {
                            userDataInformation.remove('task_name');
                            isExtendedVisible = false;
                            isExtended = false;
                            // isDisabled = true;
                          } else {
                            isExtendedVisible = true;
                            // isDisabled = false;
                          }
                        } else {
                          // isPlayButtonEnabled = false;

                        }
                      },
                    )),
              ],
            ),
          ),
          Visibility(
            replacement: SizedBox.shrink(),
            visible: isExtended == true,
            child: Container(
                width: 900,
                height: 160,
                child: ListView.builder(
                    itemCount: widget.controller?.userTaskLists?[widget.index!]
                        .checklist?.length,
                    itemBuilder: (context, int index) {
                      return CustomTaskline(
                        checklist: widget.controller
                            ?.userTaskLists?[widget.index!].checklist,
                        index: index,
                        widgetIndex: widget.index,
                        controller: widget.controller,
                      );
                    })),
          ),
        ],
      ),
    );
  }
}

class CustomTaskline extends StatefulWidget {
  List<Checklist>? checklist;
  int? index;
  int? widgetIndex;
  UserTaskController? controller;
  CustomTaskline(
      {Key? key, this.checklist, this.index, this.controller, this.widgetIndex})
      : super(key: key);

  @override
  State<CustomTaskline> createState() => _CustomTasklineState();
}

class _CustomTasklineState extends State<CustomTaskline> {
  bool b = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // percentage = percentage / 100;

    super.initState();
  }

  Widget build(BuildContext context) {
    bool checked = false;
    var taskObserver = context
        .watch<UserTaskController>()
        .userTaskLists?[widget.widgetIndex!]
        .checklist;
    final observer = taskObserver?[widget.index!];
    print(observer?.isChecked);
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 401,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.checklist![widget.index!].checklistName.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 228, 228, 228)),
          ),
        ),
        Container(
          width: 84,
          height: 30,
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 228, 228, 228)),
          ),
        ),
        Container(
          width: 84,
          height: 30,
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 228, 228, 228)),
          ),
        ),
        Container(
          width: 98,
          height: 30,
          // child: Text(widget.checklist![widget.index!].isChecked.toString()),
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 228, 228, 228)),
          ),
        ),
        Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 228, 228, 228)),
          ),
          child: Center(
            child: Consumer<CheckListUpdateController>(
                // stream: null,
                builder: (context, controller, child) {
              return MSHCheckbox(
                  size: 20,
                  value: widget.checklist![widget.index!].isChecked!,
                  // isDisabled: isDisabled,

                  checkedColor: Colors.blue,
                  uncheckedColor: Colors.blue,

                  //style: style,
                  onChanged: (bool? newValue) {
                    //setState(() {
                    widget.checklist![widget.index!].isChecked = newValue!;
                       String? assignId = widget
                          .controller?.userTaskLists?[widget.widgetIndex!].id;
                     
                     int? weightage =
                          widget.checklist![widget.index!].weightage;
                       String? checkListId = widget.checklist![widget.index!].id;
                     percentage = percentage + weightage!;
                    if (widget.checklist![widget.index!].isChecked!) {
                      //selectedItem = checkBoxListTileModel[index].title;
                      checked = widget.checklist![widget.index!].isChecked!;
                   
                      
                     

                     
                      controller.updateCheckList(checked, checkListId!,
                          percentage, assignId!, weightage, context);
                     controller.notifyListeners();      
                    } else {
                      //selectedItem = '';
                      String? checkListId = widget.checklist![widget.index!].id;
                      checked = widget.checklist![widget.index!].isChecked!;
                      String? assignId = widget
                          .controller?.userTaskLists?[widget.widgetIndex!].id;
                      int? weightage =
                          widget.checklist![widget.index!].weightage;

                      percentage = percentage - weightage!;
                      controller.updateCheckList(checked, checkListId!,
                          percentage, assignId!, weightage, context);
                      controller.notifyListeners();
                    }
                    //});
                  });
            }),
          ),
        ),
      ],
    );
  }
}
