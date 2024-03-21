// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_local_database.db.dart';

// ignore_for_file: type=lint
class $CarEntityTable extends CarEntity
    with TableInfo<$CarEntityTable, CarEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _registrationMeta =
      const VerificationMeta('registration');
  @override
  late final GeneratedColumn<String> registration = GeneratedColumn<String>(
      'registration', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [createdAt, id, brand, model, registration, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'car_entity';
  @override
  VerificationContext validateIntegrity(Insertable<CarEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('registration')) {
      context.handle(
          _registrationMeta,
          registration.isAcceptableOrUnknown(
              data['registration']!, _registrationMeta));
    } else if (isInserting) {
      context.missing(_registrationMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CarEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarEntityData(
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand'])!,
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model'])!,
      registration: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}registration'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
    );
  }

  @override
  $CarEntityTable createAlias(String alias) {
    return $CarEntityTable(attachedDatabase, alias);
  }
}

class CarEntityData extends DataClass implements Insertable<CarEntityData> {
  final DateTime createdAt;
  final String id;
  final String brand;
  final String model;
  final String registration;
  final String? color;
  const CarEntityData(
      {required this.createdAt,
      required this.id,
      required this.brand,
      required this.model,
      required this.registration,
      this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['id'] = Variable<String>(id);
    map['brand'] = Variable<String>(brand);
    map['model'] = Variable<String>(model);
    map['registration'] = Variable<String>(registration);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    return map;
  }

  CarEntityCompanion toCompanion(bool nullToAbsent) {
    return CarEntityCompanion(
      createdAt: Value(createdAt),
      id: Value(id),
      brand: Value(brand),
      model: Value(model),
      registration: Value(registration),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    );
  }

  factory CarEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarEntityData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      id: serializer.fromJson<String>(json['id']),
      brand: serializer.fromJson<String>(json['brand']),
      model: serializer.fromJson<String>(json['model']),
      registration: serializer.fromJson<String>(json['registration']),
      color: serializer.fromJson<String?>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'id': serializer.toJson<String>(id),
      'brand': serializer.toJson<String>(brand),
      'model': serializer.toJson<String>(model),
      'registration': serializer.toJson<String>(registration),
      'color': serializer.toJson<String?>(color),
    };
  }

  CarEntityData copyWith(
          {DateTime? createdAt,
          String? id,
          String? brand,
          String? model,
          String? registration,
          Value<String?> color = const Value.absent()}) =>
      CarEntityData(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        registration: registration ?? this.registration,
        color: color.present ? color.value : this.color,
      );
  @override
  String toString() {
    return (StringBuffer('CarEntityData(')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('registration: $registration, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, id, brand, model, registration, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarEntityData &&
          other.createdAt == this.createdAt &&
          other.id == this.id &&
          other.brand == this.brand &&
          other.model == this.model &&
          other.registration == this.registration &&
          other.color == this.color);
}

class CarEntityCompanion extends UpdateCompanion<CarEntityData> {
  final Value<DateTime> createdAt;
  final Value<String> id;
  final Value<String> brand;
  final Value<String> model;
  final Value<String> registration;
  final Value<String?> color;
  final Value<int> rowid;
  const CarEntityCompanion({
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.registration = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CarEntityCompanion.insert({
    this.createdAt = const Value.absent(),
    required String id,
    required String brand,
    required String model,
    required String registration,
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        brand = Value(brand),
        model = Value(model),
        registration = Value(registration);
  static Insertable<CarEntityData> custom({
    Expression<DateTime>? createdAt,
    Expression<String>? id,
    Expression<String>? brand,
    Expression<String>? model,
    Expression<String>? registration,
    Expression<String>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (id != null) 'id': id,
      if (brand != null) 'brand': brand,
      if (model != null) 'model': model,
      if (registration != null) 'registration': registration,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CarEntityCompanion copyWith(
      {Value<DateTime>? createdAt,
      Value<String>? id,
      Value<String>? brand,
      Value<String>? model,
      Value<String>? registration,
      Value<String?>? color,
      Value<int>? rowid}) {
    return CarEntityCompanion(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      registration: registration ?? this.registration,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (registration.present) {
      map['registration'] = Variable<String>(registration.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarEntityCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('registration: $registration, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftLocalDatabase extends GeneratedDatabase {
  _$DriftLocalDatabase(QueryExecutor e) : super(e);
  late final $CarEntityTable carEntity = $CarEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [carEntity];
}
