import 'package:flutter/material.dart';

List<String> skills = [
  'HTML',
  'CSS',
  'JS',
  'Dart',
  "Flutter",
  "Java",
  "Angular JS",
  'React JS',
  'Figma Design'
];

class Skill extends StatelessWidget {
  const Skill({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        skill,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
