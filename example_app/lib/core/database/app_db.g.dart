// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $DbExampleTableTable extends DbExampleTable
    with TableInfo<$DbExampleTableTable, ExampleTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbExampleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
      'rank', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [rank, title];
  @override
  String get aliasedName => _alias ?? 'ExampleTable';
  @override
  String get actualTableName => 'ExampleTable';
  @override
  VerificationContext validateIntegrity(Insertable<ExampleTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('rank')) {
      context.handle(
          _rankMeta, rank.isAcceptableOrUnknown(data['rank']!, _rankMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rank};
  @override
  ExampleTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExampleTable(
      rank: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rank'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $DbExampleTableTable createAlias(String alias) {
    return $DbExampleTableTable(attachedDatabase, alias);
  }
}

class ExampleTable extends DataClass implements Insertable<ExampleTable> {
  final int rank;
  final String title;
  const ExampleTable({required this.rank, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rank'] = Variable<int>(rank);
    map['title'] = Variable<String>(title);
    return map;
  }

  DbExampleTableCompanion toCompanion(bool nullToAbsent) {
    return DbExampleTableCompanion(
      rank: Value(rank),
      title: Value(title),
    );
  }

  factory ExampleTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExampleTable(
      rank: serializer.fromJson<int>(json['rank']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rank': serializer.toJson<int>(rank),
      'title': serializer.toJson<String>(title),
    };
  }

  ExampleTable copyWith({int? rank, String? title}) => ExampleTable(
        rank: rank ?? this.rank,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('ExampleTable(')
          ..write('rank: $rank, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(rank, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleTable &&
          other.rank == this.rank &&
          other.title == this.title);
}

class DbExampleTableCompanion extends UpdateCompanion<ExampleTable> {
  final Value<int> rank;
  final Value<String> title;
  const DbExampleTableCompanion({
    this.rank = const Value.absent(),
    this.title = const Value.absent(),
  });
  DbExampleTableCompanion.insert({
    this.rank = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<ExampleTable> custom({
    Expression<int>? rank,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (rank != null) 'rank': rank,
      if (title != null) 'title': title,
    });
  }

  DbExampleTableCompanion copyWith({Value<int>? rank, Value<String>? title}) {
    return DbExampleTableCompanion(
      rank: rank ?? this.rank,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbExampleTableCompanion(')
          ..write('rank: $rank, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $DbExampleTableTable dbExampleTable = $DbExampleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbExampleTable];
}
