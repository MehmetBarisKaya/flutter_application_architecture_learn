import '../constants/enums/http_request_enum.dart';

extension NetworkTypeExtension on HttpRequestTypes {
  String get rawValue {
    switch (this) {
      case HttpRequestTypes.GET:
        return "GET";
      case HttpRequestTypes.POST:
        return "POST";
      default:
        return "ERROR TYPE ";
    }
  }
}
