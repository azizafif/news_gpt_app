class AppConstants {
  AppConstants._();

//? ------------------ News API ------------------
  static const String newsBaseUrl = "https://gnews.io/api/v4/";
  static const String topHeadlines = "top-headlines";
  static const String category = "category";

//? ------------------ ChatGPT API ------------------
  static const String chatGPTBaseUrl = "https://api.openai.com/v1/chat/";
  static const String completions = "completions";
  static const String model = "gpt-3.5-turbo";
  static const String content =
      "Summarize content you are provided with for people who are busy and don't have time to read the whole article.";
}
