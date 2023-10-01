import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/design/index.dart';
import '../data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: AppValues.cardMargin, vertical: AppValues.cardMargin / 3),
      child: ListTile(
        leading: Container(
            width: 100.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              article.image ?? "",
              fit: BoxFit.cover,
            )),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            article.title ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ).animate().fade(duration: const Duration(milliseconds: 700)).scale(),
        ),
      ),
    );
  }
}
