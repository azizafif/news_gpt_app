import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/modules/home/home_controller.dart';
import 'package:news_gpt/src/shared/controllers/exports.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';
import 'package:news_gpt/src/widgets/observable.dart';

import '../../app/design/app_styles.dart';
import '../../app/design/constants/app_contants.dart';
import '../../utils/helpers/hero_tag.dart';
import '../../widgets/hero_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article article;
  final Animation animation;

  const NewsDetailsScreen({
    required this.article,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SmartScaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(AppConstants.appName, style: appNameTextStyle),
          centerTitle: true,
          leading: IconButton(icon: const Icon(Icons.close_fullscreen, size: 30), onPressed: Get.back),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: HeroWidget(
                      tag: HeroTag.image(article.image ?? ""),
                      child: Image.network(article.image ?? "", fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            _DetailedInfoWidget(article: article),
            const Expanded(flex: 2, child: _SummarizedDescription()),
            const VerticalSpacing(30),
          ],
        ),
      );
}

class _SummarizedDescription extends StatelessWidget {
  const _SummarizedDescription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Animate(
              effects: const [FadeEffect(), ScaleEffect(duration: Duration(seconds: 1))],
              child: const Text("Summarized Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const VerticalSpacing(20),
          Observable(
              observable: context.find<HomeController>().summarizedNews,
              builder: (context, summarizedArticle) {
                return summarizedArticle.isEmpty
                    ? const Center(child: CircularProgressIndicator.adaptive(strokeWidth: 7))
                    : Animate(
                        effects: const [FadeEffect(), ScaleEffect(duration: Duration(seconds: 1))],
                        child: Text(summarizedArticle, style: const TextStyle(fontSize: 18)));
              }),
        ],
      ),
    );
  }
}

class _DetailedInfoWidget extends StatelessWidget {
  final Article? article;

  const _DetailedInfoWidget({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = article?.publishedAt ?? "";
    final formatedDate = date.customFormatDateTime();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroWidget(
            tag: HeroTag.sourceName(article?.source),
            child: Text(
              article?.source?.name ?? "",
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
          ),
          const VerticalSpacing(8),
          HeroWidget(
            tag: HeroTag.sourceUrl(article?.source),
            child: Text(article?.source?.url ?? ""),
          ),
          const VerticalSpacing(8),
          HeroWidget(
            tag: HeroTag.date(formatedDate),
            child: Text(formatedDate, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
