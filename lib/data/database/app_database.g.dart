// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MasterTableTable extends MasterTable
    with TableInfo<$MasterTableTable, MasterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasterTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _kanaMeta = const VerificationMeta('kana');
  @override
  late final GeneratedColumn<String> kana = GeneratedColumn<String>(
      'kana', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _useCountMeta =
      const VerificationMeta('useCount');
  @override
  late final GeneratedColumn<int> useCount = GeneratedColumn<int>(
      'use_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastUsedAtMeta =
      const VerificationMeta('lastUsedAt');
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
      'last_used_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, kana, type, useCount, lastUsedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'master_table';
  @override
  VerificationContext validateIntegrity(Insertable<MasterTableData> instance,
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
    if (data.containsKey('kana')) {
      context.handle(
          _kanaMeta, kana.isAcceptableOrUnknown(data['kana']!, _kanaMeta));
    } else if (isInserting) {
      context.missing(_kanaMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('use_count')) {
      context.handle(_useCountMeta,
          useCount.isAcceptableOrUnknown(data['use_count']!, _useCountMeta));
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
          _lastUsedAtMeta,
          lastUsedAt.isAcceptableOrUnknown(
              data['last_used_at']!, _lastUsedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MasterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasterTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      kana: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kana'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      useCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}use_count'])!,
      lastUsedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_used_at'])!,
    );
  }

  @override
  $MasterTableTable createAlias(String alias) {
    return $MasterTableTable(attachedDatabase, alias);
  }
}

class MasterTableData extends DataClass implements Insertable<MasterTableData> {
  final String id;
  final String name;
  final String kana;
  final String type;
  final int useCount;
  final DateTime lastUsedAt;
  const MasterTableData(
      {required this.id,
      required this.name,
      required this.kana,
      required this.type,
      required this.useCount,
      required this.lastUsedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['kana'] = Variable<String>(kana);
    map['type'] = Variable<String>(type);
    map['use_count'] = Variable<int>(useCount);
    map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    return map;
  }

  MasterTableCompanion toCompanion(bool nullToAbsent) {
    return MasterTableCompanion(
      id: Value(id),
      name: Value(name),
      kana: Value(kana),
      type: Value(type),
      useCount: Value(useCount),
      lastUsedAt: Value(lastUsedAt),
    );
  }

  factory MasterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasterTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      kana: serializer.fromJson<String>(json['kana']),
      type: serializer.fromJson<String>(json['type']),
      useCount: serializer.fromJson<int>(json['useCount']),
      lastUsedAt: serializer.fromJson<DateTime>(json['lastUsedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'kana': serializer.toJson<String>(kana),
      'type': serializer.toJson<String>(type),
      'useCount': serializer.toJson<int>(useCount),
      'lastUsedAt': serializer.toJson<DateTime>(lastUsedAt),
    };
  }

  MasterTableData copyWith(
          {String? id,
          String? name,
          String? kana,
          String? type,
          int? useCount,
          DateTime? lastUsedAt}) =>
      MasterTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        kana: kana ?? this.kana,
        type: type ?? this.type,
        useCount: useCount ?? this.useCount,
        lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      );
  MasterTableData copyWithCompanion(MasterTableCompanion data) {
    return MasterTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kana: data.kana.present ? data.kana.value : this.kana,
      type: data.type.present ? data.type.value : this.type,
      useCount: data.useCount.present ? data.useCount.value : this.useCount,
      lastUsedAt:
          data.lastUsedAt.present ? data.lastUsedAt.value : this.lastUsedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasterTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kana: $kana, ')
          ..write('type: $type, ')
          ..write('useCount: $useCount, ')
          ..write('lastUsedAt: $lastUsedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, kana, type, useCount, lastUsedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasterTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.kana == this.kana &&
          other.type == this.type &&
          other.useCount == this.useCount &&
          other.lastUsedAt == this.lastUsedAt);
}

class MasterTableCompanion extends UpdateCompanion<MasterTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> kana;
  final Value<String> type;
  final Value<int> useCount;
  final Value<DateTime> lastUsedAt;
  final Value<int> rowid;
  const MasterTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kana = const Value.absent(),
    this.type = const Value.absent(),
    this.useCount = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasterTableCompanion.insert({
    required String id,
    required String name,
    required String kana,
    required String type,
    this.useCount = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        kana = Value(kana),
        type = Value(type);
  static Insertable<MasterTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? kana,
    Expression<String>? type,
    Expression<int>? useCount,
    Expression<DateTime>? lastUsedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kana != null) 'kana': kana,
      if (type != null) 'type': type,
      if (useCount != null) 'use_count': useCount,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasterTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? kana,
      Value<String>? type,
      Value<int>? useCount,
      Value<DateTime>? lastUsedAt,
      Value<int>? rowid}) {
    return MasterTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kana: kana ?? this.kana,
      type: type ?? this.type,
      useCount: useCount ?? this.useCount,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
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
    if (kana.present) {
      map['kana'] = Variable<String>(kana.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (useCount.present) {
      map['use_count'] = Variable<int>(useCount.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasterTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kana: $kana, ')
          ..write('type: $type, ')
          ..write('useCount: $useCount, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MasterTypeTableTable extends MasterTypeTable
    with TableInfo<$MasterTypeTableTable, MasterTypeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasterTypeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'master_type_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MasterTypeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MasterTypeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasterTypeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $MasterTypeTableTable createAlias(String alias) {
    return $MasterTypeTableTable(attachedDatabase, alias);
  }
}

class MasterTypeTableData extends DataClass
    implements Insertable<MasterTypeTableData> {
  final String id;
  final String label;
  const MasterTypeTableData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  MasterTypeTableCompanion toCompanion(bool nullToAbsent) {
    return MasterTypeTableCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory MasterTypeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasterTypeTableData(
      id: serializer.fromJson<String>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  MasterTypeTableData copyWith({String? id, String? label}) =>
      MasterTypeTableData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  MasterTypeTableData copyWithCompanion(MasterTypeTableCompanion data) {
    return MasterTypeTableData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasterTypeTableData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasterTypeTableData &&
          other.id == this.id &&
          other.label == this.label);
}

class MasterTypeTableCompanion extends UpdateCompanion<MasterTypeTableData> {
  final Value<String> id;
  final Value<String> label;
  final Value<int> rowid;
  const MasterTypeTableCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasterTypeTableCompanion.insert({
    required String id,
    required String label,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        label = Value(label);
  static Insertable<MasterTypeTableData> custom({
    Expression<String>? id,
    Expression<String>? label,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasterTypeTableCompanion copyWith(
      {Value<String>? id, Value<String>? label, Value<int>? rowid}) {
    return MasterTypeTableCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasterTypeTableCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MasterHistoryTableTable extends MasterHistoryTable
    with TableInfo<$MasterHistoryTableTable, MasterHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasterHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _masterIdMeta =
      const VerificationMeta('masterId');
  @override
  late final GeneratedColumn<String> masterId = GeneratedColumn<String>(
      'master_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usedAtMeta = const VerificationMeta('usedAt');
  @override
  late final GeneratedColumn<DateTime> usedAt = GeneratedColumn<DateTime>(
      'used_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _useCountMeta =
      const VerificationMeta('useCount');
  @override
  late final GeneratedColumn<int> useCount = GeneratedColumn<int>(
      'use_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [masterId, usedAt, useCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'master_history_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MasterHistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('master_id')) {
      context.handle(_masterIdMeta,
          masterId.isAcceptableOrUnknown(data['master_id']!, _masterIdMeta));
    } else if (isInserting) {
      context.missing(_masterIdMeta);
    }
    if (data.containsKey('used_at')) {
      context.handle(_usedAtMeta,
          usedAt.isAcceptableOrUnknown(data['used_at']!, _usedAtMeta));
    }
    if (data.containsKey('use_count')) {
      context.handle(_useCountMeta,
          useCount.isAcceptableOrUnknown(data['use_count']!, _useCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {masterId, usedAt};
  @override
  MasterHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasterHistoryTableData(
      masterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}master_id'])!,
      usedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}used_at'])!,
      useCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}use_count'])!,
    );
  }

  @override
  $MasterHistoryTableTable createAlias(String alias) {
    return $MasterHistoryTableTable(attachedDatabase, alias);
  }
}

class MasterHistoryTableData extends DataClass
    implements Insertable<MasterHistoryTableData> {
  final String masterId;
  final DateTime usedAt;
  final int useCount;
  const MasterHistoryTableData(
      {required this.masterId, required this.usedAt, required this.useCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['master_id'] = Variable<String>(masterId);
    map['used_at'] = Variable<DateTime>(usedAt);
    map['use_count'] = Variable<int>(useCount);
    return map;
  }

  MasterHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return MasterHistoryTableCompanion(
      masterId: Value(masterId),
      usedAt: Value(usedAt),
      useCount: Value(useCount),
    );
  }

  factory MasterHistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasterHistoryTableData(
      masterId: serializer.fromJson<String>(json['masterId']),
      usedAt: serializer.fromJson<DateTime>(json['usedAt']),
      useCount: serializer.fromJson<int>(json['useCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'masterId': serializer.toJson<String>(masterId),
      'usedAt': serializer.toJson<DateTime>(usedAt),
      'useCount': serializer.toJson<int>(useCount),
    };
  }

  MasterHistoryTableData copyWith(
          {String? masterId, DateTime? usedAt, int? useCount}) =>
      MasterHistoryTableData(
        masterId: masterId ?? this.masterId,
        usedAt: usedAt ?? this.usedAt,
        useCount: useCount ?? this.useCount,
      );
  MasterHistoryTableData copyWithCompanion(MasterHistoryTableCompanion data) {
    return MasterHistoryTableData(
      masterId: data.masterId.present ? data.masterId.value : this.masterId,
      usedAt: data.usedAt.present ? data.usedAt.value : this.usedAt,
      useCount: data.useCount.present ? data.useCount.value : this.useCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasterHistoryTableData(')
          ..write('masterId: $masterId, ')
          ..write('usedAt: $usedAt, ')
          ..write('useCount: $useCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(masterId, usedAt, useCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasterHistoryTableData &&
          other.masterId == this.masterId &&
          other.usedAt == this.usedAt &&
          other.useCount == this.useCount);
}

class MasterHistoryTableCompanion
    extends UpdateCompanion<MasterHistoryTableData> {
  final Value<String> masterId;
  final Value<DateTime> usedAt;
  final Value<int> useCount;
  final Value<int> rowid;
  const MasterHistoryTableCompanion({
    this.masterId = const Value.absent(),
    this.usedAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasterHistoryTableCompanion.insert({
    required String masterId,
    this.usedAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : masterId = Value(masterId);
  static Insertable<MasterHistoryTableData> custom({
    Expression<String>? masterId,
    Expression<DateTime>? usedAt,
    Expression<int>? useCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (masterId != null) 'master_id': masterId,
      if (usedAt != null) 'used_at': usedAt,
      if (useCount != null) 'use_count': useCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasterHistoryTableCompanion copyWith(
      {Value<String>? masterId,
      Value<DateTime>? usedAt,
      Value<int>? useCount,
      Value<int>? rowid}) {
    return MasterHistoryTableCompanion(
      masterId: masterId ?? this.masterId,
      usedAt: usedAt ?? this.usedAt,
      useCount: useCount ?? this.useCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (masterId.present) {
      map['master_id'] = Variable<String>(masterId.value);
    }
    if (usedAt.present) {
      map['used_at'] = Variable<DateTime>(usedAt.value);
    }
    if (useCount.present) {
      map['use_count'] = Variable<int>(useCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasterHistoryTableCompanion(')
          ..write('masterId: $masterId, ')
          ..write('usedAt: $usedAt, ')
          ..write('useCount: $useCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MasterTableTable masterTable = $MasterTableTable(this);
  late final $MasterTypeTableTable masterTypeTable =
      $MasterTypeTableTable(this);
  late final $MasterHistoryTableTable masterHistoryTable =
      $MasterHistoryTableTable(this);
  late final MasterDao masterDao = MasterDao(this as AppDatabase);
  late final MasterTypeDao masterTypeDao = MasterTypeDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [masterTable, masterTypeTable, masterHistoryTable];
}

typedef $$MasterTableTableCreateCompanionBuilder = MasterTableCompanion
    Function({
  required String id,
  required String name,
  required String kana,
  required String type,
  Value<int> useCount,
  Value<DateTime> lastUsedAt,
  Value<int> rowid,
});
typedef $$MasterTableTableUpdateCompanionBuilder = MasterTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> kana,
  Value<String> type,
  Value<int> useCount,
  Value<DateTime> lastUsedAt,
  Value<int> rowid,
});

class $$MasterTableTableFilterComposer
    extends Composer<_$AppDatabase, $MasterTableTable> {
  $$MasterTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kana => $composableBuilder(
      column: $table.kana, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get useCount => $composableBuilder(
      column: $table.useCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnFilters(column));
}

class $$MasterTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MasterTableTable> {
  $$MasterTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kana => $composableBuilder(
      column: $table.kana, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get useCount => $composableBuilder(
      column: $table.useCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnOrderings(column));
}

class $$MasterTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasterTableTable> {
  $$MasterTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kana =>
      $composableBuilder(column: $table.kana, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get useCount =>
      $composableBuilder(column: $table.useCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => column);
}

class $$MasterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MasterTableTable,
    MasterTableData,
    $$MasterTableTableFilterComposer,
    $$MasterTableTableOrderingComposer,
    $$MasterTableTableAnnotationComposer,
    $$MasterTableTableCreateCompanionBuilder,
    $$MasterTableTableUpdateCompanionBuilder,
    (
      MasterTableData,
      BaseReferences<_$AppDatabase, $MasterTableTable, MasterTableData>
    ),
    MasterTableData,
    PrefetchHooks Function()> {
  $$MasterTableTableTableManager(_$AppDatabase db, $MasterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasterTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasterTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasterTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> kana = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<DateTime> lastUsedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasterTableCompanion(
            id: id,
            name: name,
            kana: kana,
            type: type,
            useCount: useCount,
            lastUsedAt: lastUsedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String kana,
            required String type,
            Value<int> useCount = const Value.absent(),
            Value<DateTime> lastUsedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasterTableCompanion.insert(
            id: id,
            name: name,
            kana: kana,
            type: type,
            useCount: useCount,
            lastUsedAt: lastUsedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MasterTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MasterTableTable,
    MasterTableData,
    $$MasterTableTableFilterComposer,
    $$MasterTableTableOrderingComposer,
    $$MasterTableTableAnnotationComposer,
    $$MasterTableTableCreateCompanionBuilder,
    $$MasterTableTableUpdateCompanionBuilder,
    (
      MasterTableData,
      BaseReferences<_$AppDatabase, $MasterTableTable, MasterTableData>
    ),
    MasterTableData,
    PrefetchHooks Function()>;
typedef $$MasterTypeTableTableCreateCompanionBuilder = MasterTypeTableCompanion
    Function({
  required String id,
  required String label,
  Value<int> rowid,
});
typedef $$MasterTypeTableTableUpdateCompanionBuilder = MasterTypeTableCompanion
    Function({
  Value<String> id,
  Value<String> label,
  Value<int> rowid,
});

class $$MasterTypeTableTableFilterComposer
    extends Composer<_$AppDatabase, $MasterTypeTableTable> {
  $$MasterTypeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));
}

class $$MasterTypeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MasterTypeTableTable> {
  $$MasterTypeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));
}

class $$MasterTypeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasterTypeTableTable> {
  $$MasterTypeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);
}

class $$MasterTypeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MasterTypeTableTable,
    MasterTypeTableData,
    $$MasterTypeTableTableFilterComposer,
    $$MasterTypeTableTableOrderingComposer,
    $$MasterTypeTableTableAnnotationComposer,
    $$MasterTypeTableTableCreateCompanionBuilder,
    $$MasterTypeTableTableUpdateCompanionBuilder,
    (
      MasterTypeTableData,
      BaseReferences<_$AppDatabase, $MasterTypeTableTable, MasterTypeTableData>
    ),
    MasterTypeTableData,
    PrefetchHooks Function()> {
  $$MasterTypeTableTableTableManager(
      _$AppDatabase db, $MasterTypeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasterTypeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasterTypeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasterTypeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasterTypeTableCompanion(
            id: id,
            label: label,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String label,
            Value<int> rowid = const Value.absent(),
          }) =>
              MasterTypeTableCompanion.insert(
            id: id,
            label: label,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MasterTypeTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MasterTypeTableTable,
    MasterTypeTableData,
    $$MasterTypeTableTableFilterComposer,
    $$MasterTypeTableTableOrderingComposer,
    $$MasterTypeTableTableAnnotationComposer,
    $$MasterTypeTableTableCreateCompanionBuilder,
    $$MasterTypeTableTableUpdateCompanionBuilder,
    (
      MasterTypeTableData,
      BaseReferences<_$AppDatabase, $MasterTypeTableTable, MasterTypeTableData>
    ),
    MasterTypeTableData,
    PrefetchHooks Function()>;
typedef $$MasterHistoryTableTableCreateCompanionBuilder
    = MasterHistoryTableCompanion Function({
  required String masterId,
  Value<DateTime> usedAt,
  Value<int> useCount,
  Value<int> rowid,
});
typedef $$MasterHistoryTableTableUpdateCompanionBuilder
    = MasterHistoryTableCompanion Function({
  Value<String> masterId,
  Value<DateTime> usedAt,
  Value<int> useCount,
  Value<int> rowid,
});

class $$MasterHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $MasterHistoryTableTable> {
  $$MasterHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get masterId => $composableBuilder(
      column: $table.masterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get useCount => $composableBuilder(
      column: $table.useCount, builder: (column) => ColumnFilters(column));
}

class $$MasterHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MasterHistoryTableTable> {
  $$MasterHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get masterId => $composableBuilder(
      column: $table.masterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get useCount => $composableBuilder(
      column: $table.useCount, builder: (column) => ColumnOrderings(column));
}

class $$MasterHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasterHistoryTableTable> {
  $$MasterHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get masterId =>
      $composableBuilder(column: $table.masterId, builder: (column) => column);

  GeneratedColumn<DateTime> get usedAt =>
      $composableBuilder(column: $table.usedAt, builder: (column) => column);

  GeneratedColumn<int> get useCount =>
      $composableBuilder(column: $table.useCount, builder: (column) => column);
}

class $$MasterHistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MasterHistoryTableTable,
    MasterHistoryTableData,
    $$MasterHistoryTableTableFilterComposer,
    $$MasterHistoryTableTableOrderingComposer,
    $$MasterHistoryTableTableAnnotationComposer,
    $$MasterHistoryTableTableCreateCompanionBuilder,
    $$MasterHistoryTableTableUpdateCompanionBuilder,
    (
      MasterHistoryTableData,
      BaseReferences<_$AppDatabase, $MasterHistoryTableTable,
          MasterHistoryTableData>
    ),
    MasterHistoryTableData,
    PrefetchHooks Function()> {
  $$MasterHistoryTableTableTableManager(
      _$AppDatabase db, $MasterHistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasterHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasterHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasterHistoryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> masterId = const Value.absent(),
            Value<DateTime> usedAt = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasterHistoryTableCompanion(
            masterId: masterId,
            usedAt: usedAt,
            useCount: useCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String masterId,
            Value<DateTime> usedAt = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasterHistoryTableCompanion.insert(
            masterId: masterId,
            usedAt: usedAt,
            useCount: useCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MasterHistoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MasterHistoryTableTable,
    MasterHistoryTableData,
    $$MasterHistoryTableTableFilterComposer,
    $$MasterHistoryTableTableOrderingComposer,
    $$MasterHistoryTableTableAnnotationComposer,
    $$MasterHistoryTableTableCreateCompanionBuilder,
    $$MasterHistoryTableTableUpdateCompanionBuilder,
    (
      MasterHistoryTableData,
      BaseReferences<_$AppDatabase, $MasterHistoryTableTable,
          MasterHistoryTableData>
    ),
    MasterHistoryTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MasterTableTableTableManager get masterTable =>
      $$MasterTableTableTableManager(_db, _db.masterTable);
  $$MasterTypeTableTableTableManager get masterTypeTable =>
      $$MasterTypeTableTableTableManager(_db, _db.masterTypeTable);
  $$MasterHistoryTableTableTableManager get masterHistoryTable =>
      $$MasterHistoryTableTableTableManager(_db, _db.masterHistoryTable);
}
