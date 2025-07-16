import 'package:iteo_libraries_example/app_write/dto/appwrite_converter.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_phrase_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyPhraseDTO implements AppwriteConverter {
  DailyPhraseDTO({
    required this.id,
    required this.phrase,
    required this.createdAt,
    required this.categoryId,
    required this.status,
  });

  factory DailyPhraseDTO.fromJson(Map<String, dynamic> json) => _$DailyPhraseDTOFromJson(json);

  factory DailyPhraseDTO.fromDynamic(dynamic data) => _$DailyPhraseDTOFromJson(data as Map<String, dynamic>);

  factory DailyPhraseDTO.fromAppWriteJson(Map<String, dynamic> json) => DailyPhraseDTO(
        id: json['id'] as String,
        phrase: MultiLangStringDTO.fromStringJson(json['phrase_json'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        status: statusFromString(
          json['status'] as String,
        ),
      );

  final String id;
  final MultiLangStringDTO phrase;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final StatusDTO status;

  DailyPhraseDTO copyWith({
    String? id,
    MultiLangStringDTO? phrase,
    DateTime? createdAt,
    String? categoryId,
    StatusDTO? status,
  }) {
    return DailyPhraseDTO(
      id: id ?? this.id,
      phrase: phrase ?? this.phrase,
      createdAt: createdAt ?? this.createdAt,
      categoryId: categoryId ?? this.categoryId,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => _$DailyPhraseDTOToJson(this);

  @override
  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'phrase_json': phrase.toString(),
        'created_at': createdAt.toIso8601String(),
        'status': statusToString(status),
        'category_id': categoryId,
      };
}
