import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododemo/common/confirmation_dialog.dart';
import 'package:tododemo/common/custom_bottom_sheet.dart';
import 'package:tododemo/common/mobx_provider.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/stores/to_do_store.dart';
import 'package:tododemo/utils/extensions/extension.dart';
import 'package:tododemo/widgets/custom_reminder_dialog.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ToDoDetailView extends StatefulWidget {
  final ToDo toDo;

  ToDoDetailView({this.toDo});

  static Future<void> openToDoDetailView(BuildContext context, ToDoStore store, {ToDo toDo}) {
    return showCustomModalBottomSheet(
      isStopAnimation: false,
      context: context,
      rootNavigator: true,
      enableDrag: false,
      builder: (_) => MobxProvider<ToDoStore>.value(
          value: store,
          child: ToDoDetailView(
            toDo: toDo,
          )),
    );
  }

  @override
  _ToDoDetailViewState createState() => _ToDoDetailViewState();
}

class _ToDoDetailViewState extends State<ToDoDetailView> {
  ToDoThemeState _theme;
  ToDoStore _store;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();
  Reminder _reminder;

  bool get isNewToDo => widget.toDo == null;

  @override
  void initState() {
    super.initState();
    _store = context.read<ToDoStore>();
    _titleTextController.text = widget?.toDo?.title ?? '';
    _bodyTextController.text = widget?.toDo?.body ?? '';
    _reminder = widget?.toDo?.reminder;
  }

  @override
  Widget build(BuildContext context) {
    _theme = ToDoTheme.of(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        color: _theme.backgroundColor,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsets.only(
                left: context.responsiveWidth(15),
                right: context.responsiveWidth(15),
                top: context.responsiveHeight(35),
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar,
                  Expanded(
                      child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    child: Column(
                      children: [
                        SizedBox(height: context.responsiveHeight(40)),
                        _buildTitleTextField(),
                        SizedBox(height: context.responsiveHeight(15)),
                        _buildBodyTextField(),
                        SizedBox(height: context.responsiveHeight(71)),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleTextField() {
    final textStyle = _theme.toDoTitleTextStyle.copyWith(fontSize: context.responsiveHorizontalPixel(20));

    return TextField(
      onChanged: (_) {},
      controller: _titleTextController,
      style: textStyle,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: textStyle.copyWith(color: _theme.unselectedTabColor),
        counterText: '',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }

  Widget _buildBodyTextField() {
    final textStyle = _theme.toDoBodyTextStyle.copyWith(fontSize: context.responsiveHorizontalPixel(15));

    return Container(
      constraints: BoxConstraints(minHeight: context.responsiveHeight(600)),
      child: TextField(
        onChanged: (_) {},
        controller: _bodyTextController,
        style: textStyle,
        enableSuggestions: false,
        autocorrect: false,
        autofocus: (_bodyTextController?.text?.isEmpty ?? true) ? true : false,
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Note',
          hintStyle: textStyle.copyWith(color: _theme.unselectedTabColor),
          counterText: '',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }

  Widget get _buildAppBar => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appBarIcon(Icons.arrow_back, onTap: _onBackPressed),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              appBarIcon(Icons.delete, onTap: _onDelete),
              SizedBox(width: context.responsiveWidth(20)),
              appBarIcon(Icons.share, onTap: _onShare),
              SizedBox(width: context.responsiveWidth(20)),
              appBarIcon(Icons.add_alert, onTap: _onAddReminder),
              SizedBox(width: context.responsiveWidth(20)),
              appBarIcon(Icons.done, onTap: _onSave),
            ],
          )
        ],
      );

  Widget appBarIcon(IconData iconData, {Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(child: Icon(iconData, color: _theme.unselectedTabColor, size: context.responsiveWidth(22))),
    );
  }

  _onAddReminder() {
    showDialog<ReminderResult>(context: context, child: CustomReminderDialogBox(reminder: _reminder))
        .then((ReminderResult reminderResult) {
      if (reminderResult == null) return;
      if (reminderResult.reminderProcessStatus == ReminderProcessStatus.delete) {
        _reminder = null;
      } else if (reminderResult.reminderProcessStatus == ReminderProcessStatus.save) {
        _reminder = reminderResult.reminder;
      }
    });
  }

  _onSave() async {
    if (isNewToDo) {
      await _store.createToDo(_titleTextController.text, _bodyTextController.text, _reminder);
    } else {
      final isReminderUpdated = Reminder.isSameAs(widget.toDo.reminder, _reminder);
      widget.toDo.title = _titleTextController.text;
      widget.toDo.body = _bodyTextController.text;
      widget.toDo.reminder = _reminder;
      await _store.updateToDo(widget.toDo, isReminderUpdated);
    }
    Navigator.of(context).pop();
  }

  _onShare() async {
    try {
      print('onShare called.......');
      WcFlutterShare.share(
          sharePopupTitle: _titleTextController.text,
          subject: 'Shared ToDO',
          text: _bodyTextController.text,
          mimeType: 'text/plain');
    } catch (e) {
      print(e);
    }
  }

  _onDelete() async {
    showConfirmationDialog(context, 'Delete ToDo', 'Are you sure, you want to delete this to-do?')
        .then((shouldDiscard) {
      if (shouldDiscard) {
        _store.deleteToDo(widget.toDo);
        Navigator.of(context).pop();
      }
      return;
    });
  }

  Future<bool> _onBackPressed() async {
    bool isChanged = (widget?.toDo?.title ?? '') != _titleTextController.text ||
        (widget?.toDo?.body ?? '') != _bodyTextController.text ||
        !Reminder.isSameAs(widget?.toDo?.reminder, _reminder);
    final title = isNewToDo ? 'Discard To-Do' : 'Discard changes';
    final message =
        isNewToDo ? 'Are you sure, you don\'t want to save this to-do?' : 'Are you sure, you want to discard changes?';
    print('widget?.toDo?.title: ${widget?.toDo?.title}=====_titleTextController.text: ${_titleTextController.text}');
    print('widget?.toDo?.body: ${widget?.toDo?.body}=====_bodyTextController.text: ${_bodyTextController.text}');
    print('widget?.toDo?.reminder: ${widget?.toDo?.reminder}=====_reminder: $_reminder');
    print('(widget?.toDo?.title ?? '
        ') != _titleTextController.text: ${(widget?.toDo?.title ?? '') != _titleTextController.text}');
    print('(widget?.toDo?.body ?? '
        ') != _bodyTextController.text: ${(widget?.toDo?.body ?? '') != _bodyTextController.text}');
    print('!Reminder.isSameAs: ${!Reminder.isSameAs(widget?.toDo?.reminder, _reminder)}');
    print('isChanged: $isChanged');
    if (isChanged) {
      showConfirmationDialog(context, title, message).then((shouldDiscard) {
        if (shouldDiscard) {
          Navigator.of(context).pop();
        }
        return shouldDiscard ?? true;
      });
    } else {
      Navigator.of(context).pop();
      return true;
    }
  }
}
