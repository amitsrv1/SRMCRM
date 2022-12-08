import 'package:crmsrv/dto/CheckListUpdateDto/contoller.dart';
import 'package:crmsrv/dto/UserTasksDto/controller.dart';
import 'package:crmsrv/dto/storage/storage.dart';

import 'package:crmsrv/presentation/dashboard/dashboard_screen.dart';

import 'package:crmsrv/presentation/login_page/screens/login_screen.dart';
import 'package:crmsrv/presentation/login_page/screens/splash_screen.dart';
import 'package:crmsrv/routes.dart';
import 'package:crmsrv/windows_tool_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:system_theme/system_theme.dart';
//import 'package:fluent_ui/fluent_ui.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
     ChangeNotifierProvider(create: (_) => UserTaskController(),),
     ChangeNotifierProvider(create: (_) => CheckListUpdateController(),),
  ],child: MyApp(),));
  doWhenWindowReady(() {
    const initialSize = Size(900, 600);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
   // appWindow.alignment = Alignment
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
        designSize: const Size(800, 600),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => FluentApp(
              title: 'SRV CRM App',
              debugShowCheckedModeBanner: false,
                routes: {
                NavRoute.dashboard: ((context) => DashboardScreen()),
                 NavRoute.loginScreen: ((context) => LoginScreen()),
              },
              home: userDataInformation.read('user_id') != null &&userDataInformation.read('user_id') != '' ?DashboardScreen(): LoginScreen(),
            ));
  }
}

