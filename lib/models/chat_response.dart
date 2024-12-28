class ChatResponse {
  final String content;

  ChatResponse({required this.content});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      content: json['choices'][0]['message']['content'],
    );
  }
}
