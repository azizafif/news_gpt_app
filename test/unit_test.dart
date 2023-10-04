import 'package:flutter_test/flutter_test.dart';
import 'package:news_gpt/src/api/exports.dart';
import 'package:news_gpt/src/modules/home/data/models/chatgpt_res_model.dart';
import 'package:news_gpt/src/modules/home/data/models/news_model.dart';
import 'package:news_gpt/src/modules/home/home_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:news_gpt/src/modules/home/data/services/news_service.dart';

// Create a mock of the NewsService class
class MockNewsService extends Mock implements NewsServices {}

void main() {
  group('HomeController', () {
    late HomeController homeController; // Declare homeController as late

    // Initialize mockNewsService once for all tests
    final mockNewsService = MockNewsService();

    setUp(() {
      homeController = HomeController.serving(mockNewsService);
    });

    test('getNews sets isLoading to false and updates articlesList on success', () async {
      // Arrange
      final fakeData = NewsModel(articles: [Article(title: 'Fake News')]);
      when(mockNewsService.getNews(category: 'general')).thenAnswer(
        (_) => Future.value(Right(fakeData)),
      );

      // Act
      homeController.getNews();

      // Assert
      expect(homeController.isLoading, false);
      expect(homeController.articlesList.value, hasLength(1));
      expect(homeController.articlesList.value[0].title, 'Fake News');
    });

    test('getNews sets isLoading to false and logs error on failure', () async {
      // Arrange
      const errorMessage = 'Failed to fetch news';
      when(mockNewsService.getNews(category: 'general')).thenAnswer(
          (_) => Future.value(Left(DioException(requestOptions: RequestOptions(path: 'fakePath'), error: errorMessage))));

      // Act
      homeController.getNews();

      // Assert
      expect(homeController.isLoading, false);
      // You can also assert that the error message was logged if you have a logging mechanism.
    });

    // test('getSummizedNews updates summizedNews on success', () async {
    //   // Arrange
    //   const fakeDescription = 'Fake description';
    //   final fakeSummizedNews = ChatgptModel();
    //   when(mockNewsService.getSummarizedNews(description: fakeDescription)).thenAnswer(
    //     (_) => Future.value(Right(fakeSummizedNews)),
    //   );

    //   // Act
    //   await homeController.getSummarizedNews(fakeDescription);

    //   // Assert
    //   expect(homeController.summarizedNews.value, fakeSummizedNews);
    // });

    test('getSummizedNews logs error on failure', () async {
      // Arrange
      const fakeDescription = 'Fake description';
      const errorMessage = 'Failed to fetch summized news';
      when(mockNewsService.getSummarizedNews(description: fakeDescription)).thenAnswer(
        (_) => Future.value(Left(DioException(requestOptions: RequestOptions(path: 'fakePath'), error: errorMessage))),
      );

      // Act
      await homeController.getSummarizedNews(fakeDescription);

      // Assert
      // You can add assertions here to check how the error is handled, such as logging or other behaviors.
    });
  });
}
