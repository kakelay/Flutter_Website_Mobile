import 'package:flutter/material.dart';
import 'package:group_grid_view/group_grid_view.dart';
import 'package:test_responsive/share_widget/group_grid_view.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => toggleTheme(),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: isDarkMode
                          ? [
                              Colors.red,
                              Colors.blue,
                            ]
                          : [
                              Colors.grey,
                              Colors.white,
                            ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/kakelay.png',
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Flutter Developer',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.cyan.shade300,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'This is my portfolio',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      const   GroudGridViewPage()
      ],
    );
  }
}

