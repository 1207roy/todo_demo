import 'package:flutter/material.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/utils/extensions/extension.dart';

class ToDoListTile extends StatefulWidget {
  final ToDo toDo;
  final int index;
  final Function() onClick;

  const ToDoListTile({Key key, this.toDo, this.index, this.onClick}) : super(key: key);

  @override
  _ToDoListTileState createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  ToDoThemeState _theme;

  @override
  Widget build(BuildContext context) {
    _theme = ToDoTheme.of(context);
    return InkWell(
      onTap: () => widget.onClick(),
      child: Container(
          constraints: BoxConstraints(maxHeight: context.responsiveHeight(238)),
          padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(15), vertical: context.responsiveHeight(15)),
          margin: EdgeInsets.symmetric(vertical: context.responsiveHeight(8)),
          decoration:
              BoxDecoration(border: Border.all(color: _theme.borderColor), borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(widget.toDo.title),
              SizedBox(height: context.responsiveHeight(40)),
              _buildBody(widget.toDo.body),
            ],
          )),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: _theme.toDoTitleTextStyle.copyWith(fontSize: context.responsiveHorizontalPixel(20)),
    );
  }

  Widget _buildBody(String body) {
    return Text(
      body,
      overflow: TextOverflow.ellipsis,
      style: _theme.toDoTitleTextStyle.copyWith(fontSize: context.responsiveHorizontalPixel(12)),
    );
  }
}
