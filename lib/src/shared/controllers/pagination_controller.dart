import 'package:flutter/material.dart';
import 'package:news_gpt/src/api/exports.dart';

import 'serving_controller.dart';

abstract class PaginationController<S extends RequestPerformer> extends ServingController<S> {
  PaginationController(super.service);

  late final scrollController = ScrollController()..addListener(_getNextPageWhenBottomIsReached);

  bool bottomReached = false;
  int currentPage = 1;
  bool isLoading = false;
  bool noMorePages = false;

  void _getNextPageWhenBottomIsReached() {
    bottomReached = scrollController.position.pixels >= scrollController.position.maxScrollExtent;
    if (bottomReached) {
      update();
      getNextPage();
    }
  }

  @override
  @mustCallSuper
  void onReady() {
    getNextPage(fromBeginnig: true);
    super.onReady();
  }

  @override
  @mustCallSuper
  void onClose() {
    scrollController.removeListener(_getNextPageWhenBottomIsReached);
    scrollController.dispose();
    super.onClose();
  }

  void getNextPage({bool fromBeginnig = false});
}
