import 'package:flutter/material.dart';
import 'package:tododemo/common/todo_theme.dart';

Future<bool> showConfirmationDialog(BuildContext context, title, message) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      print('confir,mation dialog....');
      final theme = ToDoTheme.of(context);
      return AlertDialog(
        title: title == null || title.isEmpty ? null : Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
              child:  Text('No', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(false);
              }),
          FlatButton(
              child:  Text('Yes', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(true);
              }),
        ],
      );
    },
  ).then((value) => value == true);
}
