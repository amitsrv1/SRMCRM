// import 'package:crmsrv/dto/UserTasksDto/controller.dart';
// import 'package:crmsrv/dto/UserTasksDto/model.dart';
// import 'package:crmsrv/presentation/dashboard/components/new_tabel.dart';
// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/rendering.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:msh_checkbox/msh_checkbox.dart';
// import 'package:provider/provider.dart';

// bool isPlayButtonEnabled = false;
// bool checked = false;
// bool isDisabled = false;
// bool isExpanded = false;

// class TabelWindows extends StatefulWidget {
//   const TabelWindows({super.key});

//   @override
//   State<TabelWindows> createState() => _TabelWindowsState();
// }

// class _TabelWindowsState extends State<TabelWindows> {
//   Widget taskTabel(UserTaskController userTaskController, int index) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 401,
//               height: 30,
//               //color: const Color(0xff5E88E5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1, color: Color.fromARGB(255, 228, 228, 228)),
//               ),
//               //padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                         child: isExpanded == false
//                             ? Icon(
//                                 FluentIcons.chevron_right_med,
//                                 size: 10,
//                               )
//                             : Icon(
//                                 FluentIcons.caret_solid_down,
//                                 size: 10,
//                                 color: Colors.black,
//                               ),
//                         onTap: () => setState(() {
//                               isExpanded = !isExpanded;
//                             })),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 2),
//                       child: Text(
//                         userTaskController.userTaskLists![index].taskName
//                             .toString(),
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.mulish(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromARGB(255, 50, 81, 150),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               width: 84,
//               height: 30,
//               //color: const Color(0xff5E88E5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1, color: Color.fromARGB(255, 228, 228, 228)),
//               ),
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 7).copyWith(right: 4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     userTaskController.userTaskLists![index].assignStartdate
//                         .toString(),
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.mulish(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromARGB(255, 14, 13, 13),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 84,
//               height: 30,
//               // color: const Color(0xff5E88E5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1, color: Color.fromARGB(255, 228, 228, 228)),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 7),
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(
//                   userTaskController.userTaskLists![index].assignEnddate
//                       .toString(),
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.mulish(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromARGB(255, 15, 13, 13),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//                 width: 98,
//                 height: 30,
//                 // color: const Color(0xff5E88E5),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       width: 1, color: Color.fromARGB(255, 228, 228, 228)),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 7),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GFProgressBar(
//                     percentage: percentage,
//                     lineHeight: 15,
//                     alignment: MainAxisAlignment.spaceBetween,
//                     // leading: Icon(Icons.sentiment_dissatisfied,
//                     //     color: Color.fromARGB(255, 245, 17, 10)),
//                     // trailing: Icon(Icons.sentiment_satisfied,
//                     //     color: Color.fromARGB(255, 75, 190, 75)),
//                     backgroundColor: Color.fromARGB(255, 197, 191, 191),
//                     progressBarColor: Color.fromARGB(255, 97, 97, 214),
//                     child: const Text(
//                       '70%',
//                       textAlign: TextAlign.end,
//                       style: TextStyle(
//                           fontSize: 12, color: Color.fromARGB(255, 3, 3, 3)),
//                     ),
//                   ),
//                 )),
//             Container(
//               width: 40,
//               height: 30,
//               // color: const Color(0xff5E88E5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1, color: Color.fromARGB(255, 228, 228, 228)),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isPlayButtonEnabled = !isPlayButtonEnabled;
//                           // isExtended = isPlayButtonEnabled;
//                         });
//                       },
//                       child: isPlayButtonEnabled == false
//                           ? Icon(
//                               FluentIcons.play_solid,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             )
//                           : Icon(
//                               FluentIcons.pause,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ))
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Visibility(
//           replacement: SizedBox.shrink(),
//           visible: isExpanded == true,
//           child: Container(
//             //width: 600,
//             height: 100,
//             child: SingleChildScrollView(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   //scrollDirection:Axis.vertical,
//                   addRepaintBoundaries: true,
//                   itemCount:
//                       userTaskController.userTaskLists?[index].checklist?.length,
//                   itemBuilder: (context, int index) {
//                     List<Checklist>? checklist =
//                         userTaskController.userTaskLists?[index].checklist;
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 401,
//                           height: 30,
//                           //color: const Color(0xff5E88E5),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: Color.fromARGB(255, 228, 228, 228)),
//                           ),
//                           //padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 checklist![index].checklistName.toString(),
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.mulish(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color.fromARGB(255, 50, 81, 150),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: 84,
//                           height: 30,
//                           //color: const Color(0xff5E88E5),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: Color.fromARGB(255, 228, 228, 228)),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 7)
//                               .copyWith(right: 4),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.mulish(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color.fromARGB(255, 14, 13, 13),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: 84,
//                           height: 30,
//                           // color: const Color(0xff5E88E5),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: Color.fromARGB(255, 228, 228, 228)),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 7),
//                           child: FittedBox(
//                             fit: BoxFit.scaleDown,
//                             child: Text(
//                               "",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.mulish(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color.fromARGB(255, 15, 13, 13),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 98,
//                           height: 30,
//                           // color: const Color(0xff5E88E5),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: Color.fromARGB(255, 228, 228, 228)),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 2),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.mulish(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color.fromARGB(255, 3, 2, 2),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: 40,
//                           height: 30,
//                           // color: const Color(0xff5E88E5),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: Color.fromARGB(255, 228, 228, 228)),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 2),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Center(
//                                 child: MSHCheckbox(
//                                   size: 20,
//                                   value: checked,
//                                   isDisabled: isDisabled,
            
//                                   checkedColor: Colors.blue,
//                                   uncheckedColor: Colors.blue,
            
//                                   //style: style,
//                                   onChanged: (selected) {
//                                     setState(() {
//                                       checked = selected;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       Provider.of<UserTaskController>(context, listen: false).getTaskList();
//     });

//     super.initState();
//   }

//   void itemChange(bool val, int index) {
//     setState(() {
//       // checkBoxListTileModel[index].isCheck = val;
//       //checked[index] = val;
//     });
//   }

//   double height = 30;
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserTaskController>(
//         builder: (context, userTaskController, child) {
//       // var lenght = userTaskController.userTaskLists?.length;
//       height = height * 10;
//       return userTaskController.isDataLoading
//           ? ProgressRing()
//           : Container(
//               width: 710,
//               height: 300,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1, color: Color.fromARGB(255, 228, 228, 228)),
//               ),
//               child: ListView.builder(
//                   itemCount: userTaskController.userTaskLists?.length,
//                   itemBuilder: (context, index) {
//                     return taskTabel(userTaskController, index);
//                   }),
//             );
//     });
//   }
// }
