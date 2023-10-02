import 'dart:developer';

import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/modules/home/data/services/news_service.dart';
import 'package:news_gpt/src/widgets/observable.dart';

import '../../shared/controllers/exports.dart';

class HomeController extends PaginationController<NewsServices> {
  HomeController() : super(NewsServices());
  HomeController.serving(super.service);

  final articlesList = ObservableValue<List<Article>>(defaultValue: []);
  final summarizedNews = ObservableValue<String>(defaultValue: "");
  final isExpanded = ObservableValue<bool>(defaultValue: false);
  int bottomNarBarcurrentIndex = 0;

  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
  void incrementNavBarIndex(int index) {
    bottomNarBarcurrentIndex = index;
    update();
  }

  void incrementPageIndex(int index) {
    pageIndex = index;
    update();
  }

  @override
  getNews() async {
    await service.getNews(category: "general").then((result) => result.fold(
        (error) => error,
        (data) => {
              if (data?.articles != null) articlesList.value.addAll(data?.articles as List<Article>),
              update(),
              // isLoading = false,
            }));
  }

  getSummarizedNews(String description) {
    summarizedNews.value = "";
    service.getSummarizedNews(description: description).then((value) => value.fold(
        (error) => log(error.toString()), (data) => {summarizedNews.value = data?.choices?[0].message?.content ?? "", update()}));
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      isExpanded.value = true;
      update();
    } else if (details.delta.dy > 0) {
      isExpanded.value = false;
      update();
    }
  }
}
