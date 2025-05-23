import 'dart:convert';

class MultiLangStringDTO {
  MultiLangStringDTO({required this.languages});

  factory MultiLangStringDTO.fromJson(Map<String, dynamic> json) {
    final map = json.map((key, value) => MapEntry(key, value as String));
    return MultiLangStringDTO(languages: map);
  }

  final Map<String, String> languages;

  Map<String, dynamic> toJson() => languages;

  @override
  String toString() => jsonEncode(toJson());
}
