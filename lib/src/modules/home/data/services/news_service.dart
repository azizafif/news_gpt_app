import 'package:news_gpt/src/app/design/constants/app_contants.dart';
import 'package:news_gpt/src/modules/home/data/models/news_model.dart';

import '../../../../api/exports.dart';
import '../../../../app/environment/app_environment.dart';
import '../models/chatGPT_res_model.dart';

enum Role { system, user }

class NewsServices extends RequestPerformer {
  FutureRequestResult<NewsModel> getNews({required String category}) async {
    try {
      return Right(
        await performDecodingRequest(
          baseUrl: AppConstants.newsBaseUrl,
          paginated: false,
          loaderEnabled: true,
          method: RestfullMethods.get,
          path: AppConstants.topHeadlines,
          decodableModel: NewsModel(),
          queryParameters: {
            'category': category,
            'lang': 'en',
            'max': 10,
            'apikey': AppEnvironment.newsApiKey,
          },
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        ),
      );
    } on DioException catch (e) {
      return Left(e);
    }
  }

  FutureRequestResult<ChatgptModel> getSummarizedNews({required String description}) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppEnvironment.chatGPTApiKey}',
    };

    final List<Map<String, dynamic>> messages = [
      {
        'role': Role.system.name,
        'content': AppConstants.content,
      },
      {
        'role': Role.user.name,
        'content': description,
      },
    ];

    final Map<String, dynamic> data = {
      'model': AppConstants.model,
      'messages': messages,
    };
    try {
      return Right(
        await performDecodingRequest(
          baseUrl: AppConstants.chatGPTBaseUrl,
          paginated: false,
          loaderEnabled: false,
          method: RestfullMethods.post,
          path: AppConstants.completions,
          decodableModel: ChatgptModel(),
          data: data,
          options: Options(headers: headers),
        ),
      );
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
