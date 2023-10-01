import '../../utils/helpers/firebase_error_recorder.dart';
import '../exceptions/exceptions.dart';
import '../exports.dart';
import '../models/data_container_model.dart';
import '../models/no_data_model.dart';

dynamic decode<T extends ModelingProtocol>(
  T decodableModel, {
  Response<dynamic>? response,
  dynamic mockingData,
  bool paginated = false,
  bool mocking = false,
}) {
  assert(
    mockingData != null || response != null,
    '\n[RequestPerformer => decode] You should provide either some mocking data or a real response to be trated',
  );

  final data = mockingData ?? response?.data;

  try {
    if (decodableModel is NoDataModel) return decodableModel.fromJson({'success': mocking ? true : data.statusCode == 200});

    if (!paginated) {
      assert(data is List || data is StringKeyedMap);
      return decodableModel.fromJson(data);
    } else {
      assert(data is StringKeyedMap);
      return DataContainerModel.fromjson(data, decodableModel);
    }
  } catch (error, stackTrace) {
    FirebaseErrorRecorder.recordNonFatalError(
      error,
      stackTrace,
      message: mocking
          ? '\n[RequestPerformer => decode] Mocking has failed, please verify the provided mocking data for < ${decodableModel.runtimeType} > class'
          : '\n[RequestPerformer => decode] Serialization process has failed, please verify that <${decodableModel.runtimeType}> conforms to the awaited response structure',
    );

    throw DecodingException();
  }
}
