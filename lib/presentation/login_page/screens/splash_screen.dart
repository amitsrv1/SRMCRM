// import 'package:crmsrv/presentation/dashboard/dashboard_screen.dart';
// import 'package:crmsrv/presentation/login_page/screens/login_screen.dart';
// import 'package:crmsrv/windows_tool_bar.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:get_storage/get_storage.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';

// final userDataInformation = GetStorage();

// class SplahScreen extends StatefulWidget {
//   const SplahScreen({Key? key}) : super(key: key);

//   @override
//   State<SplahScreen> createState() => _SplahScreenState();
// }

// class _SplahScreenState extends State<SplahScreen> {
//   @override
//   void initState() {
//     // userDataInformation.write('isLogged', false);
//     SessionManager().set("isLogged", false);
//     Future.delayed(const Duration(microseconds: 3000), () async {
//       startTimer();
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //print(MediaQuery.of(context).size.height);
//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           WindowsToolBar(),
//           Expanded(
//               child: Image.asset(
//             'assets/images/srv_logo.png',
//             width: 200,
//             height: 50,
//           )),
//         ],
//       ),
//     );
//   }

//   startTimer() {
//     var _duration = const Duration(seconds: 2, milliseconds: 1000);

//     return Timer(_duration, navigate);
//   }

//   void navigate() {
//     // userDataInformation.read("isLogged") != null
//     //     ? userDataInformation.read("isLogged") == false
//     //         ? Navigator.of(context).pushReplacement(PageRouteBuilder(
//     //             transitionDuration: Duration(seconds: 10),
//     //             pageBuilder: (_, __, ___) => DashboardScreen()))
//     //         : Navigator.of(context).pushReplacement(PageRouteBuilder(
//     //             transitionDuration: Duration(seconds: 10),
//     //             pageBuilder: (_, __, ___) => const LoginScreen()))
//     //     : Navigator.of(context).pushReplacement(PageRouteBuilder(
//     //         transitionDuration: Duration(seconds: 10),
//     //         pageBuilder: (_, __, ___) => LoginScreen()));
//     print(SessionManager().get("isLogged"));
//     SessionManager().get("isLogged") == true
//         ? Navigator.of(context).pushReplacement(PageRouteBuilder(
//             transitionDuration: Duration(seconds: 10),
//             pageBuilder: (_, __, ___) => DashboardScreen()))
//         : Navigator.of(context).pushReplacement(PageRouteBuilder(
//             transitionDuration: Duration(seconds: 10),
//             pageBuilder: (_, __, ___) => const LoginScreen()));
//   }
// }
