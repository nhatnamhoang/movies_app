import 'package:flutter/material.dart';

import 'activity_indicator.dart';
import 'empty_content.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListViewItemsBuilder<T> extends StatelessWidget {
  const ListViewItemsBuilder({
    Key key,
    @required this.snapshot,
    @required this.itemBuilder,
    @required this.emptyText,
    this.errText,
    this.scrollController
  }) : super(key: key);
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;
  final String emptyText;
  final String errText;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final items = snapshot.data;
      if (items.isNotEmpty) {
        return _buildList(items);
      } else {
        return EmptyContent(text:emptyText);
      }
    } else if (snapshot.hasError) {
      return EmptyContent(text: errText ?? 'Something went wrong');
    }
    return const Center(child: ActivityIndicator());
  }

  Widget _buildList(List<T> items) {
    return ListView.builder(
      itemCount: items.length,
      controller: scrollController,
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
    );
  }
}
