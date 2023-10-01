import 'package:news_gpt/src/shared/screens/exports.dart';

import 'home_controller.dart';
import 'widgets/news_card.dart';
import 'widgets/news_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(body: GetBuilder<HomeController>(builder: (controller) {
      final articlesList = controller.articlesList.value;
      return articlesList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => {
                        controller.getSummizedNews(articlesList[index].description ?? ""),
                        Get.to(() => NewsDetails(article: articlesList[index], index: index))
                      },
                  child: Hero(tag: 'news$index', child: NewsCard(article: articlesList[index]))),
            );
    }));
  }
}
