import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

mixin ScrollPageMixin<T extends StatefulWidget> on State<T> {
  ScrollController get scrollController;

  void loadMoreData();

  final BehaviorSubject<bool> _isLoadingController =
      BehaviorSubject.seeded(false);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.extentAfter < 500 &&
          scrollController.position.extentBefore > 100) {
        loadMoreData();
      }
    });
  }

  void scrollToTop() {
    if (!scrollController.hasClients) {
      return;
    }

    if (scrollController.position.extentBefore == 0) {
      if (_isLoadingController.stream.value) {
        return;
      }

      _isLoadingController.sink.add(true);

      scrollController.animateTo(
        -100,
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastOutSlowIn,
      );

      Future.delayed(
        const Duration(seconds: 1),
        () {
          _isLoadingController.sink.add(false);
        },
      );
    } else {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _isLoadingController.close();
    super.dispose();
  }
}
