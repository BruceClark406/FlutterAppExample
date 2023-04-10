import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:short_code_api_package/short_code_api_repository.dart';

/// {@template short_code_api_package}
/// A package to interface with the short code API found here
/// https://shrtco.de/docs
/// {@endtemplate}
class ShortCodeApiRepository {
  /// {@macro short_code_api_package}
  const ShortCodeApiRepository();

  String get _baseUrl => 'https://api.shrtco.de/v2';

  /// Takes a URL and return a short url
  Future<GetShortCodeResponse> getShortCode(String url) async {
    final response = await http.get(Uri.parse('$_baseUrl/shorten?url=$url'));

    if (response.statusCode == 201) {
      return GetShortCodeResponse.fromJson(
        (jsonDecode(response.body) as Map<String, dynamic>)['result']
            as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load album');
    }
  }
}
