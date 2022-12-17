import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final String input;
  const Entry({
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 149, 177, 174),
      ),
      child: Text(
        input.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
