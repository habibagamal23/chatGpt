class ChatRequest {
  final String model;
  final List<Map<String, String>> messages;
  final int maxTokens;
  final double temperature;

  ChatRequest({
    required this.model,
    required this.messages,
    required this.maxTokens,
    required this.temperature,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': messages,
      'max_tokens': maxTokens,
      'temperature': temperature,
    };
  }
}
