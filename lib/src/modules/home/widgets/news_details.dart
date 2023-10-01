import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/modules/home/home_controller.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.article, required this.index});
  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      appBar: AppBar(
        title: Text(article.title ?? ""),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(children: [
            Hero(
              tag: 'news$index',
              child: Image.network(
                article.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
            VerticalSpacing(20.h),
            controller.summizedNews.value.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Text("Summized News", style: TextStyle(color: Colors.white, fontSize: 24.sp)),
                      VerticalSpacing(20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          controller.summizedNews.value,
                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        ).animate().scale().fade(),
                      ),
                    ],
                  )
          ]),
        );
      }),
    );
  }
}
