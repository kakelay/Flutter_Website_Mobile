// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';

// class NavbarItem extends StatelessWidget {
//   final String label;
//   final VoidCallback? onTap;
//   Color? color;

//   NavbarItem({
//     required this.label,
//     required this.onTap,
//     required this.color,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: color,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavbarItem extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final bool isSelected;

  NavbarItem({
    required this.label,
    required this.onTap,
    required this.color,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  _NavbarItemState createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant NavbarItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.isSelected
            ? Colors.red
            : Colors.transparent, // Use a custom color here
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : widget.color,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
