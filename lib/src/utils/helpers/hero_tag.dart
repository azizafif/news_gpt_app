import 'package:news_gpt/src/modules/home/data/models/news_model.dart';

class HeroTag {
  static String image(String urlImage) => urlImage;

  static String sourceName(Source? source) => source?.name ?? "";
  static String sourceUrl(Source? source) => source?.url ?? "";

  static String date(String date) => date;
}
