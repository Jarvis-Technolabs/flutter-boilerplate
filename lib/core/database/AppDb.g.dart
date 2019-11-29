// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Institutions extends DataClass implements Insertable<Institutions> {
  final int institutionId;
  final String institutionName;
  Institutions({@required this.institutionId, @required this.institutionName});
  factory Institutions.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Institutions(
      institutionId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}InstitutionId']),
      institutionName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}InstitutionName']),
    );
  }
  factory Institutions.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Institutions(
      institutionId: serializer.fromJson<int>(json['institutionId']),
      institutionName: serializer.fromJson<String>(json['institutionName']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'institutionId': serializer.toJson<int>(institutionId),
      'institutionName': serializer.toJson<String>(institutionName),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Institutions>>(
      bool nullToAbsent) {
    return DbInstitutionsCompanion(
      institutionId: institutionId == null && nullToAbsent
          ? const Value.absent()
          : Value(institutionId),
      institutionName: institutionName == null && nullToAbsent
          ? const Value.absent()
          : Value(institutionName),
    ) as T;
  }

  Institutions copyWith({int institutionId, String institutionName}) =>
      Institutions(
        institutionId: institutionId ?? this.institutionId,
        institutionName: institutionName ?? this.institutionName,
      );
  @override
  String toString() {
    return (StringBuffer('Institutions(')
          ..write('institutionId: $institutionId, ')
          ..write('institutionName: $institutionName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(institutionId.hashCode, institutionName.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Institutions &&
          other.institutionId == institutionId &&
          other.institutionName == institutionName);
}

class DbInstitutionsCompanion extends UpdateCompanion<Institutions> {
  final Value<int> institutionId;
  final Value<String> institutionName;
  const DbInstitutionsCompanion({
    this.institutionId = const Value.absent(),
    this.institutionName = const Value.absent(),
  });
  DbInstitutionsCompanion copyWith(
      {Value<int> institutionId, Value<String> institutionName}) {
    return DbInstitutionsCompanion(
      institutionId: institutionId ?? this.institutionId,
      institutionName: institutionName ?? this.institutionName,
    );
  }
}

class $DbInstitutionsTable extends DbInstitutions
    with TableInfo<$DbInstitutionsTable, Institutions> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbInstitutionsTable(this._db, [this._alias]);
  final VerificationMeta _institutionIdMeta =
      const VerificationMeta('institutionId');
  GeneratedIntColumn _institutionId;
  @override
  GeneratedIntColumn get institutionId =>
      _institutionId ??= _constructInstitutionId();
  GeneratedIntColumn _constructInstitutionId() {
    return GeneratedIntColumn(
      'InstitutionId',
      $tableName,
      false,
    );
  }

  final VerificationMeta _institutionNameMeta =
      const VerificationMeta('institutionName');
  GeneratedTextColumn _institutionName;
  @override
  GeneratedTextColumn get institutionName =>
      _institutionName ??= _constructInstitutionName();
  GeneratedTextColumn _constructInstitutionName() {
    return GeneratedTextColumn(
      'InstitutionName',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [institutionId, institutionName];
  @override
  $DbInstitutionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'institutions';
  @override
  final String actualTableName = 'institutions';
  @override
  VerificationContext validateIntegrity(DbInstitutionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.institutionId.present) {
      context.handle(
          _institutionIdMeta,
          institutionId.isAcceptableValue(
              d.institutionId.value, _institutionIdMeta));
    } else if (institutionId.isRequired && isInserting) {
      context.missing(_institutionIdMeta);
    }
    if (d.institutionName.present) {
      context.handle(
          _institutionNameMeta,
          institutionName.isAcceptableValue(
              d.institutionName.value, _institutionNameMeta));
    } else if (institutionName.isRequired && isInserting) {
      context.missing(_institutionNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {institutionId};
  @override
  Institutions map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Institutions.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbInstitutionsCompanion d) {
    final map = <String, Variable>{};
    if (d.institutionId.present) {
      map['InstitutionId'] = Variable<int, IntType>(d.institutionId.value);
    }
    if (d.institutionName.present) {
      map['InstitutionName'] =
          Variable<String, StringType>(d.institutionName.value);
    }
    return map;
  }

  @override
  $DbInstitutionsTable createAlias(String alias) {
    return $DbInstitutionsTable(_db, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $DbInstitutionsTable _dbInstitutions;
  $DbInstitutionsTable get dbInstitutions =>
      _dbInstitutions ??= $DbInstitutionsTable(this);
  Institutions _rowToInstitutions(QueryRow row) {
    return Institutions(
      institutionId: row.readInt('InstitutionId'),
      institutionName: row.readString('InstitutionName'),
    );
  }

  Future<List<Institutions>> selectInstitutions(
      {@Deprecated('No longer needed with Moor 1.6 - see the changelog for details')
          QueryEngine operateOn}) {
    return (operateOn ?? this).customSelect('Select * FROM institutions',
        variables: []).then((rows) => rows.map(_rowToInstitutions).toList());
  }

  Stream<List<Institutions>> watchSelectInstitutions() {
    return customSelectStream('Select * FROM institutions',
            variables: [], readsFrom: {dbInstitutions})
        .map((rows) => rows.map(_rowToInstitutions).toList());
  }

  @override
  List<TableInfo> get allTables => [dbInstitutions];
}
