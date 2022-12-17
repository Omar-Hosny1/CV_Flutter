import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  final String languageName;
  const Language({required this.languageName});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 30,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(7)),
        child: Text(
          languageName,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
