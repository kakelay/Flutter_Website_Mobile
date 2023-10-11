// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_responsive/share_widget/drawer.dart';
import 'share_widget/navbar.dart';
import 'responsive_widget/responsive_widget.dart';

void main() {
  runApp(const HomePage());
}

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.green,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool isDarkMode = false;

class _HomePageState extends State<HomePage> {
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDarkMode ? darkTheme : lightTheme;

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: isDarkMode ? Colors.black26 : Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (MediaQuery.of(context).size.width > 600)
                Text(
                  'KakElay Portfolio',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                )
              else
                const Text('KakElay Portfolio'),
              if (MediaQuery.of(context).size.width > 880)
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Expanded(
                        child: MyNavbar(),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: toggleTheme,
                icon: isDarkMode
                    ? Icon(
                        Icons.wb_sunny,
                        color: isDarkMode ? Colors.white : Colors.black,
                      )
                    : Icon(
                        Icons.brightness_2,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: const [
            Column(
              children: [
                MyResponsiveWidget(),
              ],
            ),
          ],
        ),
        drawer:
            MediaQuery.of(context).size.width > 870 ? null : const MyDrawer(),
        // bottomNavigationBar:
        //     MediaQuery.of(context).size.width > 600 ? const MyNavbar() : null,
      ),
    );
  }
}
