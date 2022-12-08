//import 'package:admin/controllers/MenuController.dart';
//import 'package:admin/responsive.dart';
import 'package:crmsrv/dto/UserTasksDto/controller.dart';
import 'package:crmsrv/dto/storage/storage.dart';
import 'package:crmsrv/presentation/dashboard/dashboard_screen.dart';
import 'package:crmsrv/presentation/login_page/screens/login_screen.dart';
import 'package:crmsrv/routes.dart';
import 'package:fluent_ui/fluent_ui.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluent_ui/src/controls/surfaces/dialog.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:provider/provider.dart';
import 'dart:async';

//import '../../../constants.dart';
var defaultPadding = 16.0;
bool startTimerRuniing = false;

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  static const countdownDuration = Duration(seconds: 1);
  Duration duration = Duration();
  Timer? timer;

  bool countUp = true;

  @override
  void initState() {
    // TODO: implement initState
    reset();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (startTimerRuniing) {
      // stopTimer();
      reset();
    } else {
      startTimer();
    }
    super.didChangeDependencies();
  }

  void reset() {
    setState(() => duration = Duration(seconds: 0));
    //print('reset');
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countUp ? 1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png',
            height: 50,
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        Consumer<UserTaskController>(builder: (context, controller, child) {
          if (controller.isTimerVisible) {
            startTimerRuniing = controller.isTimerVisible;
            // controller.play = "play";
          } else {
            startTimerRuniing = controller.isTimerVisible;
            // controller.play = "pause";
          }
          return Visibility(
            visible: controller.isTimerVisible == true,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                hours + ':' + minutes + ':' + seconds,
                style: GoogleFonts.mulish(fontSize: 18, color: Colors.blue),
              ),
            ),
          );
        }),
        //  if (!Responsive.isDesktop(context))

        // if (!Responsive.isMobile(context))

        // Text(
        //   "Dashboard",
        //   style: Theme.of(context).textTheme.headline6,
        // ),
        // if (!Responsive.isMobile(context))
        // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        //Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  void showContentDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Logout'),
        content: const Text(
          'Are you sure to LogOut ?',
        ),
        actions: [
          Button(
            child: const Text('LogOut'),
            onPressed: () {
              //Navigator.pop(context);
              userDataInformation.remove('user_id');
              userDataInformation.remove('task_name');
              Navigator.pushNamed(context, NavRoute.loginScreen);
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: defaultPadding),
      // padding: EdgeInsets.symmetric(
      //   horizontal: defaultPadding,
      //   vertical: defaultPadding / 2,
      // ),
      // decoration: BoxDecoration(
      //   //color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      //   border: Border.all(color: Color.fromARGB(255, 240, 240, 240)),
      // ),
      child: Row(
        children: [
          // CircleAvatar(
          //     child: ClipOval(
          //         child: Image.asset(
          //   'assets/images/default_user_profile.png',
          //   fit: BoxFit.contain,
          // ))),

          Padding(
            padding: const EdgeInsets.only(right: 15, top: 15.0),
            child: Text(
              userDataInformation.read('firstname'),
              //'Amit',
              style: GoogleFonts.mulish(fontSize: 20),
            ),
          ),
          // Icon(Icons.keyboard_arrow_down),
          //Text('Sign Out'),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 15.0),
            child: GestureDetector(
                onTap: () {
                  // userDataInformation.write('isLogged', false);
                  showContentDialog(context);
                  //SessionManager().set("isLogged", false);
                  //userdat.remove('customerId');
                  // Navigator.pushNamed(context, NavRoute.loginScreen);
                },
                child: Image.asset(
                  'assets/images/power_button.png',
                  color: Colors.red,
                  width: 15,
                )),
          )
        ],
      ),
    );
  }
}

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextBox(
//       placeholder: "Search",
//       suffix:  GestureDetector(
//           onTap: () {},
//           child: Container(

//             padding: EdgeInsets.all(defaultPadding * 0.50),
//             margin: EdgeInsets.symmetric(horizontal: defaultPadding / 5),
//               // color: primaryColor,
//              decoration: BoxDecoration(
//               //color: primaryColor,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: Icon(
//               Icons.search,
//               color: Color.fromARGB(255, 0, 0, 0),
//             ),
//           ),
//         ),

//     );
//   }
// }
