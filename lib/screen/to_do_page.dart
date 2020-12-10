import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/screen/to_do_detail_view_screen.dart';
import 'package:tododemo/stores/to_do_store.dart';
import 'package:tododemo/widgets/news_list_tile.dart';
import 'package:tododemo/widgets/shimmer_group_tile.dart';
import 'package:tododemo/utils/extensions/extension.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> with AutomaticKeepAliveClientMixin {
  ToDoThemeState _theme;
  ToDoStore _store;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _store = context.read<ToDoStore>();
  }

  @override
  Widget build(BuildContext context) {
    _theme = ToDoTheme.of(context);
    return Observer(
      builder: (_) {
        final _ = _store.toDoList;
        print('list update call.....................');
        return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildListView()
            ),
          ],
        ),
      );
      },
    );
  }

  Widget _buildListView() {
    return _store.toDoResult.maybeWhen((isUpdated) {
      final list = _store?.toDoList ?? [];
      if(list.length == 0) {
        return _emptyListView();
      }
      return ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(16), vertical: context.responsiveHeight(20)),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final toDo = list[index];
          return ToDoListTile(
            toDo: toDo,
            onClick: () => _openToDoDetailView(toDo),
          );
        },
      );
    }, loading: () => _buildShimmer(), orElse: () => Container());
  }

  Widget _emptyListView() {
    return Center(
      child: Text('no to-do found...', style: _theme.toDoTitleTextStyle),
    );
  }

  _openToDoDetailView(ToDo toDo) {
    ToDoDetailView.openToDoDetailView(context, _store, toDo: toDo);
  }

  Widget _buildShimmer() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ShimmerGroupTile(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
