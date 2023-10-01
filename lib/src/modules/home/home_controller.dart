import 'dart:developer';

import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/modules/home/data/services/news_service.dart';
import 'package:news_gpt/src/widgets/observable.dart';

import '../../shared/controllers/exports.dart';

class HomeController extends PaginationController<NewsServices> {
  HomeController() : super(NewsServices());
  HomeController.serving(super.service);

  final articlesList = ObservableValue<List<Article>>(defaultValue: []);
  final summizedNews = ObservableValue<String>(defaultValue: "");
  @override
  getNews() {
    isLoading = true;

    service
        .getNews(category: "general")
        .then((result) => result.fold(
            (error) => log(error.toString()),
            (data) => {
                  articlesList.value.addAll(data?.articles as List<Article>),
                  update(),
                  isLoading = false,
                }))
        .whenComplete(() => isLoading = false);
  }

  getSummizedNews(String description) {
    summizedNews.value = "";
    service.getSummizedNews(description: description).then((value) => value.fold(
        (error) => log(error.toString()), (data) => {summizedNews.value = data?.choices?[0].message?.content ?? "", update()}));
  }
}
