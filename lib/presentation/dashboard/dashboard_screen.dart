import 'package:crmsrv/dto/UserLoginDto/controller.dart';
import 'package:crmsrv/dto/storage/storage.dart';
import 'package:crmsrv/presentation/dashboard/components/new_tabel.dart';
import 'package:crmsrv/presentation/dashboard/components/tabel_windows.dart';
import 'package:crmsrv/presentation/dashboard/ndnncn.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crmsrv/presentation/side_menu/side_menu.dart';
import 'package:crmsrv/windows_buttons.dart';
import 'package:crmsrv/windows_tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_tasks.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var defaultPadding = 16.0;
  @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   APIService.generateToken(userDataInformation.read('user_id'))
  //       .then((responce) {
  //     if (responce != null) {
  //       userDataInformation.write('user_token', responce.token);
  //       print(userDataInformation.read('user_token'));
  //     }
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 253, 251), // drawer: SideMenu(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WindowsToolBar(),
            //MyHomePage(),
            Container(
                //width: 450,
                height: 60,
                color: Color.fromARGB(255, 233, 228, 228),
                child: Header()),
            SizedBox(height: defaultPadding),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text('Dashboard',style:GoogleFonts.mulish(fontSize: 18,fontWeight: FontWeight.bold)),
                  //TabelWindows(),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 20),
                    child:  Container(height: 600, width: 900, child: NewTabel()),
                  ),
                
                  // Expanded(
                  //   flex: 5,//
                  //   child: Column(
                  //    // mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       // MyFiles(),
                  //       SizedBox(height: defaultPadding),
                
                  //       // if (Responsive.isMobile(context))
                  //       SizedBox(height: defaultPadding),
                  //       // if (Responsive.isMobile(context)) StarageDetails(),
                  //     ],
                  //   ),
                  // ),
                  //if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  // if (!Responsive.isMobile(context))
                  // Expanded(
                  //   flex: 2,
                  //   child: StarageDetails(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}
