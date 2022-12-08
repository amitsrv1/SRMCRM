import 'dart:ffi';
import 'dart:ui';
import 'package:crmsrv/dto/UserLoginDto/controller.dart';
import 'package:crmsrv/dto/UserLoginDto/model.dart';
import 'package:crmsrv/dto/storage/storage.dart';
import 'package:crmsrv/routes.dart';
import 'package:crmsrv/windows_tool_bar.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:tabler_icons/tabler_icons.dart';

final userNameInputController = TextEditingController();
final passwordInputController = TextEditingController();
bool _obscureText = true;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  @override
  void initState() {
    // TODO: implement initState
     userDataInformation.writeIfNull('isLogged', false);
    super.initState();
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }
   
  void showContentDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: Center(child: const Text('Invalid Information!')),
        content: Text(
            'Please enter  valid credentials, your username or password may be incorrect!!',
            style: GoogleFonts.mulish()),
        actions: [
          FilledButton(
            style: ButtonStyle(backgroundColor: ButtonState.all(Colors.red)),
            child: Center(child: const Text('okay')),
            onPressed: () => Navigator.pop(context, 'User canceled dialog'),
          ),
        ],
      ),
    );
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Container(
        // backgroundColor: Colors.white,
        child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 250, 250),
                image: DecorationImage(
                  image: AssetImage("assets/images/srv_background_image.jpg"),
                  fit: BoxFit.cover,
                ))),
        //    Image.asset(
        //   'assets/images/srv_logo.png',
        //   width: 200,
        //   height: 50,
        // ),
        Column(
          children: [
            WindowsToolBar(),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 400,
                height: 405,
                margin: EdgeInsets.only(left:60,right:60),
                
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Color.fromARGB(255, 255, 250, 250),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 200,
                            height: 120,
                          ),
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // Text('srv'.toUpperCase(),
                        //     style: GoogleFonts.playfairDisplaySc(
                        //         fontSize: 100,
                        //         fontWeight: FontWeight.w600,
                        //         color: Color.fromARGB(255, 10, 79, 145)))
                      ],
                    ),
                    Center(
                        child: Text('Welcome Back !',
                            style: GoogleFonts.mulish(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold))),
                    Center(
                        child: Text(
                            'Sign in to continue to SRV IT Hub Private Limited',
                            style: GoogleFonts.mulish(
                                color: Color.fromARGB(255, 192, 190, 190),
                                fontWeight: FontWeight.normal))),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        // width: 400,
                        // height: 40,
                        margin: EdgeInsets.only(left: 40, right: 20),
                        child: TextBox(
                          highlightColor:Color.fromARGB(255, 219, 218, 218),
                          unfocusedColor:Color.fromARGB(255, 219, 218, 218),
                          toolbarOptions: ToolbarOptions(copy: true,cut: true,paste: true,selectAll:true),
                          keyboardType: TextInputType.text,
                          strutStyle: StrutStyle(),
                          autofocus: false,
                          obscuringCharacter: '*',
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                          textCapitalization: TextCapitalization.characters,
                          header: 'Username',
                          headerStyle: GoogleFonts.mulish(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                          selectionHeightStyle: BoxHeightStyle.tight,
                          placeholder: 'Enter Your Name',
                          controller: userNameInputController,
                          enableSuggestions: true,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 211, 222, 230),
                              borderRadius: BorderRadius.circular(10)
                              ),
                              
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        // width: 400,
                        // height: 50,
                        margin: EdgeInsets.only(left: 40, right: 20),

                        child: TextBox(
                          // maxLines: 2,
                          header: 'Password',
                           toolbarOptions: ToolbarOptions(copy: true,cut: true,paste: true,selectAll:true),
                          headerStyle: GoogleFonts.mulish(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                          placeholder: 'Enter Password',
                          controller: passwordInputController,
                           enableSuggestions: true,
                           highlightColor:Color.fromARGB(255, 219, 218, 218),
                           unfocusedColor: Color.fromARGB(255, 219, 218, 218),
                          obscureText: _obscured,
                          suffix: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? TablerIcons.eye
                                  : TablerIcons.eye_off,
                              size: 15,color:  _obscured? Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 17, 2, 2),
                            ),
                          ),
                          decoration: BoxDecoration(
                              //border: OutlineInputBorder(),
                              color: Color.fromARGB(255, 211, 222, 230),
                              borderRadius: BorderRadius.circular(10)

                              ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text(userDataInformation.read('seesion_value').toString()),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 35,
                            width: 100,
                            margin: const EdgeInsets.all(22),
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: FilledButton(
                              //style: ButtonStyle()
                              onPressed: () async {
                               
                                   APIService.userLoginApi(
                                        userNameInputController.text,
                                        passwordInputController.text)
                                    .then((value) {
                                  if (value == "failed") {
                                    showContentDialog(context);
                                  } else {
                                    Navigator.pushReplacementNamed(
                                        context, NavRoute.dashboard);
                                  }
                                });

                                
                               
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.lock,
                    //         size: 15,
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text('Frogot Password ?'),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
