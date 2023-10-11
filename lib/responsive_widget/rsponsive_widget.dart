import 'package:flutter/widgets.dart';
import 'package:test_responsive/layouts/mobile.dart';
import 'package:test_responsive/layouts/website.dart';

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
