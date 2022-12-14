import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SideMenu(
          controller: page,
          style: SideMenuStyle(
            // showTooltip: false,
            displayMode: SideMenuDisplayMode.auto,
            // hoverColor: Colors.blue[100],
            //selectedColor: Colors.lightBlue,
            //selectedTitleTextStyle: const TextStyle(color: Colors.white),
            // selectedIconColor: Colors.white,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            // backgroundColor: Colors.blueGrey[700]
          ),
          title: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  maxWidth: 150,
                ),
                child: Image.asset(
                  'assets/images/srv_logo.png',
                ),
              ),
              // const Divider(
              //   indent: 8.0,
              //   endIndent: 8.0,
              // ),
            ],
          ),
          footer: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'mohada',
              style: TextStyle(fontSize: 15),
            ),
          ),
          items: [
            SideMenuItem(
              priority: 0,
              title: 'Dashboard',
              onTap: () {
                page.jumpToPage(0);
              },
              icon: const Icon(Icons.home),
              badgeContent: const Text(
                '3',
                //style: TextStyle(color: Colors.white),
              ),
              tooltipContent: "This is a tooltip for Dashboard item",
            ),
            SideMenuItem(
              priority: 1,
              title: 'Users',
              onTap: () {
                page.jumpToPage(1);
              },
              icon: const Icon(Icons.supervisor_account),
            ),
            SideMenuItem(
              priority: 2,
              title: 'Files',
              onTap: () {
                page.jumpToPage(2);
              },
              icon: const Icon(Icons.file_copy_rounded),
              trailing: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3),
                    child: Text(
                      'New',
                      // style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                    ),
                  )),
            ),
            SideMenuItem(
              priority: 3,
              title: 'Download',
              onTap: () {
                page.jumpToPage(3);
              },
              icon: const Icon(Icons.download),
            ),
            SideMenuItem(
              priority: 4,
              title: 'Settings',
              onTap: () {
                page.jumpToPage(4);
              },
              icon: const Icon(Icons.settings),
            ),
            // SideMenuItem(
            //   priority: 5,
            //   onTap: () {
            //     page.jumpToPage(5);
            //   },
            //   icon: const Icon(Icons.image_rounded),
            // ),
            // SideMenuItem(
            //   priority: 6,
            //   title: 'Only Title',
            //   onTap: () {
            //     page.jumpToPage(6);
            //   },
            // ),
            const SideMenuItem(
              priority: 7,
              title: 'Exit',
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            controller: page,
            children: [
              Container(
                //color: Colors.white,
                child: const Center(
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                // color: Colors.white,
                child: const Center(
                  child: Text(
                    'Users',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                // color: Colors.white,
                child: const Center(
                  child: Text(
                    'Files',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 240, 240, 240),
                child: const Center(
                  child: Text(
                    'Download',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 240, 240, 240),
                child: const Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 240, 240, 240),
                child: const Center(
                  child: Text(
                    'Only Title',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 240, 240, 240),
                child: const Center(
                  child: Text(
                    'Only Icon',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
