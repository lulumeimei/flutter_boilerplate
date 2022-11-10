import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static const _title = 'app_name';
  static const _domain = 'domain';
  static const _baseURL = 'base_url';
  static const _api_v1 = 'api_v1';

  static String get title {
    return dotenv.env[_title] != null
        ? dotenv.env[_title]!
        : throw FlutterError(
            'Cannot find from env file',
          );
  }

  static String get domain {
    return dotenv.env[_domain] != null
        ? dotenv.env[_domain]!
        : throw FlutterError(
            'Cannot find from env file',
          );
  }

  static String get baseURL {
    return dotenv.env[_baseURL] != null
        ? dotenv.env[_baseURL]!
        : throw FlutterError(
            'Cannot find from env file',
          );
  }

  static String get apiV1 {
    return dotenv.env[_api_v1] != null
        ? dotenv.env[_api_v1]!
        : throw FlutterError(
            'Cannot find from env file',
          );
  }

  String getApiBaseURL({
    String? apiVersion,
  }) {
    return baseURL + (apiVersion ?? apiV1);
  }
}
