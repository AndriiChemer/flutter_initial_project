import 'dart:convert';

class MultiLangStringDTO {
  MultiLangStringDTO({required this.languages});

  factory MultiLangStringDTO.fromStringJson(String json) {
    final nameJson = jsonDecode(json) as Map<String, dynamic>;
    return MultiLangStringDTO.fromJson(nameJson);
  }

  factory MultiLangStringDTO.fromJson(Map<String, dynamic> json) {
    final map = json.map((key, value) => MapEntry(key, value as String));
    return MultiLangStringDTO(languages: map);
  }

  final Map<String, String> languages;

  String get en {
    return languages.entries.last.value;
  }

  Map<String, dynamic> toJson() => languages;

  @override
  String toString() => jsonEncode(toJson());
}
