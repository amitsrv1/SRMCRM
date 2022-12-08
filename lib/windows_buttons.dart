import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowsButtons extends StatefulWidget {
  const WindowsButtons({super.key});

  @override
  State<WindowsButtons> createState() => _WindowsButtonsState();
}

class _WindowsButtonsState extends State<WindowsButtons> {
  @override
  Widget build(BuildContext context) {
    void maximizeOrRestore() {
      setState(() {
        appWindow.maximizeOrRestore();
      });
    }
    final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

    return Row(
      children: [
       MinimizeWindowButton(colors: buttonColors),
        // appWindow.isMaximized
        //     ? RestoreWindowButton(
        //         colors: buttonColors,
        //         onPressed: maximizeOrRestore,
        //       )
        //     : MaximizeWindowButton(
        //         colors: buttonColors,
        //         onPressed: maximizeOrRestore,
        //       ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
