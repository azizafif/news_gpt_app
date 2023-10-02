import 'package:flutter/material.dart';

import 'package:news_gpt/src/modules/home/data/models/news_model.dart';

import '../../../utils/helpers/hero_tag.dart';
import '../../../widgets/hero_widget.dart';

class ImageWidget extends StatelessWidget {
  final Article article;

  const ImageWidget({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Stack(
            children: [
              _ImageCard(article: article),
              const _OpacityWidget(),
              _BottomText(article: article),
            ],
          )),
    );
  }
}

class _OpacityWidget extends StatelessWidget {
  const _OpacityWidget();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
        ],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(article.url ?? ""),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(article.image ?? "", fit: BoxFit.cover),
          ),
        ),
      );
}

class _BottomText extends StatelessWidget {
  const _BottomText({required this.article, Key? key}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            article.title ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );
}
