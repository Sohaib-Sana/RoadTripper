import 'package:flutter/material.dart';

enum NotificationMode { email, sms }

class RadioButtonsColumn extends StatefulWidget {
  const RadioButtonsColumn({super.key});

  @override
  State<RadioButtonsColumn> createState() => _RadioButtonsColumnState();
}

class _RadioButtonsColumnState extends State<RadioButtonsColumn> {
  NotificationMode? _character = NotificationMode.email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Email', style: Theme.of(context).textTheme.bodyLarge),
          leading: Radio<NotificationMode>(
            value: NotificationMode.email,
            groupValue: _character,
            onChanged: (NotificationMode? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Sms', style: Theme.of(context).textTheme.bodyLarge),
          leading: Radio<NotificationMode>(
            value: NotificationMode.sms,
            groupValue: _character,
            onChanged: (NotificationMode? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
