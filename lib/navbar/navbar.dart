// import 'package:flutter/material.dart';
// import '../share_widget/navbar_items.dart';

// class MyNavbar extends StatefulWidget {
//   const MyNavbar({Key? key}) : super(key: key);

//   @override
//   State<MyNavbar> createState() => _MyNavbarState();
// }

// class _MyNavbarState extends State<MyNavbar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           NavbarItem(
//             label: 'Home',
//             onTap: null,
//             color: null,
//             isSelected: true,
//           ),
//           NavbarItem(
//             label: 'About Us',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//           NavbarItem(
//             label: 'Contact',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//           NavbarItem(
//             label: 'Blog',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//           NavbarItem(
//             label: 'Project',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//           NavbarItem(
//             label: 'Services',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//           NavbarItem(
//             label: 'Blog',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//           NavbarItem(
//             label: 'Project',
//             onTap: null,
//             color: null,
//             isSelected: false,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text(
          'Home',
          style: TextStyle(color: isDarkMode?Colors.black : Colors.white)
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Contact',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Project',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Blog',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Service',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
