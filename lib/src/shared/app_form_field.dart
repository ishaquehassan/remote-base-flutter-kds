import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final bool isMultiline;

  const AppFormField({required this.hintText, this.isMultiline = false});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(bottom: 20),
        elevation: 6,
        child: TextFormField(
          minLines: isMultiline ? 6 : 1,
          maxLines: isMultiline ? 6 : 1,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: 15, right: 15, top: isMultiline ? 10 : 0),
              border: InputBorder.none,
              hintText: hintText),
        ));
  }
}
