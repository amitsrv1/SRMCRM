//mport 'package:admin/models/RecentFile.dart';
//import 'package:data_table_2/data_table_2.dart';
//import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter_svg/svg.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../constants.dart';
var defaultPadding = 16.0;
bool isExtended = true;
bool isPlayButtonEnabled = true;
bool checked = false;

class RecentTaks extends StatefulWidget {
  const RecentTaks({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentTaks> createState() => _RecentTaksState();
}

class _RecentTaksState extends State<RecentTaks> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        // borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Recent Task",
          //  // style: Theme.of(context).textTheme.subtitle1,
          // ),

          Table(
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(0.2),
              },
              border: TableBorder.all(
                  width: 1, color: Color.fromARGB(255, 243, 101, 101)),
              children: [
                TableRow(children: [
                  Column(
                    children: [
                      Row(children: [
                        Visibility(
                          visible: true,
                          child: IconButton(
                            //behavior: HitTestBehavior.translucent,
                            icon: isExtended == true
                                ? Container(
                                    child: Icon(
                                    FluentIcons.chevron_right_med,
                                    size: 8,
                                    color: Colors.black,
                                  ))
                                : Container(
                                    child: Icon(
                                    FluentIcons.arrow_down_right8,
                                    size: 2,
                                    color: Colors.black,
                                  )),
                            onPressed: () {
                              // setState(() {
                              //   isExtended = !isExtended;
                              // });
                              //showContentDialog(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Complaint Task  Status Response -scripting',
                              style: GoogleFonts.mulish(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 90, 73, 165))),
                        )
                      ]),
                    ],
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('22-02-022',
                          style: GoogleFonts.mulish(fontSize: 14.0)),
                    )
                  ]),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('22-02-022',
                          style: GoogleFonts.mulish(fontSize: 14.0)),
                    )
                  ]),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFProgressBar(
                        percentage: 0.9,
                        lineHeight: 15,
                        alignment: MainAxisAlignment.spaceBetween,
                        child: const Text(
                          '70%',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 3, 3, 3)),
                        ),
                        // leading: Icon(Icons.sentiment_dissatisfied,
                        //     color: Color.fromARGB(255, 245, 17, 10)),
                        // trailing: Icon(Icons.sentiment_satisfied,
                        //     color: Color.fromARGB(255, 75, 190, 75)),
                        backgroundColor: Color.fromARGB(255, 197, 191, 191),
                        progressBarColor: Color.fromARGB(255, 97, 97, 214),
                      ),
                    )
                  ]),
                  isPlayButtonEnabled
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPlayButtonEnabled = false;
                                    });
                                  },
                                  child: Icon(
                                    FluentIcons.play_solid,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ))),
                        )
                      : Center(
                          child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                FluentIcons.pause,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )),
                        )
                  // Column(children: [Icon(Icons.play_arrow)]),
                ]),
              ]),
        ],
      ),
    );
  }
}

 listOfTasks(void Function(bool?)? onchanged) {
  return TableRow(children: [
    Column(
      children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Validate',
                style: GoogleFonts.mulish(
                    fontSize: 15.0, color: Color.fromARGB(255, 90, 73, 165))),
          )
        ]),
      ],
    ),
    Column(children: []),
    Column(children: []),
    Column(children: []),
    Center(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Checkbox(
            //style: CheckboxThemeData.standard(ThemeData.raw(typography:Typography., accentColor: accentColor, activeColor: activeColor, inactiveColor: inactiveColor, inactiveBackgroundColor: inactiveBackgroundColor, disabledColor: disabledColor, shadowColor: shadowColor, uncheckedColor: uncheckedColor, checkedColor: checkedColor, borderInputColor: borderInputColor, fasterAnimationDuration: fasterAnimationDuration, fastAnimationDuration: fastAnimationDuration, mediumAnimationDuration: mediumAnimationDuration, slowAnimationDuration: slowAnimationDuration, animationCurve: animationCurve, brightness: brightness, visualDensity: visualDensity, scaffoldBackgroundColor: scaffoldBackgroundColor, acrylicBackgroundColor: acrylicBackgroundColor, micaBackgroundColor: micaBackgroundColor, buttonTheme: buttonTheme, checkboxTheme: checkboxTheme, chipTheme: chipTheme, toggleSwitchTheme: toggleSwitchTheme, bottomNavigationTheme: bottomNavigationTheme, iconTheme: iconTheme, splitButtonTheme: splitButtonTheme, dialogTheme: dialogTheme, tooltipTheme: tooltipTheme, dividerTheme: dividerTheme, navigationPaneTheme: navigationPaneTheme, radioButtonTheme: radioButtonTheme, toggleButtonTheme: toggleButtonTheme, sliderTheme: sliderTheme, infoBarTheme: infoBarTheme, focusTheme: focusTheme, scrollbarTheme: scrollbarTheme, snackbarTheme: snackbarTheme, pillButtonBarTheme: pillButtonBarTheme, bottomSheetTheme: bottomSheetTheme, menuColor: menuColor, cardColor: cardColor, resources: resources)) ,
            checked: checked,
            onChanged: onchanged,// (v) => setState(() => checked = v!),
          )),
    )

    // Column(children: [Icon(Icons.play_arrow)]),
  ]);
}
