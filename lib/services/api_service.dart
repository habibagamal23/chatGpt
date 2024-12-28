import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../models/chat_request.dart';
import '../models/chat_response.dart';

class ApiService {
  final Dio _dio;
  ApiService()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ', // Replace with your API key
      },
    ),
  ) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
  }

  Future<ChatResponse> getChatResponse(ChatRequest request) async {
    try {
      final response = await _dio.post('/chat/completions', data: request.toJson());
      return ChatResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch chat response: $e');
    }
  }
}
