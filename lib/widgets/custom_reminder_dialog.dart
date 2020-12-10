import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tododemo/common/custom_switch_tile.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/utils/extensions/extension.dart';

class CustomReminderDialogBox extends StatefulWidget {
  final Reminder reminder;

  const CustomReminderDialogBox({Key key, this.reminder}) : super(key: key);

  @override
  _CustomReminderDialogBoxState createState() => _CustomReminderDialogBoxState();
}

class _CustomReminderDialogBoxState extends State<CustomReminderDialogBox> {
  ToDoThemeState _theme;
  ValueNotifier<bool> _isDailyReminder;
  ValueNotifier<DateTime> _selectedDate;

  bool get isNewReminder => widget.reminder == null;

  @override
  void initState() {
    super.initState();
    _isDailyReminder = ValueNotifier(widget?.reminder?.isDailyNotification ?? false);
    _selectedDate = ValueNotifier(widget?.reminder?.dateTime ?? DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    _theme = ToDoTheme.of(context);
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _contentBox(context),
    );
  }

  Widget _contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(20), vertical: context.responsiveHeight(20)),
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: _theme.backgroundColor,
          boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isDailyReminder,
        builder: (context, isDailyReminder, ___) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              isNewReminder ? 'Add reminder' : 'Edit reminder',
              style: _theme.toDoBodyTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: context.responsiveHeight(27)),
            CustomSwitchTile(
              title: 'Daily Reminder',
              currentValue: isDailyReminder,
              onChanged: (value) => _isDailyReminder.value = value,
            ),
//            SizedBox(height: context.responsiveHeight(20)),
            _buildDateTimePicker(),
            SizedBox(height: context.responsiveHeight(27)),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isNewReminder)
                    FlatButton(
                      onPressed: _onDelete,
                      child: Text('Delete', style: _theme.reminderCancelTextStyle),
                    ),
                  FlatButton(
                    onPressed: _onCancel,
                    child: Text('Cancel', style: _theme.reminderCancelTextStyle),
                  ),
                  InkWell(
                    onTap: _onSave,
                    child: Container(
                      decoration:
                          BoxDecoration(color: _theme.reminderSaveButtonColor, borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(
                          horizontal: context.responsiveWidth(25), vertical: context.responsiveHeight(8)),
                      child: Text('Save', style: _theme.reminderSaveTextStyle),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimePicker() {
    return ValueListenableBuilder(
      valueListenable: _isDailyReminder,
      builder: (context, isDailyReminder, ___) => ValueListenableBuilder(
        valueListenable: _selectedDate,
        builder: (context, DateTime selectedDate, ___) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.event, color: _theme.unselectedTabColor, size: context.responsiveWidth(22)),
            SizedBox(width: context.responsiveWidth(16)),
            if (!isDailyReminder)
              InkWell(
                onTap: _showDatePicker,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: _theme.toDoBodyTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: context.responsiveWidth(8)),
                      child: Text(selectedDate.pickerFormattedDate,
                          style: _theme.toDoBodyTextStyle.copyWith(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            if (!isDailyReminder) SizedBox(width: context.responsiveWidth(50)),
            InkWell(
              onTap: _showTimePicker,
              child: Column(
                children: [
                  Text(
                    'Time',
                    style: _theme.toDoBodyTextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: context.responsiveWidth(8)),
                    child: Text(selectedDate.pickerFormattedTime,
                        style: _theme.toDoBodyTextStyle.copyWith(fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDatePicker() async {
    await showDatePicker(
      context: context,
      initialDate: _selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((DateTime pickedDate) {
      if (pickedDate != null) {
        final dateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, _selectedDate.value.hour,
            _selectedDate.value.minute, _selectedDate.value.second);
        _selectedDate.value = dateTime;
      }
    });
  }

  _showTimePicker() async {
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: _selectedDate.value.hour, minute: _selectedDate.value.minute),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        }).then((TimeOfDay timeOfDay) {
      if (timeOfDay != null) {
        final dateTime = DateTime(_selectedDate.value.year, _selectedDate.value.month, _selectedDate.value.day,
            timeOfDay.hour, timeOfDay.minute, 0);
        _selectedDate.value = dateTime;
      }
    });
  }

  _onSave() {
    Navigator.of(context).pop(ReminderResult(ReminderProcessStatus.save,
        Reminder(isDailyNotification: _isDailyReminder.value, dateTime: _selectedDate.value)));
  }

  _onDelete() {
    Navigator.of(context).pop(ReminderResult(ReminderProcessStatus.delete, widget.reminder));
  }

  _onCancel() {
    Navigator.of(context).pop();
  }
}

enum ReminderProcessStatus { delete, save }

class ReminderResult {
  final ReminderProcessStatus reminderProcessStatus;
  final Reminder reminder;

  ReminderResult(this.reminderProcessStatus, this.reminder);
}
