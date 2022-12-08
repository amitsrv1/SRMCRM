import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

showAlertErrorDialog( BuildContext context, String alertMessage,
    continueMsg, VoidCallback? onPressed) {
  // set up the buttons
    int selectedIndex = 0;

  Widget continueButton = SizedBox(
    height: 40,
    width: 125,
    child: ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 165, 63, 63),
        side: const BorderSide(
          color: Color.fromARGB(255, 165, 87, 63),
        ),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        ),
      
      ),
      onPressed: onPressed,
      child: Center(child: Text(continueMsg,textAlign: TextAlign.center,style: GoogleFonts.mulish(color:Colors.white))),
    ),
  );
  // Widget cancelButton = SizedBox(
  //    height: 40,
  //   width: 125,
  //   child: ElevatedButton(
  //     child:Text(dismissMsg,textAlign: TextAlign.center,style: GoogleFonts.mulish(color:Colors.green),),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //     style:ElevatedButton.styleFrom(
  //       backgroundColor: const Color(0xFFFFFFFF),
  //       side: const BorderSide(
  //         color: Color(0xff3FA54A),
  //       ),
  //       shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5),
  //       ),
      
  //     )
  //   ),
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Icon(Icons.error),
    //Text(alertTitle,style: GoogleFonts.mulish(color:Colors.green,fontWeight: FontWeight.w800)
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[Text(alertMessage,textAlign:TextAlign.center,style: GoogleFonts.mulish(color:const Color(0xff8A8A8A),))],
      ),
    ),
    actions: [
      continueButton,
      //cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context:  context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

