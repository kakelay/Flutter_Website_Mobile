import 'package:flutter/material.dart';
import 'package:test_responsive/share_widget/navbar_items.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title:   NavbarItem(label: 'About Us', onTap: null,
              color: Colors.black, isSelected: true,
            ),
            onTap: () {
              // Handle item 1 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'Project', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'Blog', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'Services', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'Project', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'Blog', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'Contact', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
          ListTile(
            title:   NavbarItem(label: 'About Us', onTap: null,
              color: Colors.black, isSelected: false,
            ),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
        ],
      ),
    );
  }
}
