import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
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

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

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
          title: Row(
            children: [
              if (MediaQuery.of(context).size.width > 600)
                const Text('Responsive Flutter Web App')
              else
                const Text('KakElay Portfolio'),
              if (MediaQuery.of(context).size.width > 880)
                const Expanded(child: MyNavbar()),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: toggleTheme,
                icon: isDarkMode
                    ? const Icon(Icons.wb_sunny)
                    : const Icon(Icons.brightness_2),
              ),
            ),
          ],
        ),
        body: const MyResponsiveWidget(),
        drawer:
            MediaQuery.of(context).size.width > 870 ? null : const MyDrawer(),
        // bottomNavigationBar:
        //     MediaQuery.of(context).size.width > 600 ? const MyNavbar() : null,
      ),
    );
  }
}

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
            title: const Text('Item 1'),
            onTap: () {
              // Handle item 1 navigation
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Handle item 2 navigation
            },
          ),
        ],
      ),
    );
  }
}

// class MyNavbar extends StatelessWidget {
//   const MyNavbar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: const Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           NavbarItem(label: 'Home', onTap: null),
//           NavbarItem(label: 'About Us', onTap: null),
//           NavbarItem(label: 'Contact', onTap: null),
//           NavbarItem(label: 'Blog', onTap: null),
//           NavbarItem(label: 'Project', onTap: null),
//           NavbarItem(label: 'Services', onTap: null),
//           NavbarItem(label: 'Blog', onTap: null),
//           NavbarItem(label: 'Project', onTap: null),
//         ],
//       ),
//     );
//   }
// }

class NavbarItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const NavbarItem({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class MyResponsiveWidget extends StatelessWidget {
  const MyResponsiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Large screen layout
          return const DesktopLayout();
        } else {
          // Small screen layout
          return const MobileLayout();
        }
      },
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            height: 200,
            child: const Center(
              child: Text('Desktop Content'),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 100,
          child: const Center(
            child: Text('Mobile Content 1'),
          ),
        ),
      ],
    );
  }
}
