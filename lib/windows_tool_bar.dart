import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crmsrv/presentation/login_page/screens/splash_screen.dart';
import 'package:crmsrv/windows_buttons.dart';
import 'package:flutter/material.dart';

class WindowsToolBar extends StatelessWidget {
  const WindowsToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: WindowTitleBarBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WindowsButtons(),
          ],
        ),
      ),
    );
  }
}
