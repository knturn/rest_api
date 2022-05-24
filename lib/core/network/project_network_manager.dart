import 'package:dio/dio.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instance;
  static ProjectNetworkManager get instance {
    _instance ??= ProjectNetworkManager._init();
    return _instance!;
  }

  final String _baseurl = "https://rickandmortyapi.com/api";
  late final Dio dio;

  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseurl));
  }
}
