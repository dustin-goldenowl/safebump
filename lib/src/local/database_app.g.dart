// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_app.dart';

// ignore_for_file: type=lint
class $BabyInforEntityTable extends BabyInforEntity
    with TableInfo<$BabyInforEntityTable, BabyInforEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BabyInforEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, date, gender, weight, height];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baby_infor_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<BabyInforEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BabyInforEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BabyInforEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height']),
    );
  }

  @override
  $BabyInforEntityTable createAlias(String alias) {
    return $BabyInforEntityTable(attachedDatabase, alias);
  }
}

class BabyInforEntityData extends DataClass
    implements Insertable<BabyInforEntityData> {
  final String id;
  final String name;
  final String type;
  final DateTime date;
  final String? gender;
  final double? weight;
  final double? height;
  const BabyInforEntityData(
      {required this.id,
      required this.name,
      required this.type,
      required this.date,
      this.gender,
      this.weight,
      this.height});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    return map;
  }

  BabyInforEntityCompanion toCompanion(bool nullToAbsent) {
    return BabyInforEntityCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      date: Value(date),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
    );
  }

  factory BabyInforEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BabyInforEntityData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      date: serializer.fromJson<DateTime>(json['date']),
      gender: serializer.fromJson<String?>(json['gender']),
      weight: serializer.fromJson<double?>(json['weight']),
      height: serializer.fromJson<double?>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'date': serializer.toJson<DateTime>(date),
      'gender': serializer.toJson<String?>(gender),
      'weight': serializer.toJson<double?>(weight),
      'height': serializer.toJson<double?>(height),
    };
  }

  BabyInforEntityData copyWith(
          {String? id,
          String? name,
          String? type,
          DateTime? date,
          Value<String?> gender = const Value.absent(),
          Value<double?> weight = const Value.absent(),
          Value<double?> height = const Value.absent()}) =>
      BabyInforEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        date: date ?? this.date,
        gender: gender.present ? gender.value : this.gender,
        weight: weight.present ? weight.value : this.weight,
        height: height.present ? height.value : this.height,
      );
  @override
  String toString() {
    return (StringBuffer('BabyInforEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('gender: $gender, ')
          ..write('weight: $weight, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, date, gender, weight, height);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BabyInforEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.date == this.date &&
          other.gender == this.gender &&
          other.weight == this.weight &&
          other.height == this.height);
}

class BabyInforEntityCompanion extends UpdateCompanion<BabyInforEntityData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<DateTime> date;
  final Value<String?> gender;
  final Value<double?> weight;
  final Value<double?> height;
  final Value<int> rowid;
  const BabyInforEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.date = const Value.absent(),
    this.gender = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BabyInforEntityCompanion.insert({
    required String id,
    required String name,
    required String type,
    required DateTime date,
    this.gender = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type),
        date = Value(date);
  static Insertable<BabyInforEntityData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<DateTime>? date,
    Expression<String>? gender,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (date != null) 'date': date,
      if (gender != null) 'gender': gender,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BabyInforEntityCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<DateTime>? date,
      Value<String?>? gender,
      Value<double?>? weight,
      Value<double?>? height,
      Value<int>? rowid}) {
    return BabyInforEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      date: date ?? this.date,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BabyInforEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('gender: $gender, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseApp extends GeneratedDatabase {
  _$DatabaseApp(QueryExecutor e) : super(e);
  late final $BabyInforEntityTable babyInforEntity =
      $BabyInforEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [babyInforEntity];
}
