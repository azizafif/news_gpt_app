import 'package:flutter/material.dart';
import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/modules/home/home_controller.dart';
import 'package:news_gpt/src/utils/extensions/index.dart';

import 'news_card.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    final controller = context.find<HomeController>();
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];

              return NewsCard(article: article);
            },
            onPageChanged: (index) => controller.incrementPageIndex(index),
          ),
        ),
        Text(
          '${controller.pageIndex + 1}/${articles.length}',
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}
