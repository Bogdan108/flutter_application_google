import 'package:dio/dio.dart';

Future<String> translateWord(String word, String sourceLang, String targetLang, String apiKey) async {
  var dio = Dio();
  var apiUrl = 'https://api-url-for-translation'; // Замените на реальный URL API перевода

  try {
    var response = await dio.get(
      apiUrl,
      queryParameters: {
        'text': word,
        'sourceLang': sourceLang,
        'targetLang': targetLang
      },
      options: Options(headers: {'Authorization': 'Bearer $apiKey'})
    );

    if (response.statusCode == 200) {
      return response.data['translatedText']; // Убедитесь, что это соответствует структуре ответа вашего API
    } else {
      throw Exception('Failed to load translation');
    }
  } catch (e) {
    throw Exception('Error occurred: $e');
  }
}
