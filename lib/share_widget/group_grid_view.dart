import 'package:flutter/material.dart';
import 'package:group_grid_view/group_grid_view.dart';

class GroudGridViewPage extends StatefulWidget {
  const GroudGridViewPage({super.key});

  @override
  State<GroudGridViewPage> createState() => _GroudGridViewPageState();
}

class _GroudGridViewPageState extends State<GroudGridViewPage> {
  final List<TestModel> dataSource = [
    TestModel(sectionName: "Skills", listItems: [
      "Flutter 70%",
      "NodeJs 50%",
      "NuxtJs 40%",
      "SpringBoot 30%",
      "Java 50%",
      "Figma 40%",
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return GroupGridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      sectionCount: dataSource.length,
      headerForSection: (section) => Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          dataSource[section].sectionName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      footerForSection: (section) {
        final footer = dataSource[section].footerName;
        return footer != null
            ? Container(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 32,
                ),
                child: Text(
                  footer,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            : const SizedBox(height: 32);
      },
      itemInSectionBuilder: (_, indexPath) {
        final data = dataSource[indexPath.section].listItems[indexPath.index];
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue)),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(data,
                style: const TextStyle(fontWeight: FontWeight.w500)));
      },
      itemInSectionCount: (section) => dataSource[section].listItems.length,
    );
  }
}

class TestModel {
  TestModel(
      {required this.sectionName, required this.listItems, this.footerName});

  final String sectionName;
  final String? footerName;
  final List<String> listItems;
}
