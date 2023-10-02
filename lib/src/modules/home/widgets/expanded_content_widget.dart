import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';
import 'package:news_gpt/src/utils/extensions/index.dart';

import '../../../utils/helpers/hero_tag.dart';
import '../../../widgets/hero_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  final Article article;

  const ExpandedContentWidget({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = article.publishedAt ?? "";
    String formatedDate = date.customFormatDateTime();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeroWidget(tag: HeroTag.sourceName(article.source), child: Text(article.source?.name ?? "")),
          const VerticalSpacing(12),
          HeroWidget(tag: HeroTag.sourceUrl(article.source), child: Text(article.source?.url ?? "")),
          const VerticalSpacing(12),
          HeroWidget(tag: HeroTag.date(formatedDate), child: Text(formatedDate, style: const TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }
}
