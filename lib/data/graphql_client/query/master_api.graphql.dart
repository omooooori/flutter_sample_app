import 'package:gql/ast.dart';

class Query$FetchAllMasters {
  Query$FetchAllMasters({
    required this.master_list,
    this.$__typename = 'Query',
  });

  factory Query$FetchAllMasters.fromJson(Map<String, dynamic> json) {
    final l$master_list = json['master_list'];
    final l$$__typename = json['__typename'];
    return Query$FetchAllMasters(
      master_list: (l$master_list as List<dynamic>)
          .map((e) => Query$FetchAllMasters$master_list.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchAllMasters$master_list> master_list;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$master_list = master_list;
    _resultData['master_list'] = l$master_list.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$master_list = master_list;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$master_list.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchAllMasters || runtimeType != other.runtimeType) {
      return false;
    }
    final l$master_list = master_list;
    final lOther$master_list = other.master_list;
    if (l$master_list.length != lOther$master_list.length) {
      return false;
    }
    for (int i = 0; i < l$master_list.length; i++) {
      final l$master_list$entry = l$master_list[i];
      final lOther$master_list$entry = lOther$master_list[i];
      if (l$master_list$entry != lOther$master_list$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchAllMasters on Query$FetchAllMasters {
  CopyWith$Query$FetchAllMasters<Query$FetchAllMasters> get copyWith =>
      CopyWith$Query$FetchAllMasters(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FetchAllMasters<TRes> {
  factory CopyWith$Query$FetchAllMasters(
    Query$FetchAllMasters instance,
    TRes Function(Query$FetchAllMasters) then,
  ) = _CopyWithImpl$Query$FetchAllMasters;

  factory CopyWith$Query$FetchAllMasters.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchAllMasters;

  TRes call({
    List<Query$FetchAllMasters$master_list>? master_list,
    String? $__typename,
  });
  TRes master_list(
      Iterable<Query$FetchAllMasters$master_list> Function(
              Iterable<
                  CopyWith$Query$FetchAllMasters$master_list<
                      Query$FetchAllMasters$master_list>>)
          _fn);
}

class _CopyWithImpl$Query$FetchAllMasters<TRes>
    implements CopyWith$Query$FetchAllMasters<TRes> {
  _CopyWithImpl$Query$FetchAllMasters(
    this._instance,
    this._then,
  );

  final Query$FetchAllMasters _instance;

  final TRes Function(Query$FetchAllMasters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? master_list = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchAllMasters(
        master_list: master_list == _undefined || master_list == null
            ? _instance.master_list
            : (master_list as List<Query$FetchAllMasters$master_list>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes master_list(
          Iterable<Query$FetchAllMasters$master_list> Function(
                  Iterable<
                      CopyWith$Query$FetchAllMasters$master_list<
                          Query$FetchAllMasters$master_list>>)
              _fn) =>
      call(
          master_list: _fn(_instance.master_list
              .map((e) => CopyWith$Query$FetchAllMasters$master_list(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchAllMasters<TRes>
    implements CopyWith$Query$FetchAllMasters<TRes> {
  _CopyWithStubImpl$Query$FetchAllMasters(this._res);

  TRes _res;

  call({
    List<Query$FetchAllMasters$master_list>? master_list,
    String? $__typename,
  }) =>
      _res;

  master_list(_fn) => _res;
}

const documentNodeQueryFetchAllMasters = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FetchAllMasters'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'master_list'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'masterName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'masterNameKana'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'masterTypeId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$FetchAllMasters$master_list {
  Query$FetchAllMasters$master_list({
    required this.id,
    required this.masterName,
    required this.masterNameKana,
    required this.masterTypeId,
    this.$__typename = 'Master',
  });

  factory Query$FetchAllMasters$master_list.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$masterName = json['masterName'];
    final l$masterNameKana = json['masterNameKana'];
    final l$masterTypeId = json['masterTypeId'];
    final l$$__typename = json['__typename'];
    return Query$FetchAllMasters$master_list(
      id: (l$id as String),
      masterName: (l$masterName as String),
      masterNameKana: (l$masterNameKana as String),
      masterTypeId: (l$masterTypeId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String masterName;

  final String masterNameKana;

  final String masterTypeId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$masterName = masterName;
    _resultData['masterName'] = l$masterName;
    final l$masterNameKana = masterNameKana;
    _resultData['masterNameKana'] = l$masterNameKana;
    final l$masterTypeId = masterTypeId;
    _resultData['masterTypeId'] = l$masterTypeId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$masterName = masterName;
    final l$masterNameKana = masterNameKana;
    final l$masterTypeId = masterTypeId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$masterName,
      l$masterNameKana,
      l$masterTypeId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchAllMasters$master_list ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$masterName = masterName;
    final lOther$masterName = other.masterName;
    if (l$masterName != lOther$masterName) {
      return false;
    }
    final l$masterNameKana = masterNameKana;
    final lOther$masterNameKana = other.masterNameKana;
    if (l$masterNameKana != lOther$masterNameKana) {
      return false;
    }
    final l$masterTypeId = masterTypeId;
    final lOther$masterTypeId = other.masterTypeId;
    if (l$masterTypeId != lOther$masterTypeId) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchAllMasters$master_list
    on Query$FetchAllMasters$master_list {
  CopyWith$Query$FetchAllMasters$master_list<Query$FetchAllMasters$master_list>
      get copyWith => CopyWith$Query$FetchAllMasters$master_list(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchAllMasters$master_list<TRes> {
  factory CopyWith$Query$FetchAllMasters$master_list(
    Query$FetchAllMasters$master_list instance,
    TRes Function(Query$FetchAllMasters$master_list) then,
  ) = _CopyWithImpl$Query$FetchAllMasters$master_list;

  factory CopyWith$Query$FetchAllMasters$master_list.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchAllMasters$master_list;

  TRes call({
    String? id,
    String? masterName,
    String? masterNameKana,
    String? masterTypeId,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchAllMasters$master_list<TRes>
    implements CopyWith$Query$FetchAllMasters$master_list<TRes> {
  _CopyWithImpl$Query$FetchAllMasters$master_list(
    this._instance,
    this._then,
  );

  final Query$FetchAllMasters$master_list _instance;

  final TRes Function(Query$FetchAllMasters$master_list) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? masterName = _undefined,
    Object? masterNameKana = _undefined,
    Object? masterTypeId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchAllMasters$master_list(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        masterName: masterName == _undefined || masterName == null
            ? _instance.masterName
            : (masterName as String),
        masterNameKana: masterNameKana == _undefined || masterNameKana == null
            ? _instance.masterNameKana
            : (masterNameKana as String),
        masterTypeId: masterTypeId == _undefined || masterTypeId == null
            ? _instance.masterTypeId
            : (masterTypeId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchAllMasters$master_list<TRes>
    implements CopyWith$Query$FetchAllMasters$master_list<TRes> {
  _CopyWithStubImpl$Query$FetchAllMasters$master_list(this._res);

  TRes _res;

  call({
    String? id,
    String? masterName,
    String? masterNameKana,
    String? masterTypeId,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMasterTypes {
  Query$FetchMasterTypes({
    required this.master_type_list,
    this.$__typename = 'Query',
  });

  factory Query$FetchMasterTypes.fromJson(Map<String, dynamic> json) {
    final l$master_type_list = json['master_type_list'];
    final l$$__typename = json['__typename'];
    return Query$FetchMasterTypes(
      master_type_list: (l$master_type_list as List<dynamic>)
          .map((e) => Query$FetchMasterTypes$master_type_list.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchMasterTypes$master_type_list> master_type_list;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$master_type_list = master_type_list;
    _resultData['master_type_list'] =
        l$master_type_list.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$master_type_list = master_type_list;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$master_type_list.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchMasterTypes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$master_type_list = master_type_list;
    final lOther$master_type_list = other.master_type_list;
    if (l$master_type_list.length != lOther$master_type_list.length) {
      return false;
    }
    for (int i = 0; i < l$master_type_list.length; i++) {
      final l$master_type_list$entry = l$master_type_list[i];
      final lOther$master_type_list$entry = lOther$master_type_list[i];
      if (l$master_type_list$entry != lOther$master_type_list$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMasterTypes on Query$FetchMasterTypes {
  CopyWith$Query$FetchMasterTypes<Query$FetchMasterTypes> get copyWith =>
      CopyWith$Query$FetchMasterTypes(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FetchMasterTypes<TRes> {
  factory CopyWith$Query$FetchMasterTypes(
    Query$FetchMasterTypes instance,
    TRes Function(Query$FetchMasterTypes) then,
  ) = _CopyWithImpl$Query$FetchMasterTypes;

  factory CopyWith$Query$FetchMasterTypes.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchMasterTypes;

  TRes call({
    List<Query$FetchMasterTypes$master_type_list>? master_type_list,
    String? $__typename,
  });
  TRes master_type_list(
      Iterable<Query$FetchMasterTypes$master_type_list> Function(
              Iterable<
                  CopyWith$Query$FetchMasterTypes$master_type_list<
                      Query$FetchMasterTypes$master_type_list>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMasterTypes<TRes>
    implements CopyWith$Query$FetchMasterTypes<TRes> {
  _CopyWithImpl$Query$FetchMasterTypes(
    this._instance,
    this._then,
  );

  final Query$FetchMasterTypes _instance;

  final TRes Function(Query$FetchMasterTypes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? master_type_list = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMasterTypes(
        master_type_list:
            master_type_list == _undefined || master_type_list == null
                ? _instance.master_type_list
                : (master_type_list
                    as List<Query$FetchMasterTypes$master_type_list>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes master_type_list(
          Iterable<Query$FetchMasterTypes$master_type_list> Function(
                  Iterable<
                      CopyWith$Query$FetchMasterTypes$master_type_list<
                          Query$FetchMasterTypes$master_type_list>>)
              _fn) =>
      call(
          master_type_list: _fn(_instance.master_type_list
              .map((e) => CopyWith$Query$FetchMasterTypes$master_type_list(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchMasterTypes<TRes>
    implements CopyWith$Query$FetchMasterTypes<TRes> {
  _CopyWithStubImpl$Query$FetchMasterTypes(this._res);

  TRes _res;

  call({
    List<Query$FetchMasterTypes$master_type_list>? master_type_list,
    String? $__typename,
  }) =>
      _res;

  master_type_list(_fn) => _res;
}

const documentNodeQueryFetchMasterTypes = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FetchMasterTypes'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'master_type_list'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'label'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$FetchMasterTypes$master_type_list {
  Query$FetchMasterTypes$master_type_list({
    required this.id,
    required this.label,
    this.$__typename = 'MasterType',
  });

  factory Query$FetchMasterTypes$master_type_list.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$label = json['label'];
    final l$$__typename = json['__typename'];
    return Query$FetchMasterTypes$master_type_list(
      id: (l$id as String),
      label: (l$label as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String label;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$label = label;
    _resultData['label'] = l$label;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$label = label;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$label,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchMasterTypes$master_type_list ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMasterTypes$master_type_list
    on Query$FetchMasterTypes$master_type_list {
  CopyWith$Query$FetchMasterTypes$master_type_list<
          Query$FetchMasterTypes$master_type_list>
      get copyWith => CopyWith$Query$FetchMasterTypes$master_type_list(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMasterTypes$master_type_list<TRes> {
  factory CopyWith$Query$FetchMasterTypes$master_type_list(
    Query$FetchMasterTypes$master_type_list instance,
    TRes Function(Query$FetchMasterTypes$master_type_list) then,
  ) = _CopyWithImpl$Query$FetchMasterTypes$master_type_list;

  factory CopyWith$Query$FetchMasterTypes$master_type_list.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchMasterTypes$master_type_list;

  TRes call({
    String? id,
    String? label,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMasterTypes$master_type_list<TRes>
    implements CopyWith$Query$FetchMasterTypes$master_type_list<TRes> {
  _CopyWithImpl$Query$FetchMasterTypes$master_type_list(
    this._instance,
    this._then,
  );

  final Query$FetchMasterTypes$master_type_list _instance;

  final TRes Function(Query$FetchMasterTypes$master_type_list) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? label = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMasterTypes$master_type_list(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        label: label == _undefined || label == null
            ? _instance.label
            : (label as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMasterTypes$master_type_list<TRes>
    implements CopyWith$Query$FetchMasterTypes$master_type_list<TRes> {
  _CopyWithStubImpl$Query$FetchMasterTypes$master_type_list(this._res);

  TRes _res;

  call({
    String? id,
    String? label,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$SearchMasters {
  factory Variables$Query$SearchMasters({
    required String query,
    required List<String> masterTypeIds,
  }) =>
      Variables$Query$SearchMasters._({
        r'query': query,
        r'masterTypeIds': masterTypeIds,
      });

  Variables$Query$SearchMasters._(this._$data);

  factory Variables$Query$SearchMasters.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$query = data['query'];
    result$data['query'] = (l$query as String);
    final l$masterTypeIds = data['masterTypeIds'];
    result$data['masterTypeIds'] =
        (l$masterTypeIds as List<dynamic>).map((e) => (e as String)).toList();
    return Variables$Query$SearchMasters._(result$data);
  }

  Map<String, dynamic> _$data;

  String get query => (_$data['query'] as String);

  List<String> get masterTypeIds => (_$data['masterTypeIds'] as List<String>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$query = query;
    result$data['query'] = l$query;
    final l$masterTypeIds = masterTypeIds;
    result$data['masterTypeIds'] = l$masterTypeIds.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Variables$Query$SearchMasters<Variables$Query$SearchMasters>
      get copyWith => CopyWith$Variables$Query$SearchMasters(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SearchMasters ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$query = query;
    final lOther$query = other.query;
    if (l$query != lOther$query) {
      return false;
    }
    final l$masterTypeIds = masterTypeIds;
    final lOther$masterTypeIds = other.masterTypeIds;
    if (l$masterTypeIds.length != lOther$masterTypeIds.length) {
      return false;
    }
    for (int i = 0; i < l$masterTypeIds.length; i++) {
      final l$masterTypeIds$entry = l$masterTypeIds[i];
      final lOther$masterTypeIds$entry = lOther$masterTypeIds[i];
      if (l$masterTypeIds$entry != lOther$masterTypeIds$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$query = query;
    final l$masterTypeIds = masterTypeIds;
    return Object.hashAll([
      l$query,
      Object.hashAll(l$masterTypeIds.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Variables$Query$SearchMasters<TRes> {
  factory CopyWith$Variables$Query$SearchMasters(
    Variables$Query$SearchMasters instance,
    TRes Function(Variables$Query$SearchMasters) then,
  ) = _CopyWithImpl$Variables$Query$SearchMasters;

  factory CopyWith$Variables$Query$SearchMasters.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SearchMasters;

  TRes call({
    String? query,
    List<String>? masterTypeIds,
  });
}

class _CopyWithImpl$Variables$Query$SearchMasters<TRes>
    implements CopyWith$Variables$Query$SearchMasters<TRes> {
  _CopyWithImpl$Variables$Query$SearchMasters(
    this._instance,
    this._then,
  );

  final Variables$Query$SearchMasters _instance;

  final TRes Function(Variables$Query$SearchMasters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? query = _undefined,
    Object? masterTypeIds = _undefined,
  }) =>
      _then(Variables$Query$SearchMasters._({
        ..._instance._$data,
        if (query != _undefined && query != null) 'query': (query as String),
        if (masterTypeIds != _undefined && masterTypeIds != null)
          'masterTypeIds': (masterTypeIds as List<String>),
      }));
}

class _CopyWithStubImpl$Variables$Query$SearchMasters<TRes>
    implements CopyWith$Variables$Query$SearchMasters<TRes> {
  _CopyWithStubImpl$Variables$Query$SearchMasters(this._res);

  TRes _res;

  call({
    String? query,
    List<String>? masterTypeIds,
  }) =>
      _res;
}

class Query$SearchMasters {
  Query$SearchMasters({
    required this.search,
    this.$__typename = 'Query',
  });

  factory Query$SearchMasters.fromJson(Map<String, dynamic> json) {
    final l$search = json['search'];
    final l$$__typename = json['__typename'];
    return Query$SearchMasters(
      search: (l$search as List<dynamic>)
          .map((e) =>
              Query$SearchMasters$search.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SearchMasters$search> search;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$search = search;
    _resultData['search'] = l$search.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$search = search;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$search.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SearchMasters || runtimeType != other.runtimeType) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (l$search.length != lOther$search.length) {
      return false;
    }
    for (int i = 0; i < l$search.length; i++) {
      final l$search$entry = l$search[i];
      final lOther$search$entry = lOther$search[i];
      if (l$search$entry != lOther$search$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SearchMasters on Query$SearchMasters {
  CopyWith$Query$SearchMasters<Query$SearchMasters> get copyWith =>
      CopyWith$Query$SearchMasters(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SearchMasters<TRes> {
  factory CopyWith$Query$SearchMasters(
    Query$SearchMasters instance,
    TRes Function(Query$SearchMasters) then,
  ) = _CopyWithImpl$Query$SearchMasters;

  factory CopyWith$Query$SearchMasters.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchMasters;

  TRes call({
    List<Query$SearchMasters$search>? search,
    String? $__typename,
  });
  TRes search(
      Iterable<Query$SearchMasters$search> Function(
              Iterable<
                  CopyWith$Query$SearchMasters$search<
                      Query$SearchMasters$search>>)
          _fn);
}

class _CopyWithImpl$Query$SearchMasters<TRes>
    implements CopyWith$Query$SearchMasters<TRes> {
  _CopyWithImpl$Query$SearchMasters(
    this._instance,
    this._then,
  );

  final Query$SearchMasters _instance;

  final TRes Function(Query$SearchMasters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? search = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SearchMasters(
        search: search == _undefined || search == null
            ? _instance.search
            : (search as List<Query$SearchMasters$search>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes search(
          Iterable<Query$SearchMasters$search> Function(
                  Iterable<
                      CopyWith$Query$SearchMasters$search<
                          Query$SearchMasters$search>>)
              _fn) =>
      call(
          search: _fn(
              _instance.search.map((e) => CopyWith$Query$SearchMasters$search(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$SearchMasters<TRes>
    implements CopyWith$Query$SearchMasters<TRes> {
  _CopyWithStubImpl$Query$SearchMasters(this._res);

  TRes _res;

  call({
    List<Query$SearchMasters$search>? search,
    String? $__typename,
  }) =>
      _res;

  search(_fn) => _res;
}

const documentNodeQuerySearchMasters = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SearchMasters'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'query')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'masterTypeIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'search'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'query'),
            value: VariableNode(name: NameNode(value: 'query')),
          ),
          ArgumentNode(
            name: NameNode(value: 'masterTypeIds'),
            value: VariableNode(name: NameNode(value: 'masterTypeIds')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'masterName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'masterNameKana'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'masterTypeId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$SearchMasters$search {
  Query$SearchMasters$search({
    required this.id,
    required this.masterName,
    required this.masterNameKana,
    required this.masterTypeId,
    this.$__typename = 'Master',
  });

  factory Query$SearchMasters$search.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$masterName = json['masterName'];
    final l$masterNameKana = json['masterNameKana'];
    final l$masterTypeId = json['masterTypeId'];
    final l$$__typename = json['__typename'];
    return Query$SearchMasters$search(
      id: (l$id as String),
      masterName: (l$masterName as String),
      masterNameKana: (l$masterNameKana as String),
      masterTypeId: (l$masterTypeId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String masterName;

  final String masterNameKana;

  final String masterTypeId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$masterName = masterName;
    _resultData['masterName'] = l$masterName;
    final l$masterNameKana = masterNameKana;
    _resultData['masterNameKana'] = l$masterNameKana;
    final l$masterTypeId = masterTypeId;
    _resultData['masterTypeId'] = l$masterTypeId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$masterName = masterName;
    final l$masterNameKana = masterNameKana;
    final l$masterTypeId = masterTypeId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$masterName,
      l$masterNameKana,
      l$masterTypeId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SearchMasters$search ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$masterName = masterName;
    final lOther$masterName = other.masterName;
    if (l$masterName != lOther$masterName) {
      return false;
    }
    final l$masterNameKana = masterNameKana;
    final lOther$masterNameKana = other.masterNameKana;
    if (l$masterNameKana != lOther$masterNameKana) {
      return false;
    }
    final l$masterTypeId = masterTypeId;
    final lOther$masterTypeId = other.masterTypeId;
    if (l$masterTypeId != lOther$masterTypeId) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SearchMasters$search
    on Query$SearchMasters$search {
  CopyWith$Query$SearchMasters$search<Query$SearchMasters$search>
      get copyWith => CopyWith$Query$SearchMasters$search(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SearchMasters$search<TRes> {
  factory CopyWith$Query$SearchMasters$search(
    Query$SearchMasters$search instance,
    TRes Function(Query$SearchMasters$search) then,
  ) = _CopyWithImpl$Query$SearchMasters$search;

  factory CopyWith$Query$SearchMasters$search.stub(TRes res) =
      _CopyWithStubImpl$Query$SearchMasters$search;

  TRes call({
    String? id,
    String? masterName,
    String? masterNameKana,
    String? masterTypeId,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SearchMasters$search<TRes>
    implements CopyWith$Query$SearchMasters$search<TRes> {
  _CopyWithImpl$Query$SearchMasters$search(
    this._instance,
    this._then,
  );

  final Query$SearchMasters$search _instance;

  final TRes Function(Query$SearchMasters$search) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? masterName = _undefined,
    Object? masterNameKana = _undefined,
    Object? masterTypeId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SearchMasters$search(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        masterName: masterName == _undefined || masterName == null
            ? _instance.masterName
            : (masterName as String),
        masterNameKana: masterNameKana == _undefined || masterNameKana == null
            ? _instance.masterNameKana
            : (masterNameKana as String),
        masterTypeId: masterTypeId == _undefined || masterTypeId == null
            ? _instance.masterTypeId
            : (masterTypeId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SearchMasters$search<TRes>
    implements CopyWith$Query$SearchMasters$search<TRes> {
  _CopyWithStubImpl$Query$SearchMasters$search(this._res);

  TRes _res;

  call({
    String? id,
    String? masterName,
    String? masterNameKana,
    String? masterTypeId,
    String? $__typename,
  }) =>
      _res;
}
