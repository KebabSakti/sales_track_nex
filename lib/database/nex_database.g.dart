// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nex_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String userId;
  final String truckId;
  final String name;
  final String username;
  final String type;
  final String token;
  User(
      {@required this.userId,
      this.truckId,
      @required this.name,
      @required this.username,
      @required this.type,
      @required this.token});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      truckId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}truck_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || truckId != null) {
      map['truck_id'] = Variable<String>(truckId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      truckId: truckId == null && nullToAbsent
          ? const Value.absent()
          : Value(truckId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<String>(json['userId']),
      truckId: serializer.fromJson<String>(json['truckId']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      type: serializer.fromJson<String>(json['type']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'truckId': serializer.toJson<String>(truckId),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'type': serializer.toJson<String>(type),
      'token': serializer.toJson<String>(token),
    };
  }

  User copyWith(
          {String userId,
          String truckId,
          String name,
          String username,
          String type,
          String token}) =>
      User(
        userId: userId ?? this.userId,
        truckId: truckId ?? this.truckId,
        name: name ?? this.name,
        username: username ?? this.username,
        type: type ?? this.type,
        token: token ?? this.token,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('truckId: $truckId, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('type: $type, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      userId.hashCode,
      $mrjc(
          truckId.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  username.hashCode, $mrjc(type.hashCode, token.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.truckId == this.truckId &&
          other.name == this.name &&
          other.username == this.username &&
          other.type == this.type &&
          other.token == this.token);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> userId;
  final Value<String> truckId;
  final Value<String> name;
  final Value<String> username;
  final Value<String> type;
  final Value<String> token;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.truckId = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.type = const Value.absent(),
    this.token = const Value.absent(),
  });
  UsersCompanion.insert({
    @required String userId,
    this.truckId = const Value.absent(),
    @required String name,
    @required String username,
    @required String type,
    @required String token,
  })  : userId = Value(userId),
        name = Value(name),
        username = Value(username),
        type = Value(type),
        token = Value(token);
  static Insertable<User> custom({
    Expression<String> userId,
    Expression<String> truckId,
    Expression<String> name,
    Expression<String> username,
    Expression<String> type,
    Expression<String> token,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (truckId != null) 'truck_id': truckId,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (type != null) 'type': type,
      if (token != null) 'token': token,
    });
  }

  UsersCompanion copyWith(
      {Value<String> userId,
      Value<String> truckId,
      Value<String> name,
      Value<String> username,
      Value<String> type,
      Value<String> token}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      truckId: truckId ?? this.truckId,
      name: name ?? this.name,
      username: username ?? this.username,
      type: type ?? this.type,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (truckId.present) {
      map['truck_id'] = Variable<String>(truckId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('truckId: $truckId, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('type: $type, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _truckIdMeta = const VerificationMeta('truckId');
  GeneratedTextColumn _truckId;
  @override
  GeneratedTextColumn get truckId => _truckId ??= _constructTruckId();
  GeneratedTextColumn _constructTruckId() {
    return GeneratedTextColumn(
      'truck_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  GeneratedTextColumn _token;
  @override
  GeneratedTextColumn get token => _token ??= _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [userId, truckId, name, username, type, token];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('truck_id')) {
      context.handle(_truckIdMeta,
          truckId.isAcceptableOrUnknown(data['truck_id'], _truckIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token'], _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class ProdukData extends DataClass implements Insertable<ProdukData> {
  final String produkId;
  final String kode;
  final String nama;
  final String harga;
  final int stok;
  final bool aktif;
  final String createdAt;
  final String updatedAt;
  ProdukData(
      {@required this.produkId,
      @required this.kode,
      @required this.nama,
      @required this.harga,
      @required this.stok,
      @required this.aktif,
      @required this.createdAt,
      @required this.updatedAt});
  factory ProdukData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ProdukData(
      produkId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}produk_id']),
      kode: stringType.mapFromDatabaseResponse(data['${effectivePrefix}kode']),
      nama: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nama']),
      harga:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}harga']),
      stok: intType.mapFromDatabaseResponse(data['${effectivePrefix}stok']),
      aktif: boolType.mapFromDatabaseResponse(data['${effectivePrefix}aktif']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || produkId != null) {
      map['produk_id'] = Variable<String>(produkId);
    }
    if (!nullToAbsent || kode != null) {
      map['kode'] = Variable<String>(kode);
    }
    if (!nullToAbsent || nama != null) {
      map['nama'] = Variable<String>(nama);
    }
    if (!nullToAbsent || harga != null) {
      map['harga'] = Variable<String>(harga);
    }
    if (!nullToAbsent || stok != null) {
      map['stok'] = Variable<int>(stok);
    }
    if (!nullToAbsent || aktif != null) {
      map['aktif'] = Variable<bool>(aktif);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  ProdukCompanion toCompanion(bool nullToAbsent) {
    return ProdukCompanion(
      produkId: produkId == null && nullToAbsent
          ? const Value.absent()
          : Value(produkId),
      kode: kode == null && nullToAbsent ? const Value.absent() : Value(kode),
      nama: nama == null && nullToAbsent ? const Value.absent() : Value(nama),
      harga:
          harga == null && nullToAbsent ? const Value.absent() : Value(harga),
      stok: stok == null && nullToAbsent ? const Value.absent() : Value(stok),
      aktif:
          aktif == null && nullToAbsent ? const Value.absent() : Value(aktif),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ProdukData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProdukData(
      produkId: serializer.fromJson<String>(json['produkId']),
      kode: serializer.fromJson<String>(json['kode']),
      nama: serializer.fromJson<String>(json['nama']),
      harga: serializer.fromJson<String>(json['harga']),
      stok: serializer.fromJson<int>(json['stok']),
      aktif: serializer.fromJson<bool>(json['aktif']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'produkId': serializer.toJson<String>(produkId),
      'kode': serializer.toJson<String>(kode),
      'nama': serializer.toJson<String>(nama),
      'harga': serializer.toJson<String>(harga),
      'stok': serializer.toJson<int>(stok),
      'aktif': serializer.toJson<bool>(aktif),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  ProdukData copyWith(
          {String produkId,
          String kode,
          String nama,
          String harga,
          int stok,
          bool aktif,
          String createdAt,
          String updatedAt}) =>
      ProdukData(
        produkId: produkId ?? this.produkId,
        kode: kode ?? this.kode,
        nama: nama ?? this.nama,
        harga: harga ?? this.harga,
        stok: stok ?? this.stok,
        aktif: aktif ?? this.aktif,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ProdukData(')
          ..write('produkId: $produkId, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('harga: $harga, ')
          ..write('stok: $stok, ')
          ..write('aktif: $aktif, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      produkId.hashCode,
      $mrjc(
          kode.hashCode,
          $mrjc(
              nama.hashCode,
              $mrjc(
                  harga.hashCode,
                  $mrjc(
                      stok.hashCode,
                      $mrjc(aktif.hashCode,
                          $mrjc(createdAt.hashCode, updatedAt.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProdukData &&
          other.produkId == this.produkId &&
          other.kode == this.kode &&
          other.nama == this.nama &&
          other.harga == this.harga &&
          other.stok == this.stok &&
          other.aktif == this.aktif &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProdukCompanion extends UpdateCompanion<ProdukData> {
  final Value<String> produkId;
  final Value<String> kode;
  final Value<String> nama;
  final Value<String> harga;
  final Value<int> stok;
  final Value<bool> aktif;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const ProdukCompanion({
    this.produkId = const Value.absent(),
    this.kode = const Value.absent(),
    this.nama = const Value.absent(),
    this.harga = const Value.absent(),
    this.stok = const Value.absent(),
    this.aktif = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProdukCompanion.insert({
    @required String produkId,
    @required String kode,
    @required String nama,
    @required String harga,
    @required int stok,
    this.aktif = const Value.absent(),
    @required String createdAt,
    @required String updatedAt,
  })  : produkId = Value(produkId),
        kode = Value(kode),
        nama = Value(nama),
        harga = Value(harga),
        stok = Value(stok),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProdukData> custom({
    Expression<String> produkId,
    Expression<String> kode,
    Expression<String> nama,
    Expression<String> harga,
    Expression<int> stok,
    Expression<bool> aktif,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (produkId != null) 'produk_id': produkId,
      if (kode != null) 'kode': kode,
      if (nama != null) 'nama': nama,
      if (harga != null) 'harga': harga,
      if (stok != null) 'stok': stok,
      if (aktif != null) 'aktif': aktif,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProdukCompanion copyWith(
      {Value<String> produkId,
      Value<String> kode,
      Value<String> nama,
      Value<String> harga,
      Value<int> stok,
      Value<bool> aktif,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return ProdukCompanion(
      produkId: produkId ?? this.produkId,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      stok: stok ?? this.stok,
      aktif: aktif ?? this.aktif,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (produkId.present) {
      map['produk_id'] = Variable<String>(produkId.value);
    }
    if (kode.present) {
      map['kode'] = Variable<String>(kode.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (harga.present) {
      map['harga'] = Variable<String>(harga.value);
    }
    if (stok.present) {
      map['stok'] = Variable<int>(stok.value);
    }
    if (aktif.present) {
      map['aktif'] = Variable<bool>(aktif.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProdukCompanion(')
          ..write('produkId: $produkId, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('harga: $harga, ')
          ..write('stok: $stok, ')
          ..write('aktif: $aktif, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProdukTable extends Produk with TableInfo<$ProdukTable, ProdukData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProdukTable(this._db, [this._alias]);
  final VerificationMeta _produkIdMeta = const VerificationMeta('produkId');
  GeneratedTextColumn _produkId;
  @override
  GeneratedTextColumn get produkId => _produkId ??= _constructProdukId();
  GeneratedTextColumn _constructProdukId() {
    return GeneratedTextColumn(
      'produk_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _kodeMeta = const VerificationMeta('kode');
  GeneratedTextColumn _kode;
  @override
  GeneratedTextColumn get kode => _kode ??= _constructKode();
  GeneratedTextColumn _constructKode() {
    return GeneratedTextColumn(
      'kode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _namaMeta = const VerificationMeta('nama');
  GeneratedTextColumn _nama;
  @override
  GeneratedTextColumn get nama => _nama ??= _constructNama();
  GeneratedTextColumn _constructNama() {
    return GeneratedTextColumn(
      'nama',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hargaMeta = const VerificationMeta('harga');
  GeneratedTextColumn _harga;
  @override
  GeneratedTextColumn get harga => _harga ??= _constructHarga();
  GeneratedTextColumn _constructHarga() {
    return GeneratedTextColumn(
      'harga',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stokMeta = const VerificationMeta('stok');
  GeneratedIntColumn _stok;
  @override
  GeneratedIntColumn get stok => _stok ??= _constructStok();
  GeneratedIntColumn _constructStok() {
    return GeneratedIntColumn(
      'stok',
      $tableName,
      false,
    );
  }

  final VerificationMeta _aktifMeta = const VerificationMeta('aktif');
  GeneratedBoolColumn _aktif;
  @override
  GeneratedBoolColumn get aktif => _aktif ??= _constructAktif();
  GeneratedBoolColumn _constructAktif() {
    return GeneratedBoolColumn('aktif', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [produkId, kode, nama, harga, stok, aktif, createdAt, updatedAt];
  @override
  $ProdukTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'produk';
  @override
  final String actualTableName = 'produk';
  @override
  VerificationContext validateIntegrity(Insertable<ProdukData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('produk_id')) {
      context.handle(_produkIdMeta,
          produkId.isAcceptableOrUnknown(data['produk_id'], _produkIdMeta));
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('kode')) {
      context.handle(
          _kodeMeta, kode.isAcceptableOrUnknown(data['kode'], _kodeMeta));
    } else if (isInserting) {
      context.missing(_kodeMeta);
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama'], _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('harga')) {
      context.handle(
          _hargaMeta, harga.isAcceptableOrUnknown(data['harga'], _hargaMeta));
    } else if (isInserting) {
      context.missing(_hargaMeta);
    }
    if (data.containsKey('stok')) {
      context.handle(
          _stokMeta, stok.isAcceptableOrUnknown(data['stok'], _stokMeta));
    } else if (isInserting) {
      context.missing(_stokMeta);
    }
    if (data.containsKey('aktif')) {
      context.handle(
          _aktifMeta, aktif.isAcceptableOrUnknown(data['aktif'], _aktifMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {produkId};
  @override
  ProdukData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProdukData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProdukTable createAlias(String alias) {
    return $ProdukTable(_db, alias);
  }
}

class TrukData extends DataClass implements Insertable<TrukData> {
  final String trukId;
  final String nomorPlat;
  final String brand;
  final String createdAt;
  final String updatedAt;
  TrukData(
      {@required this.trukId,
      @required this.nomorPlat,
      @required this.brand,
      @required this.createdAt,
      @required this.updatedAt});
  factory TrukData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return TrukData(
      trukId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}truk_id']),
      nomorPlat: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomor_plat']),
      brand:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}brand']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || trukId != null) {
      map['truk_id'] = Variable<String>(trukId);
    }
    if (!nullToAbsent || nomorPlat != null) {
      map['nomor_plat'] = Variable<String>(nomorPlat);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  TrukCompanion toCompanion(bool nullToAbsent) {
    return TrukCompanion(
      trukId:
          trukId == null && nullToAbsent ? const Value.absent() : Value(trukId),
      nomorPlat: nomorPlat == null && nullToAbsent
          ? const Value.absent()
          : Value(nomorPlat),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TrukData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TrukData(
      trukId: serializer.fromJson<String>(json['trukId']),
      nomorPlat: serializer.fromJson<String>(json['nomorPlat']),
      brand: serializer.fromJson<String>(json['brand']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trukId': serializer.toJson<String>(trukId),
      'nomorPlat': serializer.toJson<String>(nomorPlat),
      'brand': serializer.toJson<String>(brand),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  TrukData copyWith(
          {String trukId,
          String nomorPlat,
          String brand,
          String createdAt,
          String updatedAt}) =>
      TrukData(
        trukId: trukId ?? this.trukId,
        nomorPlat: nomorPlat ?? this.nomorPlat,
        brand: brand ?? this.brand,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TrukData(')
          ..write('trukId: $trukId, ')
          ..write('nomorPlat: $nomorPlat, ')
          ..write('brand: $brand, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      trukId.hashCode,
      $mrjc(
          nomorPlat.hashCode,
          $mrjc(
              brand.hashCode, $mrjc(createdAt.hashCode, updatedAt.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TrukData &&
          other.trukId == this.trukId &&
          other.nomorPlat == this.nomorPlat &&
          other.brand == this.brand &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TrukCompanion extends UpdateCompanion<TrukData> {
  final Value<String> trukId;
  final Value<String> nomorPlat;
  final Value<String> brand;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const TrukCompanion({
    this.trukId = const Value.absent(),
    this.nomorPlat = const Value.absent(),
    this.brand = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TrukCompanion.insert({
    @required String trukId,
    @required String nomorPlat,
    @required String brand,
    @required String createdAt,
    @required String updatedAt,
  })  : trukId = Value(trukId),
        nomorPlat = Value(nomorPlat),
        brand = Value(brand),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrukData> custom({
    Expression<String> trukId,
    Expression<String> nomorPlat,
    Expression<String> brand,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (trukId != null) 'truk_id': trukId,
      if (nomorPlat != null) 'nomor_plat': nomorPlat,
      if (brand != null) 'brand': brand,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TrukCompanion copyWith(
      {Value<String> trukId,
      Value<String> nomorPlat,
      Value<String> brand,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return TrukCompanion(
      trukId: trukId ?? this.trukId,
      nomorPlat: nomorPlat ?? this.nomorPlat,
      brand: brand ?? this.brand,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trukId.present) {
      map['truk_id'] = Variable<String>(trukId.value);
    }
    if (nomorPlat.present) {
      map['nomor_plat'] = Variable<String>(nomorPlat.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrukCompanion(')
          ..write('trukId: $trukId, ')
          ..write('nomorPlat: $nomorPlat, ')
          ..write('brand: $brand, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TrukTable extends Truk with TableInfo<$TrukTable, TrukData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TrukTable(this._db, [this._alias]);
  final VerificationMeta _trukIdMeta = const VerificationMeta('trukId');
  GeneratedTextColumn _trukId;
  @override
  GeneratedTextColumn get trukId => _trukId ??= _constructTrukId();
  GeneratedTextColumn _constructTrukId() {
    return GeneratedTextColumn(
      'truk_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomorPlatMeta = const VerificationMeta('nomorPlat');
  GeneratedTextColumn _nomorPlat;
  @override
  GeneratedTextColumn get nomorPlat => _nomorPlat ??= _constructNomorPlat();
  GeneratedTextColumn _constructNomorPlat() {
    return GeneratedTextColumn(
      'nomor_plat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _brandMeta = const VerificationMeta('brand');
  GeneratedTextColumn _brand;
  @override
  GeneratedTextColumn get brand => _brand ??= _constructBrand();
  GeneratedTextColumn _constructBrand() {
    return GeneratedTextColumn(
      'brand',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [trukId, nomorPlat, brand, createdAt, updatedAt];
  @override
  $TrukTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'truk';
  @override
  final String actualTableName = 'truk';
  @override
  VerificationContext validateIntegrity(Insertable<TrukData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('truk_id')) {
      context.handle(_trukIdMeta,
          trukId.isAcceptableOrUnknown(data['truk_id'], _trukIdMeta));
    } else if (isInserting) {
      context.missing(_trukIdMeta);
    }
    if (data.containsKey('nomor_plat')) {
      context.handle(_nomorPlatMeta,
          nomorPlat.isAcceptableOrUnknown(data['nomor_plat'], _nomorPlatMeta));
    } else if (isInserting) {
      context.missing(_nomorPlatMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand'], _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trukId};
  @override
  TrukData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TrukData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TrukTable createAlias(String alias) {
    return $TrukTable(_db, alias);
  }
}

class StokData extends DataClass implements Insertable<StokData> {
  final String trukId;
  final String stokId;
  final String produkId;
  final int quantity;
  final String createdAt;
  final String updatedAt;
  StokData(
      {@required this.trukId,
      @required this.stokId,
      @required this.produkId,
      @required this.quantity,
      @required this.createdAt,
      @required this.updatedAt});
  factory StokData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return StokData(
      trukId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}truk_id']),
      stokId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}stok_id']),
      produkId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}produk_id']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || trukId != null) {
      map['truk_id'] = Variable<String>(trukId);
    }
    if (!nullToAbsent || stokId != null) {
      map['stok_id'] = Variable<String>(stokId);
    }
    if (!nullToAbsent || produkId != null) {
      map['produk_id'] = Variable<String>(produkId);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  StokCompanion toCompanion(bool nullToAbsent) {
    return StokCompanion(
      trukId:
          trukId == null && nullToAbsent ? const Value.absent() : Value(trukId),
      stokId:
          stokId == null && nullToAbsent ? const Value.absent() : Value(stokId),
      produkId: produkId == null && nullToAbsent
          ? const Value.absent()
          : Value(produkId),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory StokData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StokData(
      trukId: serializer.fromJson<String>(json['trukId']),
      stokId: serializer.fromJson<String>(json['stokId']),
      produkId: serializer.fromJson<String>(json['produkId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trukId': serializer.toJson<String>(trukId),
      'stokId': serializer.toJson<String>(stokId),
      'produkId': serializer.toJson<String>(produkId),
      'quantity': serializer.toJson<int>(quantity),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  StokData copyWith(
          {String trukId,
          String stokId,
          String produkId,
          int quantity,
          String createdAt,
          String updatedAt}) =>
      StokData(
        trukId: trukId ?? this.trukId,
        stokId: stokId ?? this.stokId,
        produkId: produkId ?? this.produkId,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('StokData(')
          ..write('trukId: $trukId, ')
          ..write('stokId: $stokId, ')
          ..write('produkId: $produkId, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      trukId.hashCode,
      $mrjc(
          stokId.hashCode,
          $mrjc(
              produkId.hashCode,
              $mrjc(quantity.hashCode,
                  $mrjc(createdAt.hashCode, updatedAt.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StokData &&
          other.trukId == this.trukId &&
          other.stokId == this.stokId &&
          other.produkId == this.produkId &&
          other.quantity == this.quantity &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StokCompanion extends UpdateCompanion<StokData> {
  final Value<String> trukId;
  final Value<String> stokId;
  final Value<String> produkId;
  final Value<int> quantity;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const StokCompanion({
    this.trukId = const Value.absent(),
    this.stokId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StokCompanion.insert({
    @required String trukId,
    @required String stokId,
    @required String produkId,
    @required int quantity,
    @required String createdAt,
    @required String updatedAt,
  })  : trukId = Value(trukId),
        stokId = Value(stokId),
        produkId = Value(produkId),
        quantity = Value(quantity),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<StokData> custom({
    Expression<String> trukId,
    Expression<String> stokId,
    Expression<String> produkId,
    Expression<int> quantity,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (trukId != null) 'truk_id': trukId,
      if (stokId != null) 'stok_id': stokId,
      if (produkId != null) 'produk_id': produkId,
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StokCompanion copyWith(
      {Value<String> trukId,
      Value<String> stokId,
      Value<String> produkId,
      Value<int> quantity,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return StokCompanion(
      trukId: trukId ?? this.trukId,
      stokId: stokId ?? this.stokId,
      produkId: produkId ?? this.produkId,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trukId.present) {
      map['truk_id'] = Variable<String>(trukId.value);
    }
    if (stokId.present) {
      map['stok_id'] = Variable<String>(stokId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<String>(produkId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StokCompanion(')
          ..write('trukId: $trukId, ')
          ..write('stokId: $stokId, ')
          ..write('produkId: $produkId, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StokTable extends Stok with TableInfo<$StokTable, StokData> {
  final GeneratedDatabase _db;
  final String _alias;
  $StokTable(this._db, [this._alias]);
  final VerificationMeta _trukIdMeta = const VerificationMeta('trukId');
  GeneratedTextColumn _trukId;
  @override
  GeneratedTextColumn get trukId => _trukId ??= _constructTrukId();
  GeneratedTextColumn _constructTrukId() {
    return GeneratedTextColumn(
      'truk_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stokIdMeta = const VerificationMeta('stokId');
  GeneratedTextColumn _stokId;
  @override
  GeneratedTextColumn get stokId => _stokId ??= _constructStokId();
  GeneratedTextColumn _constructStokId() {
    return GeneratedTextColumn(
      'stok_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _produkIdMeta = const VerificationMeta('produkId');
  GeneratedTextColumn _produkId;
  @override
  GeneratedTextColumn get produkId => _produkId ??= _constructProdukId();
  GeneratedTextColumn _constructProdukId() {
    return GeneratedTextColumn(
      'produk_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [trukId, stokId, produkId, quantity, createdAt, updatedAt];
  @override
  $StokTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'stok';
  @override
  final String actualTableName = 'stok';
  @override
  VerificationContext validateIntegrity(Insertable<StokData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('truk_id')) {
      context.handle(_trukIdMeta,
          trukId.isAcceptableOrUnknown(data['truk_id'], _trukIdMeta));
    } else if (isInserting) {
      context.missing(_trukIdMeta);
    }
    if (data.containsKey('stok_id')) {
      context.handle(_stokIdMeta,
          stokId.isAcceptableOrUnknown(data['stok_id'], _stokIdMeta));
    } else if (isInserting) {
      context.missing(_stokIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(_produkIdMeta,
          produkId.isAcceptableOrUnknown(data['produk_id'], _produkIdMeta));
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stokId};
  @override
  StokData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StokData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StokTable createAlias(String alias) {
    return $StokTable(_db, alias);
  }
}

class OutletData extends DataClass implements Insertable<OutletData> {
  final String outletId;
  final String barcode;
  final String user;
  final String outletName;
  final String address;
  final String phone;
  final String owner;
  final String lat;
  final String lng;
  final String geofence;
  final String picture;
  final String createdAt;
  final String updatedAt;
  OutletData(
      {@required this.outletId,
      @required this.barcode,
      @required this.user,
      @required this.outletName,
      this.address,
      this.phone,
      this.owner,
      @required this.lat,
      @required this.lng,
      this.geofence,
      this.picture,
      @required this.createdAt,
      @required this.updatedAt});
  factory OutletData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return OutletData(
      outletId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}outlet_id']),
      barcode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}barcode']),
      user: stringType.mapFromDatabaseResponse(data['${effectivePrefix}user']),
      outletName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}outlet_name']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      owner:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}owner']),
      lat: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lng: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lng']),
      geofence: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}geofence']),
      picture:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || outletId != null) {
      map['outlet_id'] = Variable<String>(outletId);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(user);
    }
    if (!nullToAbsent || outletName != null) {
      map['outlet_name'] = Variable<String>(outletName);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || owner != null) {
      map['owner'] = Variable<String>(owner);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<String>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<String>(lng);
    }
    if (!nullToAbsent || geofence != null) {
      map['geofence'] = Variable<String>(geofence);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String>(picture);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  OutletCompanion toCompanion(bool nullToAbsent) {
    return OutletCompanion(
      outletId: outletId == null && nullToAbsent
          ? const Value.absent()
          : Value(outletId),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
      outletName: outletName == null && nullToAbsent
          ? const Value.absent()
          : Value(outletName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      owner:
          owner == null && nullToAbsent ? const Value.absent() : Value(owner),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      geofence: geofence == null && nullToAbsent
          ? const Value.absent()
          : Value(geofence),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory OutletData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OutletData(
      outletId: serializer.fromJson<String>(json['outletId']),
      barcode: serializer.fromJson<String>(json['barcode']),
      user: serializer.fromJson<String>(json['user']),
      outletName: serializer.fromJson<String>(json['outletName']),
      address: serializer.fromJson<String>(json['address']),
      phone: serializer.fromJson<String>(json['phone']),
      owner: serializer.fromJson<String>(json['owner']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
      geofence: serializer.fromJson<String>(json['geofence']),
      picture: serializer.fromJson<String>(json['picture']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'outletId': serializer.toJson<String>(outletId),
      'barcode': serializer.toJson<String>(barcode),
      'user': serializer.toJson<String>(user),
      'outletName': serializer.toJson<String>(outletName),
      'address': serializer.toJson<String>(address),
      'phone': serializer.toJson<String>(phone),
      'owner': serializer.toJson<String>(owner),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
      'geofence': serializer.toJson<String>(geofence),
      'picture': serializer.toJson<String>(picture),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  OutletData copyWith(
          {String outletId,
          String barcode,
          String user,
          String outletName,
          String address,
          String phone,
          String owner,
          String lat,
          String lng,
          String geofence,
          String picture,
          String createdAt,
          String updatedAt}) =>
      OutletData(
        outletId: outletId ?? this.outletId,
        barcode: barcode ?? this.barcode,
        user: user ?? this.user,
        outletName: outletName ?? this.outletName,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        owner: owner ?? this.owner,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        geofence: geofence ?? this.geofence,
        picture: picture ?? this.picture,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('OutletData(')
          ..write('outletId: $outletId, ')
          ..write('barcode: $barcode, ')
          ..write('user: $user, ')
          ..write('outletName: $outletName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('owner: $owner, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('geofence: $geofence, ')
          ..write('picture: $picture, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      outletId.hashCode,
      $mrjc(
          barcode.hashCode,
          $mrjc(
              user.hashCode,
              $mrjc(
                  outletName.hashCode,
                  $mrjc(
                      address.hashCode,
                      $mrjc(
                          phone.hashCode,
                          $mrjc(
                              owner.hashCode,
                              $mrjc(
                                  lat.hashCode,
                                  $mrjc(
                                      lng.hashCode,
                                      $mrjc(
                                          geofence.hashCode,
                                          $mrjc(
                                              picture.hashCode,
                                              $mrjc(
                                                  createdAt.hashCode,
                                                  updatedAt
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OutletData &&
          other.outletId == this.outletId &&
          other.barcode == this.barcode &&
          other.user == this.user &&
          other.outletName == this.outletName &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.owner == this.owner &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.geofence == this.geofence &&
          other.picture == this.picture &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OutletCompanion extends UpdateCompanion<OutletData> {
  final Value<String> outletId;
  final Value<String> barcode;
  final Value<String> user;
  final Value<String> outletName;
  final Value<String> address;
  final Value<String> phone;
  final Value<String> owner;
  final Value<String> lat;
  final Value<String> lng;
  final Value<String> geofence;
  final Value<String> picture;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const OutletCompanion({
    this.outletId = const Value.absent(),
    this.barcode = const Value.absent(),
    this.user = const Value.absent(),
    this.outletName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.owner = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.geofence = const Value.absent(),
    this.picture = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  OutletCompanion.insert({
    @required String outletId,
    @required String barcode,
    @required String user,
    @required String outletName,
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.owner = const Value.absent(),
    @required String lat,
    @required String lng,
    this.geofence = const Value.absent(),
    this.picture = const Value.absent(),
    @required String createdAt,
    @required String updatedAt,
  })  : outletId = Value(outletId),
        barcode = Value(barcode),
        user = Value(user),
        outletName = Value(outletName),
        lat = Value(lat),
        lng = Value(lng),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OutletData> custom({
    Expression<String> outletId,
    Expression<String> barcode,
    Expression<String> user,
    Expression<String> outletName,
    Expression<String> address,
    Expression<String> phone,
    Expression<String> owner,
    Expression<String> lat,
    Expression<String> lng,
    Expression<String> geofence,
    Expression<String> picture,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (outletId != null) 'outlet_id': outletId,
      if (barcode != null) 'barcode': barcode,
      if (user != null) 'user': user,
      if (outletName != null) 'outlet_name': outletName,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (owner != null) 'owner': owner,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (geofence != null) 'geofence': geofence,
      if (picture != null) 'picture': picture,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  OutletCompanion copyWith(
      {Value<String> outletId,
      Value<String> barcode,
      Value<String> user,
      Value<String> outletName,
      Value<String> address,
      Value<String> phone,
      Value<String> owner,
      Value<String> lat,
      Value<String> lng,
      Value<String> geofence,
      Value<String> picture,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return OutletCompanion(
      outletId: outletId ?? this.outletId,
      barcode: barcode ?? this.barcode,
      user: user ?? this.user,
      outletName: outletName ?? this.outletName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      owner: owner ?? this.owner,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      geofence: geofence ?? this.geofence,
      picture: picture ?? this.picture,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (outletId.present) {
      map['outlet_id'] = Variable<String>(outletId.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (outletName.present) {
      map['outlet_name'] = Variable<String>(outletName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<String>(lng.value);
    }
    if (geofence.present) {
      map['geofence'] = Variable<String>(geofence.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutletCompanion(')
          ..write('outletId: $outletId, ')
          ..write('barcode: $barcode, ')
          ..write('user: $user, ')
          ..write('outletName: $outletName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('owner: $owner, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('geofence: $geofence, ')
          ..write('picture: $picture, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $OutletTable extends Outlet with TableInfo<$OutletTable, OutletData> {
  final GeneratedDatabase _db;
  final String _alias;
  $OutletTable(this._db, [this._alias]);
  final VerificationMeta _outletIdMeta = const VerificationMeta('outletId');
  GeneratedTextColumn _outletId;
  @override
  GeneratedTextColumn get outletId => _outletId ??= _constructOutletId();
  GeneratedTextColumn _constructOutletId() {
    return GeneratedTextColumn(
      'outlet_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  GeneratedTextColumn _barcode;
  @override
  GeneratedTextColumn get barcode => _barcode ??= _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn(
      'barcode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  GeneratedTextColumn _user;
  @override
  GeneratedTextColumn get user => _user ??= _constructUser();
  GeneratedTextColumn _constructUser() {
    return GeneratedTextColumn(
      'user',
      $tableName,
      false,
    );
  }

  final VerificationMeta _outletNameMeta = const VerificationMeta('outletName');
  GeneratedTextColumn _outletName;
  @override
  GeneratedTextColumn get outletName => _outletName ??= _constructOutletName();
  GeneratedTextColumn _constructOutletName() {
    return GeneratedTextColumn(
      'outlet_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ownerMeta = const VerificationMeta('owner');
  GeneratedTextColumn _owner;
  @override
  GeneratedTextColumn get owner => _owner ??= _constructOwner();
  GeneratedTextColumn _constructOwner() {
    return GeneratedTextColumn(
      'owner',
      $tableName,
      true,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedTextColumn _lat;
  @override
  GeneratedTextColumn get lat => _lat ??= _constructLat();
  GeneratedTextColumn _constructLat() {
    return GeneratedTextColumn(
      'lat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  GeneratedTextColumn _lng;
  @override
  GeneratedTextColumn get lng => _lng ??= _constructLng();
  GeneratedTextColumn _constructLng() {
    return GeneratedTextColumn(
      'lng',
      $tableName,
      false,
    );
  }

  final VerificationMeta _geofenceMeta = const VerificationMeta('geofence');
  GeneratedTextColumn _geofence;
  @override
  GeneratedTextColumn get geofence => _geofence ??= _constructGeofence();
  GeneratedTextColumn _constructGeofence() {
    return GeneratedTextColumn(
      'geofence',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  GeneratedTextColumn _picture;
  @override
  GeneratedTextColumn get picture => _picture ??= _constructPicture();
  GeneratedTextColumn _constructPicture() {
    return GeneratedTextColumn(
      'picture',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        outletId,
        barcode,
        user,
        outletName,
        address,
        phone,
        owner,
        lat,
        lng,
        geofence,
        picture,
        createdAt,
        updatedAt
      ];
  @override
  $OutletTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'outlet';
  @override
  final String actualTableName = 'outlet';
  @override
  VerificationContext validateIntegrity(Insertable<OutletData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('outlet_id')) {
      context.handle(_outletIdMeta,
          outletId.isAcceptableOrUnknown(data['outlet_id'], _outletIdMeta));
    } else if (isInserting) {
      context.missing(_outletIdMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode'], _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user'], _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('outlet_name')) {
      context.handle(
          _outletNameMeta,
          outletName.isAcceptableOrUnknown(
              data['outlet_name'], _outletNameMeta));
    } else if (isInserting) {
      context.missing(_outletNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    }
    if (data.containsKey('owner')) {
      context.handle(
          _ownerMeta, owner.isAcceptableOrUnknown(data['owner'], _ownerMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat'], _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng'], _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('geofence')) {
      context.handle(_geofenceMeta,
          geofence.isAcceptableOrUnknown(data['geofence'], _geofenceMeta));
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture'], _pictureMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {outletId};
  @override
  OutletData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OutletData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OutletTable createAlias(String alias) {
    return $OutletTable(_db, alias);
  }
}

class SyncRule extends DataClass implements Insertable<SyncRule> {
  final String syncId;
  final String target;
  final String syncDate;
  SyncRule(
      {@required this.syncId, @required this.target, @required this.syncDate});
  factory SyncRule.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return SyncRule(
      syncId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}sync_id']),
      target:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}target']),
      syncDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || syncId != null) {
      map['sync_id'] = Variable<String>(syncId);
    }
    if (!nullToAbsent || target != null) {
      map['target'] = Variable<String>(target);
    }
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<String>(syncDate);
    }
    return map;
  }

  SyncRuleTableCompanion toCompanion(bool nullToAbsent) {
    return SyncRuleTableCompanion(
      syncId:
          syncId == null && nullToAbsent ? const Value.absent() : Value(syncId),
      target:
          target == null && nullToAbsent ? const Value.absent() : Value(target),
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
    );
  }

  factory SyncRule.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SyncRule(
      syncId: serializer.fromJson<String>(json['syncId']),
      target: serializer.fromJson<String>(json['target']),
      syncDate: serializer.fromJson<String>(json['syncDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'syncId': serializer.toJson<String>(syncId),
      'target': serializer.toJson<String>(target),
      'syncDate': serializer.toJson<String>(syncDate),
    };
  }

  SyncRule copyWith({String syncId, String target, String syncDate}) =>
      SyncRule(
        syncId: syncId ?? this.syncId,
        target: target ?? this.target,
        syncDate: syncDate ?? this.syncDate,
      );
  @override
  String toString() {
    return (StringBuffer('SyncRule(')
          ..write('syncId: $syncId, ')
          ..write('target: $target, ')
          ..write('syncDate: $syncDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(syncId.hashCode, $mrjc(target.hashCode, syncDate.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SyncRule &&
          other.syncId == this.syncId &&
          other.target == this.target &&
          other.syncDate == this.syncDate);
}

class SyncRuleTableCompanion extends UpdateCompanion<SyncRule> {
  final Value<String> syncId;
  final Value<String> target;
  final Value<String> syncDate;
  const SyncRuleTableCompanion({
    this.syncId = const Value.absent(),
    this.target = const Value.absent(),
    this.syncDate = const Value.absent(),
  });
  SyncRuleTableCompanion.insert({
    @required String syncId,
    @required String target,
    @required String syncDate,
  })  : syncId = Value(syncId),
        target = Value(target),
        syncDate = Value(syncDate);
  static Insertable<SyncRule> custom({
    Expression<String> syncId,
    Expression<String> target,
    Expression<String> syncDate,
  }) {
    return RawValuesInsertable({
      if (syncId != null) 'sync_id': syncId,
      if (target != null) 'target': target,
      if (syncDate != null) 'sync_date': syncDate,
    });
  }

  SyncRuleTableCompanion copyWith(
      {Value<String> syncId, Value<String> target, Value<String> syncDate}) {
    return SyncRuleTableCompanion(
      syncId: syncId ?? this.syncId,
      target: target ?? this.target,
      syncDate: syncDate ?? this.syncDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (syncId.present) {
      map['sync_id'] = Variable<String>(syncId.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (syncDate.present) {
      map['sync_date'] = Variable<String>(syncDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncRuleTableCompanion(')
          ..write('syncId: $syncId, ')
          ..write('target: $target, ')
          ..write('syncDate: $syncDate')
          ..write(')'))
        .toString();
  }
}

class $SyncRuleTableTable extends SyncRuleTable
    with TableInfo<$SyncRuleTableTable, SyncRule> {
  final GeneratedDatabase _db;
  final String _alias;
  $SyncRuleTableTable(this._db, [this._alias]);
  final VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  GeneratedTextColumn _syncId;
  @override
  GeneratedTextColumn get syncId => _syncId ??= _constructSyncId();
  GeneratedTextColumn _constructSyncId() {
    return GeneratedTextColumn(
      'sync_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _targetMeta = const VerificationMeta('target');
  GeneratedTextColumn _target;
  @override
  GeneratedTextColumn get target => _target ??= _constructTarget();
  GeneratedTextColumn _constructTarget() {
    return GeneratedTextColumn(
      'target',
      $tableName,
      false,
    );
  }

  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  GeneratedTextColumn _syncDate;
  @override
  GeneratedTextColumn get syncDate => _syncDate ??= _constructSyncDate();
  GeneratedTextColumn _constructSyncDate() {
    return GeneratedTextColumn(
      'sync_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [syncId, target, syncDate];
  @override
  $SyncRuleTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sync_rule_table';
  @override
  final String actualTableName = 'sync_rule_table';
  @override
  VerificationContext validateIntegrity(Insertable<SyncRule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id'], _syncIdMeta));
    } else if (isInserting) {
      context.missing(_syncIdMeta);
    }
    if (data.containsKey('target')) {
      context.handle(_targetMeta,
          target.isAcceptableOrUnknown(data['target'], _targetMeta));
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date'], _syncDateMeta));
    } else if (isInserting) {
      context.missing(_syncDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {syncId};
  @override
  SyncRule map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SyncRule.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SyncRuleTableTable createAlias(String alias) {
    return $SyncRuleTableTable(_db, alias);
  }
}

class JadwalData extends DataClass implements Insertable<JadwalData> {
  final String jadwalId;
  final String userId;
  final String outletId;
  final String tanggal;
  final int visit;
  final String createdAt;
  final String updatedAt;
  JadwalData(
      {@required this.jadwalId,
      @required this.userId,
      @required this.outletId,
      @required this.tanggal,
      @required this.visit,
      this.createdAt,
      this.updatedAt});
  factory JadwalData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return JadwalData(
      jadwalId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}jadwal_id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      outletId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}outlet_id']),
      tanggal:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tanggal']),
      visit: intType.mapFromDatabaseResponse(data['${effectivePrefix}visit']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || jadwalId != null) {
      map['jadwal_id'] = Variable<String>(jadwalId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || outletId != null) {
      map['outlet_id'] = Variable<String>(outletId);
    }
    if (!nullToAbsent || tanggal != null) {
      map['tanggal'] = Variable<String>(tanggal);
    }
    if (!nullToAbsent || visit != null) {
      map['visit'] = Variable<int>(visit);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  JadwalCompanion toCompanion(bool nullToAbsent) {
    return JadwalCompanion(
      jadwalId: jadwalId == null && nullToAbsent
          ? const Value.absent()
          : Value(jadwalId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      outletId: outletId == null && nullToAbsent
          ? const Value.absent()
          : Value(outletId),
      tanggal: tanggal == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggal),
      visit:
          visit == null && nullToAbsent ? const Value.absent() : Value(visit),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory JadwalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return JadwalData(
      jadwalId: serializer.fromJson<String>(json['jadwalId']),
      userId: serializer.fromJson<String>(json['userId']),
      outletId: serializer.fromJson<String>(json['outletId']),
      tanggal: serializer.fromJson<String>(json['tanggal']),
      visit: serializer.fromJson<int>(json['visit']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'jadwalId': serializer.toJson<String>(jadwalId),
      'userId': serializer.toJson<String>(userId),
      'outletId': serializer.toJson<String>(outletId),
      'tanggal': serializer.toJson<String>(tanggal),
      'visit': serializer.toJson<int>(visit),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  JadwalData copyWith(
          {String jadwalId,
          String userId,
          String outletId,
          String tanggal,
          int visit,
          String createdAt,
          String updatedAt}) =>
      JadwalData(
        jadwalId: jadwalId ?? this.jadwalId,
        userId: userId ?? this.userId,
        outletId: outletId ?? this.outletId,
        tanggal: tanggal ?? this.tanggal,
        visit: visit ?? this.visit,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('JadwalData(')
          ..write('jadwalId: $jadwalId, ')
          ..write('userId: $userId, ')
          ..write('outletId: $outletId, ')
          ..write('tanggal: $tanggal, ')
          ..write('visit: $visit, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      jadwalId.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              outletId.hashCode,
              $mrjc(
                  tanggal.hashCode,
                  $mrjc(visit.hashCode,
                      $mrjc(createdAt.hashCode, updatedAt.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is JadwalData &&
          other.jadwalId == this.jadwalId &&
          other.userId == this.userId &&
          other.outletId == this.outletId &&
          other.tanggal == this.tanggal &&
          other.visit == this.visit &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class JadwalCompanion extends UpdateCompanion<JadwalData> {
  final Value<String> jadwalId;
  final Value<String> userId;
  final Value<String> outletId;
  final Value<String> tanggal;
  final Value<int> visit;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const JadwalCompanion({
    this.jadwalId = const Value.absent(),
    this.userId = const Value.absent(),
    this.outletId = const Value.absent(),
    this.tanggal = const Value.absent(),
    this.visit = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JadwalCompanion.insert({
    @required String jadwalId,
    @required String userId,
    @required String outletId,
    @required String tanggal,
    this.visit = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : jadwalId = Value(jadwalId),
        userId = Value(userId),
        outletId = Value(outletId),
        tanggal = Value(tanggal);
  static Insertable<JadwalData> custom({
    Expression<String> jadwalId,
    Expression<String> userId,
    Expression<String> outletId,
    Expression<String> tanggal,
    Expression<int> visit,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (jadwalId != null) 'jadwal_id': jadwalId,
      if (userId != null) 'user_id': userId,
      if (outletId != null) 'outlet_id': outletId,
      if (tanggal != null) 'tanggal': tanggal,
      if (visit != null) 'visit': visit,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  JadwalCompanion copyWith(
      {Value<String> jadwalId,
      Value<String> userId,
      Value<String> outletId,
      Value<String> tanggal,
      Value<int> visit,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return JadwalCompanion(
      jadwalId: jadwalId ?? this.jadwalId,
      userId: userId ?? this.userId,
      outletId: outletId ?? this.outletId,
      tanggal: tanggal ?? this.tanggal,
      visit: visit ?? this.visit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (jadwalId.present) {
      map['jadwal_id'] = Variable<String>(jadwalId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (outletId.present) {
      map['outlet_id'] = Variable<String>(outletId.value);
    }
    if (tanggal.present) {
      map['tanggal'] = Variable<String>(tanggal.value);
    }
    if (visit.present) {
      map['visit'] = Variable<int>(visit.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JadwalCompanion(')
          ..write('jadwalId: $jadwalId, ')
          ..write('userId: $userId, ')
          ..write('outletId: $outletId, ')
          ..write('tanggal: $tanggal, ')
          ..write('visit: $visit, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $JadwalTable extends Jadwal with TableInfo<$JadwalTable, JadwalData> {
  final GeneratedDatabase _db;
  final String _alias;
  $JadwalTable(this._db, [this._alias]);
  final VerificationMeta _jadwalIdMeta = const VerificationMeta('jadwalId');
  GeneratedTextColumn _jadwalId;
  @override
  GeneratedTextColumn get jadwalId => _jadwalId ??= _constructJadwalId();
  GeneratedTextColumn _constructJadwalId() {
    return GeneratedTextColumn(
      'jadwal_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _outletIdMeta = const VerificationMeta('outletId');
  GeneratedTextColumn _outletId;
  @override
  GeneratedTextColumn get outletId => _outletId ??= _constructOutletId();
  GeneratedTextColumn _constructOutletId() {
    return GeneratedTextColumn(
      'outlet_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tanggalMeta = const VerificationMeta('tanggal');
  GeneratedTextColumn _tanggal;
  @override
  GeneratedTextColumn get tanggal => _tanggal ??= _constructTanggal();
  GeneratedTextColumn _constructTanggal() {
    return GeneratedTextColumn(
      'tanggal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visitMeta = const VerificationMeta('visit');
  GeneratedIntColumn _visit;
  @override
  GeneratedIntColumn get visit => _visit ??= _constructVisit();
  GeneratedIntColumn _constructVisit() {
    return GeneratedIntColumn('visit', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [jadwalId, userId, outletId, tanggal, visit, createdAt, updatedAt];
  @override
  $JadwalTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'jadwal';
  @override
  final String actualTableName = 'jadwal';
  @override
  VerificationContext validateIntegrity(Insertable<JadwalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('jadwal_id')) {
      context.handle(_jadwalIdMeta,
          jadwalId.isAcceptableOrUnknown(data['jadwal_id'], _jadwalIdMeta));
    } else if (isInserting) {
      context.missing(_jadwalIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('outlet_id')) {
      context.handle(_outletIdMeta,
          outletId.isAcceptableOrUnknown(data['outlet_id'], _outletIdMeta));
    } else if (isInserting) {
      context.missing(_outletIdMeta);
    }
    if (data.containsKey('tanggal')) {
      context.handle(_tanggalMeta,
          tanggal.isAcceptableOrUnknown(data['tanggal'], _tanggalMeta));
    } else if (isInserting) {
      context.missing(_tanggalMeta);
    }
    if (data.containsKey('visit')) {
      context.handle(
          _visitMeta, visit.isAcceptableOrUnknown(data['visit'], _visitMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {jadwalId};
  @override
  JadwalData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return JadwalData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $JadwalTable createAlias(String alias) {
    return $JadwalTable(_db, alias);
  }
}

class VisitData extends DataClass implements Insertable<VisitData> {
  final String visitId;
  final String orderId;
  final String kodeVisit;
  final String userId;
  final String outletId;
  final String lat;
  final String lng;
  final int tutup;
  final String status;
  final int isPosted;
  final String createdAt;
  final String updatedAt;
  VisitData(
      {@required this.visitId,
      this.orderId,
      this.kodeVisit,
      @required this.userId,
      @required this.outletId,
      @required this.lat,
      @required this.lng,
      this.tutup,
      this.status,
      this.isPosted,
      @required this.createdAt,
      @required this.updatedAt});
  factory VisitData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return VisitData(
      visitId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visit_id']),
      orderId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_id']),
      kodeVisit: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}kode_visit']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      outletId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}outlet_id']),
      lat: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lng: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lng']),
      tutup: intType.mapFromDatabaseResponse(data['${effectivePrefix}tutup']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      isPosted:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_posted']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<String>(orderId);
    }
    if (!nullToAbsent || kodeVisit != null) {
      map['kode_visit'] = Variable<String>(kodeVisit);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || outletId != null) {
      map['outlet_id'] = Variable<String>(outletId);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<String>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<String>(lng);
    }
    if (!nullToAbsent || tutup != null) {
      map['tutup'] = Variable<int>(tutup);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || isPosted != null) {
      map['is_posted'] = Variable<int>(isPosted);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  VisitCompanion toCompanion(bool nullToAbsent) {
    return VisitCompanion(
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      kodeVisit: kodeVisit == null && nullToAbsent
          ? const Value.absent()
          : Value(kodeVisit),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      outletId: outletId == null && nullToAbsent
          ? const Value.absent()
          : Value(outletId),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      tutup:
          tutup == null && nullToAbsent ? const Value.absent() : Value(tutup),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      isPosted: isPosted == null && nullToAbsent
          ? const Value.absent()
          : Value(isPosted),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory VisitData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return VisitData(
      visitId: serializer.fromJson<String>(json['visitId']),
      orderId: serializer.fromJson<String>(json['orderId']),
      kodeVisit: serializer.fromJson<String>(json['kodeVisit']),
      userId: serializer.fromJson<String>(json['userId']),
      outletId: serializer.fromJson<String>(json['outletId']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
      tutup: serializer.fromJson<int>(json['tutup']),
      status: serializer.fromJson<String>(json['status']),
      isPosted: serializer.fromJson<int>(json['isPosted']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'visitId': serializer.toJson<String>(visitId),
      'orderId': serializer.toJson<String>(orderId),
      'kodeVisit': serializer.toJson<String>(kodeVisit),
      'userId': serializer.toJson<String>(userId),
      'outletId': serializer.toJson<String>(outletId),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
      'tutup': serializer.toJson<int>(tutup),
      'status': serializer.toJson<String>(status),
      'isPosted': serializer.toJson<int>(isPosted),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  VisitData copyWith(
          {String visitId,
          String orderId,
          String kodeVisit,
          String userId,
          String outletId,
          String lat,
          String lng,
          int tutup,
          String status,
          int isPosted,
          String createdAt,
          String updatedAt}) =>
      VisitData(
        visitId: visitId ?? this.visitId,
        orderId: orderId ?? this.orderId,
        kodeVisit: kodeVisit ?? this.kodeVisit,
        userId: userId ?? this.userId,
        outletId: outletId ?? this.outletId,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        tutup: tutup ?? this.tutup,
        status: status ?? this.status,
        isPosted: isPosted ?? this.isPosted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('VisitData(')
          ..write('visitId: $visitId, ')
          ..write('orderId: $orderId, ')
          ..write('kodeVisit: $kodeVisit, ')
          ..write('userId: $userId, ')
          ..write('outletId: $outletId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('tutup: $tutup, ')
          ..write('status: $status, ')
          ..write('isPosted: $isPosted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      visitId.hashCode,
      $mrjc(
          orderId.hashCode,
          $mrjc(
              kodeVisit.hashCode,
              $mrjc(
                  userId.hashCode,
                  $mrjc(
                      outletId.hashCode,
                      $mrjc(
                          lat.hashCode,
                          $mrjc(
                              lng.hashCode,
                              $mrjc(
                                  tutup.hashCode,
                                  $mrjc(
                                      status.hashCode,
                                      $mrjc(
                                          isPosted.hashCode,
                                          $mrjc(createdAt.hashCode,
                                              updatedAt.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is VisitData &&
          other.visitId == this.visitId &&
          other.orderId == this.orderId &&
          other.kodeVisit == this.kodeVisit &&
          other.userId == this.userId &&
          other.outletId == this.outletId &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.tutup == this.tutup &&
          other.status == this.status &&
          other.isPosted == this.isPosted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VisitCompanion extends UpdateCompanion<VisitData> {
  final Value<String> visitId;
  final Value<String> orderId;
  final Value<String> kodeVisit;
  final Value<String> userId;
  final Value<String> outletId;
  final Value<String> lat;
  final Value<String> lng;
  final Value<int> tutup;
  final Value<String> status;
  final Value<int> isPosted;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const VisitCompanion({
    this.visitId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.kodeVisit = const Value.absent(),
    this.userId = const Value.absent(),
    this.outletId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.tutup = const Value.absent(),
    this.status = const Value.absent(),
    this.isPosted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VisitCompanion.insert({
    @required String visitId,
    this.orderId = const Value.absent(),
    this.kodeVisit = const Value.absent(),
    @required String userId,
    @required String outletId,
    @required String lat,
    @required String lng,
    this.tutup = const Value.absent(),
    this.status = const Value.absent(),
    this.isPosted = const Value.absent(),
    @required String createdAt,
    @required String updatedAt,
  })  : visitId = Value(visitId),
        userId = Value(userId),
        outletId = Value(outletId),
        lat = Value(lat),
        lng = Value(lng),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<VisitData> custom({
    Expression<String> visitId,
    Expression<String> orderId,
    Expression<String> kodeVisit,
    Expression<String> userId,
    Expression<String> outletId,
    Expression<String> lat,
    Expression<String> lng,
    Expression<int> tutup,
    Expression<String> status,
    Expression<int> isPosted,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (visitId != null) 'visit_id': visitId,
      if (orderId != null) 'order_id': orderId,
      if (kodeVisit != null) 'kode_visit': kodeVisit,
      if (userId != null) 'user_id': userId,
      if (outletId != null) 'outlet_id': outletId,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (tutup != null) 'tutup': tutup,
      if (status != null) 'status': status,
      if (isPosted != null) 'is_posted': isPosted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VisitCompanion copyWith(
      {Value<String> visitId,
      Value<String> orderId,
      Value<String> kodeVisit,
      Value<String> userId,
      Value<String> outletId,
      Value<String> lat,
      Value<String> lng,
      Value<int> tutup,
      Value<String> status,
      Value<int> isPosted,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return VisitCompanion(
      visitId: visitId ?? this.visitId,
      orderId: orderId ?? this.orderId,
      kodeVisit: kodeVisit ?? this.kodeVisit,
      userId: userId ?? this.userId,
      outletId: outletId ?? this.outletId,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      tutup: tutup ?? this.tutup,
      status: status ?? this.status,
      isPosted: isPosted ?? this.isPosted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (kodeVisit.present) {
      map['kode_visit'] = Variable<String>(kodeVisit.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (outletId.present) {
      map['outlet_id'] = Variable<String>(outletId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<String>(lng.value);
    }
    if (tutup.present) {
      map['tutup'] = Variable<int>(tutup.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isPosted.present) {
      map['is_posted'] = Variable<int>(isPosted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitCompanion(')
          ..write('visitId: $visitId, ')
          ..write('orderId: $orderId, ')
          ..write('kodeVisit: $kodeVisit, ')
          ..write('userId: $userId, ')
          ..write('outletId: $outletId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('tutup: $tutup, ')
          ..write('status: $status, ')
          ..write('isPosted: $isPosted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VisitTable extends Visit with TableInfo<$VisitTable, VisitData> {
  final GeneratedDatabase _db;
  final String _alias;
  $VisitTable(this._db, [this._alias]);
  final VerificationMeta _visitIdMeta = const VerificationMeta('visitId');
  GeneratedTextColumn _visitId;
  @override
  GeneratedTextColumn get visitId => _visitId ??= _constructVisitId();
  GeneratedTextColumn _constructVisitId() {
    return GeneratedTextColumn(
      'visit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderIdMeta = const VerificationMeta('orderId');
  GeneratedTextColumn _orderId;
  @override
  GeneratedTextColumn get orderId => _orderId ??= _constructOrderId();
  GeneratedTextColumn _constructOrderId() {
    return GeneratedTextColumn(
      'order_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _kodeVisitMeta = const VerificationMeta('kodeVisit');
  GeneratedTextColumn _kodeVisit;
  @override
  GeneratedTextColumn get kodeVisit => _kodeVisit ??= _constructKodeVisit();
  GeneratedTextColumn _constructKodeVisit() {
    return GeneratedTextColumn(
      'kode_visit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _outletIdMeta = const VerificationMeta('outletId');
  GeneratedTextColumn _outletId;
  @override
  GeneratedTextColumn get outletId => _outletId ??= _constructOutletId();
  GeneratedTextColumn _constructOutletId() {
    return GeneratedTextColumn(
      'outlet_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedTextColumn _lat;
  @override
  GeneratedTextColumn get lat => _lat ??= _constructLat();
  GeneratedTextColumn _constructLat() {
    return GeneratedTextColumn(
      'lat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  GeneratedTextColumn _lng;
  @override
  GeneratedTextColumn get lng => _lng ??= _constructLng();
  GeneratedTextColumn _constructLng() {
    return GeneratedTextColumn(
      'lng',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tutupMeta = const VerificationMeta('tutup');
  GeneratedIntColumn _tutup;
  @override
  GeneratedIntColumn get tutup => _tutup ??= _constructTutup();
  GeneratedIntColumn _constructTutup() {
    return GeneratedIntColumn('tutup', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isPostedMeta = const VerificationMeta('isPosted');
  GeneratedIntColumn _isPosted;
  @override
  GeneratedIntColumn get isPosted => _isPosted ??= _constructIsPosted();
  GeneratedIntColumn _constructIsPosted() {
    return GeneratedIntColumn('is_posted', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        visitId,
        orderId,
        kodeVisit,
        userId,
        outletId,
        lat,
        lng,
        tutup,
        status,
        isPosted,
        createdAt,
        updatedAt
      ];
  @override
  $VisitTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'visit';
  @override
  final String actualTableName = 'visit';
  @override
  VerificationContext validateIntegrity(Insertable<VisitData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('visit_id')) {
      context.handle(_visitIdMeta,
          visitId.isAcceptableOrUnknown(data['visit_id'], _visitIdMeta));
    } else if (isInserting) {
      context.missing(_visitIdMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id'], _orderIdMeta));
    }
    if (data.containsKey('kode_visit')) {
      context.handle(_kodeVisitMeta,
          kodeVisit.isAcceptableOrUnknown(data['kode_visit'], _kodeVisitMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('outlet_id')) {
      context.handle(_outletIdMeta,
          outletId.isAcceptableOrUnknown(data['outlet_id'], _outletIdMeta));
    } else if (isInserting) {
      context.missing(_outletIdMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat'], _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng'], _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('tutup')) {
      context.handle(
          _tutupMeta, tutup.isAcceptableOrUnknown(data['tutup'], _tutupMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('is_posted')) {
      context.handle(_isPostedMeta,
          isPosted.isAcceptableOrUnknown(data['is_posted'], _isPostedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {visitId};
  @override
  VisitData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return VisitData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $VisitTable createAlias(String alias) {
    return $VisitTable(_db, alias);
  }
}

class OrderData extends DataClass implements Insertable<OrderData> {
  final String orderId;
  final String outletId;
  final String visitId;
  final String barcode;
  final String kodeOrder;
  final String nomorPO;
  final String nomorFaktur;
  final String poUserId;
  final String fakturUserId;
  final String status;
  final String totalBayar;
  final String pembayaran;
  final String createdAt;
  final String updatedAt;
  OrderData(
      {@required this.orderId,
      @required this.outletId,
      this.visitId,
      this.barcode,
      @required this.kodeOrder,
      @required this.nomorPO,
      this.nomorFaktur,
      @required this.poUserId,
      this.fakturUserId,
      @required this.status,
      @required this.totalBayar,
      @required this.pembayaran,
      @required this.createdAt,
      this.updatedAt});
  factory OrderData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return OrderData(
      orderId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_id']),
      outletId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}outlet_id']),
      visitId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visit_id']),
      barcode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}barcode']),
      kodeOrder: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}kode_order']),
      nomorPO: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomor_p_o']),
      nomorFaktur: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomor_faktur']),
      poUserId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}po_user_id']),
      fakturUserId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}faktur_user_id']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      totalBayar: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_bayar']),
      pembayaran: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pembayaran']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<String>(orderId);
    }
    if (!nullToAbsent || outletId != null) {
      map['outlet_id'] = Variable<String>(outletId);
    }
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || kodeOrder != null) {
      map['kode_order'] = Variable<String>(kodeOrder);
    }
    if (!nullToAbsent || nomorPO != null) {
      map['nomor_p_o'] = Variable<String>(nomorPO);
    }
    if (!nullToAbsent || nomorFaktur != null) {
      map['nomor_faktur'] = Variable<String>(nomorFaktur);
    }
    if (!nullToAbsent || poUserId != null) {
      map['po_user_id'] = Variable<String>(poUserId);
    }
    if (!nullToAbsent || fakturUserId != null) {
      map['faktur_user_id'] = Variable<String>(fakturUserId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || totalBayar != null) {
      map['total_bayar'] = Variable<String>(totalBayar);
    }
    if (!nullToAbsent || pembayaran != null) {
      map['pembayaran'] = Variable<String>(pembayaran);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  SalesCompanion toCompanion(bool nullToAbsent) {
    return SalesCompanion(
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      outletId: outletId == null && nullToAbsent
          ? const Value.absent()
          : Value(outletId),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      kodeOrder: kodeOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(kodeOrder),
      nomorPO: nomorPO == null && nullToAbsent
          ? const Value.absent()
          : Value(nomorPO),
      nomorFaktur: nomorFaktur == null && nullToAbsent
          ? const Value.absent()
          : Value(nomorFaktur),
      poUserId: poUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(poUserId),
      fakturUserId: fakturUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(fakturUserId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      totalBayar: totalBayar == null && nullToAbsent
          ? const Value.absent()
          : Value(totalBayar),
      pembayaran: pembayaran == null && nullToAbsent
          ? const Value.absent()
          : Value(pembayaran),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory OrderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderData(
      orderId: serializer.fromJson<String>(json['orderId']),
      outletId: serializer.fromJson<String>(json['outletId']),
      visitId: serializer.fromJson<String>(json['visitId']),
      barcode: serializer.fromJson<String>(json['barcode']),
      kodeOrder: serializer.fromJson<String>(json['kodeOrder']),
      nomorPO: serializer.fromJson<String>(json['nomorPO']),
      nomorFaktur: serializer.fromJson<String>(json['nomorFaktur']),
      poUserId: serializer.fromJson<String>(json['poUserId']),
      fakturUserId: serializer.fromJson<String>(json['fakturUserId']),
      status: serializer.fromJson<String>(json['status']),
      totalBayar: serializer.fromJson<String>(json['totalBayar']),
      pembayaran: serializer.fromJson<String>(json['pembayaran']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'orderId': serializer.toJson<String>(orderId),
      'outletId': serializer.toJson<String>(outletId),
      'visitId': serializer.toJson<String>(visitId),
      'barcode': serializer.toJson<String>(barcode),
      'kodeOrder': serializer.toJson<String>(kodeOrder),
      'nomorPO': serializer.toJson<String>(nomorPO),
      'nomorFaktur': serializer.toJson<String>(nomorFaktur),
      'poUserId': serializer.toJson<String>(poUserId),
      'fakturUserId': serializer.toJson<String>(fakturUserId),
      'status': serializer.toJson<String>(status),
      'totalBayar': serializer.toJson<String>(totalBayar),
      'pembayaran': serializer.toJson<String>(pembayaran),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  OrderData copyWith(
          {String orderId,
          String outletId,
          String visitId,
          String barcode,
          String kodeOrder,
          String nomorPO,
          String nomorFaktur,
          String poUserId,
          String fakturUserId,
          String status,
          String totalBayar,
          String pembayaran,
          String createdAt,
          String updatedAt}) =>
      OrderData(
        orderId: orderId ?? this.orderId,
        outletId: outletId ?? this.outletId,
        visitId: visitId ?? this.visitId,
        barcode: barcode ?? this.barcode,
        kodeOrder: kodeOrder ?? this.kodeOrder,
        nomorPO: nomorPO ?? this.nomorPO,
        nomorFaktur: nomorFaktur ?? this.nomorFaktur,
        poUserId: poUserId ?? this.poUserId,
        fakturUserId: fakturUserId ?? this.fakturUserId,
        status: status ?? this.status,
        totalBayar: totalBayar ?? this.totalBayar,
        pembayaran: pembayaran ?? this.pembayaran,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('OrderData(')
          ..write('orderId: $orderId, ')
          ..write('outletId: $outletId, ')
          ..write('visitId: $visitId, ')
          ..write('barcode: $barcode, ')
          ..write('kodeOrder: $kodeOrder, ')
          ..write('nomorPO: $nomorPO, ')
          ..write('nomorFaktur: $nomorFaktur, ')
          ..write('poUserId: $poUserId, ')
          ..write('fakturUserId: $fakturUserId, ')
          ..write('status: $status, ')
          ..write('totalBayar: $totalBayar, ')
          ..write('pembayaran: $pembayaran, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      orderId.hashCode,
      $mrjc(
          outletId.hashCode,
          $mrjc(
              visitId.hashCode,
              $mrjc(
                  barcode.hashCode,
                  $mrjc(
                      kodeOrder.hashCode,
                      $mrjc(
                          nomorPO.hashCode,
                          $mrjc(
                              nomorFaktur.hashCode,
                              $mrjc(
                                  poUserId.hashCode,
                                  $mrjc(
                                      fakturUserId.hashCode,
                                      $mrjc(
                                          status.hashCode,
                                          $mrjc(
                                              totalBayar.hashCode,
                                              $mrjc(
                                                  pembayaran.hashCode,
                                                  $mrjc(
                                                      createdAt.hashCode,
                                                      updatedAt
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OrderData &&
          other.orderId == this.orderId &&
          other.outletId == this.outletId &&
          other.visitId == this.visitId &&
          other.barcode == this.barcode &&
          other.kodeOrder == this.kodeOrder &&
          other.nomorPO == this.nomorPO &&
          other.nomorFaktur == this.nomorFaktur &&
          other.poUserId == this.poUserId &&
          other.fakturUserId == this.fakturUserId &&
          other.status == this.status &&
          other.totalBayar == this.totalBayar &&
          other.pembayaran == this.pembayaran &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SalesCompanion extends UpdateCompanion<OrderData> {
  final Value<String> orderId;
  final Value<String> outletId;
  final Value<String> visitId;
  final Value<String> barcode;
  final Value<String> kodeOrder;
  final Value<String> nomorPO;
  final Value<String> nomorFaktur;
  final Value<String> poUserId;
  final Value<String> fakturUserId;
  final Value<String> status;
  final Value<String> totalBayar;
  final Value<String> pembayaran;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const SalesCompanion({
    this.orderId = const Value.absent(),
    this.outletId = const Value.absent(),
    this.visitId = const Value.absent(),
    this.barcode = const Value.absent(),
    this.kodeOrder = const Value.absent(),
    this.nomorPO = const Value.absent(),
    this.nomorFaktur = const Value.absent(),
    this.poUserId = const Value.absent(),
    this.fakturUserId = const Value.absent(),
    this.status = const Value.absent(),
    this.totalBayar = const Value.absent(),
    this.pembayaran = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SalesCompanion.insert({
    @required String orderId,
    @required String outletId,
    this.visitId = const Value.absent(),
    this.barcode = const Value.absent(),
    @required String kodeOrder,
    @required String nomorPO,
    this.nomorFaktur = const Value.absent(),
    @required String poUserId,
    this.fakturUserId = const Value.absent(),
    this.status = const Value.absent(),
    @required String totalBayar,
    this.pembayaran = const Value.absent(),
    @required String createdAt,
    this.updatedAt = const Value.absent(),
  })  : orderId = Value(orderId),
        outletId = Value(outletId),
        kodeOrder = Value(kodeOrder),
        nomorPO = Value(nomorPO),
        poUserId = Value(poUserId),
        totalBayar = Value(totalBayar),
        createdAt = Value(createdAt);
  static Insertable<OrderData> custom({
    Expression<String> orderId,
    Expression<String> outletId,
    Expression<String> visitId,
    Expression<String> barcode,
    Expression<String> kodeOrder,
    Expression<String> nomorPO,
    Expression<String> nomorFaktur,
    Expression<String> poUserId,
    Expression<String> fakturUserId,
    Expression<String> status,
    Expression<String> totalBayar,
    Expression<String> pembayaran,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (orderId != null) 'order_id': orderId,
      if (outletId != null) 'outlet_id': outletId,
      if (visitId != null) 'visit_id': visitId,
      if (barcode != null) 'barcode': barcode,
      if (kodeOrder != null) 'kode_order': kodeOrder,
      if (nomorPO != null) 'nomor_p_o': nomorPO,
      if (nomorFaktur != null) 'nomor_faktur': nomorFaktur,
      if (poUserId != null) 'po_user_id': poUserId,
      if (fakturUserId != null) 'faktur_user_id': fakturUserId,
      if (status != null) 'status': status,
      if (totalBayar != null) 'total_bayar': totalBayar,
      if (pembayaran != null) 'pembayaran': pembayaran,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SalesCompanion copyWith(
      {Value<String> orderId,
      Value<String> outletId,
      Value<String> visitId,
      Value<String> barcode,
      Value<String> kodeOrder,
      Value<String> nomorPO,
      Value<String> nomorFaktur,
      Value<String> poUserId,
      Value<String> fakturUserId,
      Value<String> status,
      Value<String> totalBayar,
      Value<String> pembayaran,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return SalesCompanion(
      orderId: orderId ?? this.orderId,
      outletId: outletId ?? this.outletId,
      visitId: visitId ?? this.visitId,
      barcode: barcode ?? this.barcode,
      kodeOrder: kodeOrder ?? this.kodeOrder,
      nomorPO: nomorPO ?? this.nomorPO,
      nomorFaktur: nomorFaktur ?? this.nomorFaktur,
      poUserId: poUserId ?? this.poUserId,
      fakturUserId: fakturUserId ?? this.fakturUserId,
      status: status ?? this.status,
      totalBayar: totalBayar ?? this.totalBayar,
      pembayaran: pembayaran ?? this.pembayaran,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (outletId.present) {
      map['outlet_id'] = Variable<String>(outletId.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (kodeOrder.present) {
      map['kode_order'] = Variable<String>(kodeOrder.value);
    }
    if (nomorPO.present) {
      map['nomor_p_o'] = Variable<String>(nomorPO.value);
    }
    if (nomorFaktur.present) {
      map['nomor_faktur'] = Variable<String>(nomorFaktur.value);
    }
    if (poUserId.present) {
      map['po_user_id'] = Variable<String>(poUserId.value);
    }
    if (fakturUserId.present) {
      map['faktur_user_id'] = Variable<String>(fakturUserId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (totalBayar.present) {
      map['total_bayar'] = Variable<String>(totalBayar.value);
    }
    if (pembayaran.present) {
      map['pembayaran'] = Variable<String>(pembayaran.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesCompanion(')
          ..write('orderId: $orderId, ')
          ..write('outletId: $outletId, ')
          ..write('visitId: $visitId, ')
          ..write('barcode: $barcode, ')
          ..write('kodeOrder: $kodeOrder, ')
          ..write('nomorPO: $nomorPO, ')
          ..write('nomorFaktur: $nomorFaktur, ')
          ..write('poUserId: $poUserId, ')
          ..write('fakturUserId: $fakturUserId, ')
          ..write('status: $status, ')
          ..write('totalBayar: $totalBayar, ')
          ..write('pembayaran: $pembayaran, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SalesTable extends Sales with TableInfo<$SalesTable, OrderData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SalesTable(this._db, [this._alias]);
  final VerificationMeta _orderIdMeta = const VerificationMeta('orderId');
  GeneratedTextColumn _orderId;
  @override
  GeneratedTextColumn get orderId => _orderId ??= _constructOrderId();
  GeneratedTextColumn _constructOrderId() {
    return GeneratedTextColumn(
      'order_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _outletIdMeta = const VerificationMeta('outletId');
  GeneratedTextColumn _outletId;
  @override
  GeneratedTextColumn get outletId => _outletId ??= _constructOutletId();
  GeneratedTextColumn _constructOutletId() {
    return GeneratedTextColumn(
      'outlet_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visitIdMeta = const VerificationMeta('visitId');
  GeneratedTextColumn _visitId;
  @override
  GeneratedTextColumn get visitId => _visitId ??= _constructVisitId();
  GeneratedTextColumn _constructVisitId() {
    return GeneratedTextColumn(
      'visit_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  GeneratedTextColumn _barcode;
  @override
  GeneratedTextColumn get barcode => _barcode ??= _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn(
      'barcode',
      $tableName,
      true,
    );
  }

  final VerificationMeta _kodeOrderMeta = const VerificationMeta('kodeOrder');
  GeneratedTextColumn _kodeOrder;
  @override
  GeneratedTextColumn get kodeOrder => _kodeOrder ??= _constructKodeOrder();
  GeneratedTextColumn _constructKodeOrder() {
    return GeneratedTextColumn(
      'kode_order',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomorPOMeta = const VerificationMeta('nomorPO');
  GeneratedTextColumn _nomorPO;
  @override
  GeneratedTextColumn get nomorPO => _nomorPO ??= _constructNomorPO();
  GeneratedTextColumn _constructNomorPO() {
    return GeneratedTextColumn(
      'nomor_p_o',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomorFakturMeta =
      const VerificationMeta('nomorFaktur');
  GeneratedTextColumn _nomorFaktur;
  @override
  GeneratedTextColumn get nomorFaktur =>
      _nomorFaktur ??= _constructNomorFaktur();
  GeneratedTextColumn _constructNomorFaktur() {
    return GeneratedTextColumn(
      'nomor_faktur',
      $tableName,
      true,
    );
  }

  final VerificationMeta _poUserIdMeta = const VerificationMeta('poUserId');
  GeneratedTextColumn _poUserId;
  @override
  GeneratedTextColumn get poUserId => _poUserId ??= _constructPoUserId();
  GeneratedTextColumn _constructPoUserId() {
    return GeneratedTextColumn(
      'po_user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fakturUserIdMeta =
      const VerificationMeta('fakturUserId');
  GeneratedTextColumn _fakturUserId;
  @override
  GeneratedTextColumn get fakturUserId =>
      _fakturUserId ??= _constructFakturUserId();
  GeneratedTextColumn _constructFakturUserId() {
    return GeneratedTextColumn(
      'faktur_user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn('status', $tableName, false,
        defaultValue: const Constant('PO'));
  }

  final VerificationMeta _totalBayarMeta = const VerificationMeta('totalBayar');
  GeneratedTextColumn _totalBayar;
  @override
  GeneratedTextColumn get totalBayar => _totalBayar ??= _constructTotalBayar();
  GeneratedTextColumn _constructTotalBayar() {
    return GeneratedTextColumn(
      'total_bayar',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pembayaranMeta = const VerificationMeta('pembayaran');
  GeneratedTextColumn _pembayaran;
  @override
  GeneratedTextColumn get pembayaran => _pembayaran ??= _constructPembayaran();
  GeneratedTextColumn _constructPembayaran() {
    return GeneratedTextColumn('pembayaran', $tableName, false,
        defaultValue: const Constant('Cash'));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        orderId,
        outletId,
        visitId,
        barcode,
        kodeOrder,
        nomorPO,
        nomorFaktur,
        poUserId,
        fakturUserId,
        status,
        totalBayar,
        pembayaran,
        createdAt,
        updatedAt
      ];
  @override
  $SalesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sales';
  @override
  final String actualTableName = 'sales';
  @override
  VerificationContext validateIntegrity(Insertable<OrderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id'], _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('outlet_id')) {
      context.handle(_outletIdMeta,
          outletId.isAcceptableOrUnknown(data['outlet_id'], _outletIdMeta));
    } else if (isInserting) {
      context.missing(_outletIdMeta);
    }
    if (data.containsKey('visit_id')) {
      context.handle(_visitIdMeta,
          visitId.isAcceptableOrUnknown(data['visit_id'], _visitIdMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode'], _barcodeMeta));
    }
    if (data.containsKey('kode_order')) {
      context.handle(_kodeOrderMeta,
          kodeOrder.isAcceptableOrUnknown(data['kode_order'], _kodeOrderMeta));
    } else if (isInserting) {
      context.missing(_kodeOrderMeta);
    }
    if (data.containsKey('nomor_p_o')) {
      context.handle(_nomorPOMeta,
          nomorPO.isAcceptableOrUnknown(data['nomor_p_o'], _nomorPOMeta));
    } else if (isInserting) {
      context.missing(_nomorPOMeta);
    }
    if (data.containsKey('nomor_faktur')) {
      context.handle(
          _nomorFakturMeta,
          nomorFaktur.isAcceptableOrUnknown(
              data['nomor_faktur'], _nomorFakturMeta));
    }
    if (data.containsKey('po_user_id')) {
      context.handle(_poUserIdMeta,
          poUserId.isAcceptableOrUnknown(data['po_user_id'], _poUserIdMeta));
    } else if (isInserting) {
      context.missing(_poUserIdMeta);
    }
    if (data.containsKey('faktur_user_id')) {
      context.handle(
          _fakturUserIdMeta,
          fakturUserId.isAcceptableOrUnknown(
              data['faktur_user_id'], _fakturUserIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('total_bayar')) {
      context.handle(
          _totalBayarMeta,
          totalBayar.isAcceptableOrUnknown(
              data['total_bayar'], _totalBayarMeta));
    } else if (isInserting) {
      context.missing(_totalBayarMeta);
    }
    if (data.containsKey('pembayaran')) {
      context.handle(
          _pembayaranMeta,
          pembayaran.isAcceptableOrUnknown(
              data['pembayaran'], _pembayaranMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderId};
  @override
  OrderData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OrderData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SalesTable createAlias(String alias) {
    return $SalesTable(_db, alias);
  }
}

class OrderItemData extends DataClass implements Insertable<OrderItemData> {
  final String orderItemId;
  final String orderId;
  final String produkId;
  final String kodeOrder;
  final String userId;
  final int quantity;
  final String totalHarga;
  final String createdAt;
  final String updatedAt;
  OrderItemData(
      {@required this.orderItemId,
      @required this.orderId,
      @required this.produkId,
      this.kodeOrder,
      @required this.userId,
      @required this.quantity,
      @required this.totalHarga,
      @required this.createdAt,
      @required this.updatedAt});
  factory OrderItemData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return OrderItemData(
      orderItemId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_item_id']),
      orderId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_id']),
      produkId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}produk_id']),
      kodeOrder: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}kode_order']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      totalHarga: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_harga']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || orderItemId != null) {
      map['order_item_id'] = Variable<String>(orderItemId);
    }
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<String>(orderId);
    }
    if (!nullToAbsent || produkId != null) {
      map['produk_id'] = Variable<String>(produkId);
    }
    if (!nullToAbsent || kodeOrder != null) {
      map['kode_order'] = Variable<String>(kodeOrder);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || totalHarga != null) {
      map['total_harga'] = Variable<String>(totalHarga);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  OrderItemCompanion toCompanion(bool nullToAbsent) {
    return OrderItemCompanion(
      orderItemId: orderItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderItemId),
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      produkId: produkId == null && nullToAbsent
          ? const Value.absent()
          : Value(produkId),
      kodeOrder: kodeOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(kodeOrder),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      totalHarga: totalHarga == null && nullToAbsent
          ? const Value.absent()
          : Value(totalHarga),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory OrderItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderItemData(
      orderItemId: serializer.fromJson<String>(json['orderItemId']),
      orderId: serializer.fromJson<String>(json['orderId']),
      produkId: serializer.fromJson<String>(json['produkId']),
      kodeOrder: serializer.fromJson<String>(json['kodeOrder']),
      userId: serializer.fromJson<String>(json['userId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      totalHarga: serializer.fromJson<String>(json['totalHarga']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'orderItemId': serializer.toJson<String>(orderItemId),
      'orderId': serializer.toJson<String>(orderId),
      'produkId': serializer.toJson<String>(produkId),
      'kodeOrder': serializer.toJson<String>(kodeOrder),
      'userId': serializer.toJson<String>(userId),
      'quantity': serializer.toJson<int>(quantity),
      'totalHarga': serializer.toJson<String>(totalHarga),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  OrderItemData copyWith(
          {String orderItemId,
          String orderId,
          String produkId,
          String kodeOrder,
          String userId,
          int quantity,
          String totalHarga,
          String createdAt,
          String updatedAt}) =>
      OrderItemData(
        orderItemId: orderItemId ?? this.orderItemId,
        orderId: orderId ?? this.orderId,
        produkId: produkId ?? this.produkId,
        kodeOrder: kodeOrder ?? this.kodeOrder,
        userId: userId ?? this.userId,
        quantity: quantity ?? this.quantity,
        totalHarga: totalHarga ?? this.totalHarga,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('OrderItemData(')
          ..write('orderItemId: $orderItemId, ')
          ..write('orderId: $orderId, ')
          ..write('produkId: $produkId, ')
          ..write('kodeOrder: $kodeOrder, ')
          ..write('userId: $userId, ')
          ..write('quantity: $quantity, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      orderItemId.hashCode,
      $mrjc(
          orderId.hashCode,
          $mrjc(
              produkId.hashCode,
              $mrjc(
                  kodeOrder.hashCode,
                  $mrjc(
                      userId.hashCode,
                      $mrjc(
                          quantity.hashCode,
                          $mrjc(
                              totalHarga.hashCode,
                              $mrjc(createdAt.hashCode,
                                  updatedAt.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OrderItemData &&
          other.orderItemId == this.orderItemId &&
          other.orderId == this.orderId &&
          other.produkId == this.produkId &&
          other.kodeOrder == this.kodeOrder &&
          other.userId == this.userId &&
          other.quantity == this.quantity &&
          other.totalHarga == this.totalHarga &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OrderItemCompanion extends UpdateCompanion<OrderItemData> {
  final Value<String> orderItemId;
  final Value<String> orderId;
  final Value<String> produkId;
  final Value<String> kodeOrder;
  final Value<String> userId;
  final Value<int> quantity;
  final Value<String> totalHarga;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const OrderItemCompanion({
    this.orderItemId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.kodeOrder = const Value.absent(),
    this.userId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.totalHarga = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  OrderItemCompanion.insert({
    @required String orderItemId,
    @required String orderId,
    @required String produkId,
    this.kodeOrder = const Value.absent(),
    @required String userId,
    @required int quantity,
    @required String totalHarga,
    @required String createdAt,
    @required String updatedAt,
  })  : orderItemId = Value(orderItemId),
        orderId = Value(orderId),
        produkId = Value(produkId),
        userId = Value(userId),
        quantity = Value(quantity),
        totalHarga = Value(totalHarga),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OrderItemData> custom({
    Expression<String> orderItemId,
    Expression<String> orderId,
    Expression<String> produkId,
    Expression<String> kodeOrder,
    Expression<String> userId,
    Expression<int> quantity,
    Expression<String> totalHarga,
    Expression<String> createdAt,
    Expression<String> updatedAt,
  }) {
    return RawValuesInsertable({
      if (orderItemId != null) 'order_item_id': orderItemId,
      if (orderId != null) 'order_id': orderId,
      if (produkId != null) 'produk_id': produkId,
      if (kodeOrder != null) 'kode_order': kodeOrder,
      if (userId != null) 'user_id': userId,
      if (quantity != null) 'quantity': quantity,
      if (totalHarga != null) 'total_harga': totalHarga,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  OrderItemCompanion copyWith(
      {Value<String> orderItemId,
      Value<String> orderId,
      Value<String> produkId,
      Value<String> kodeOrder,
      Value<String> userId,
      Value<int> quantity,
      Value<String> totalHarga,
      Value<String> createdAt,
      Value<String> updatedAt}) {
    return OrderItemCompanion(
      orderItemId: orderItemId ?? this.orderItemId,
      orderId: orderId ?? this.orderId,
      produkId: produkId ?? this.produkId,
      kodeOrder: kodeOrder ?? this.kodeOrder,
      userId: userId ?? this.userId,
      quantity: quantity ?? this.quantity,
      totalHarga: totalHarga ?? this.totalHarga,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (orderItemId.present) {
      map['order_item_id'] = Variable<String>(orderItemId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<String>(produkId.value);
    }
    if (kodeOrder.present) {
      map['kode_order'] = Variable<String>(kodeOrder.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (totalHarga.present) {
      map['total_harga'] = Variable<String>(totalHarga.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemCompanion(')
          ..write('orderItemId: $orderItemId, ')
          ..write('orderId: $orderId, ')
          ..write('produkId: $produkId, ')
          ..write('kodeOrder: $kodeOrder, ')
          ..write('userId: $userId, ')
          ..write('quantity: $quantity, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $OrderItemTable extends OrderItem
    with TableInfo<$OrderItemTable, OrderItemData> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrderItemTable(this._db, [this._alias]);
  final VerificationMeta _orderItemIdMeta =
      const VerificationMeta('orderItemId');
  GeneratedTextColumn _orderItemId;
  @override
  GeneratedTextColumn get orderItemId =>
      _orderItemId ??= _constructOrderItemId();
  GeneratedTextColumn _constructOrderItemId() {
    return GeneratedTextColumn(
      'order_item_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderIdMeta = const VerificationMeta('orderId');
  GeneratedTextColumn _orderId;
  @override
  GeneratedTextColumn get orderId => _orderId ??= _constructOrderId();
  GeneratedTextColumn _constructOrderId() {
    return GeneratedTextColumn(
      'order_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _produkIdMeta = const VerificationMeta('produkId');
  GeneratedTextColumn _produkId;
  @override
  GeneratedTextColumn get produkId => _produkId ??= _constructProdukId();
  GeneratedTextColumn _constructProdukId() {
    return GeneratedTextColumn(
      'produk_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _kodeOrderMeta = const VerificationMeta('kodeOrder');
  GeneratedTextColumn _kodeOrder;
  @override
  GeneratedTextColumn get kodeOrder => _kodeOrder ??= _constructKodeOrder();
  GeneratedTextColumn _constructKodeOrder() {
    return GeneratedTextColumn(
      'kode_order',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalHargaMeta = const VerificationMeta('totalHarga');
  GeneratedTextColumn _totalHarga;
  @override
  GeneratedTextColumn get totalHarga => _totalHarga ??= _constructTotalHarga();
  GeneratedTextColumn _constructTotalHarga() {
    return GeneratedTextColumn(
      'total_harga',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        orderItemId,
        orderId,
        produkId,
        kodeOrder,
        userId,
        quantity,
        totalHarga,
        createdAt,
        updatedAt
      ];
  @override
  $OrderItemTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'order_item';
  @override
  final String actualTableName = 'order_item';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('order_item_id')) {
      context.handle(
          _orderItemIdMeta,
          orderItemId.isAcceptableOrUnknown(
              data['order_item_id'], _orderItemIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemIdMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id'], _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(_produkIdMeta,
          produkId.isAcceptableOrUnknown(data['produk_id'], _produkIdMeta));
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('kode_order')) {
      context.handle(_kodeOrderMeta,
          kodeOrder.isAcceptableOrUnknown(data['kode_order'], _kodeOrderMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('total_harga')) {
      context.handle(
          _totalHargaMeta,
          totalHarga.isAcceptableOrUnknown(
              data['total_harga'], _totalHargaMeta));
    } else if (isInserting) {
      context.missing(_totalHargaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderItemId};
  @override
  OrderItemData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OrderItemData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrderItemTable createAlias(String alias) {
    return $OrderItemTable(_db, alias);
  }
}

class SyncInfoData extends DataClass implements Insertable<SyncInfoData> {
  final String syncInfoId;
  final String userId;
  final String keterangan;
  final DateTime updatedAt;
  SyncInfoData(
      {@required this.syncInfoId,
      this.userId,
      this.keterangan,
      @required this.updatedAt});
  factory SyncInfoData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return SyncInfoData(
      syncInfoId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_info_id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      keterangan: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}keterangan']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || syncInfoId != null) {
      map['sync_info_id'] = Variable<String>(syncInfoId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || keterangan != null) {
      map['keterangan'] = Variable<String>(keterangan);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  SyncInfoCompanion toCompanion(bool nullToAbsent) {
    return SyncInfoCompanion(
      syncInfoId: syncInfoId == null && nullToAbsent
          ? const Value.absent()
          : Value(syncInfoId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      keterangan: keterangan == null && nullToAbsent
          ? const Value.absent()
          : Value(keterangan),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SyncInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SyncInfoData(
      syncInfoId: serializer.fromJson<String>(json['syncInfoId']),
      userId: serializer.fromJson<String>(json['userId']),
      keterangan: serializer.fromJson<String>(json['keterangan']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'syncInfoId': serializer.toJson<String>(syncInfoId),
      'userId': serializer.toJson<String>(userId),
      'keterangan': serializer.toJson<String>(keterangan),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncInfoData copyWith(
          {String syncInfoId,
          String userId,
          String keterangan,
          DateTime updatedAt}) =>
      SyncInfoData(
        syncInfoId: syncInfoId ?? this.syncInfoId,
        userId: userId ?? this.userId,
        keterangan: keterangan ?? this.keterangan,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('SyncInfoData(')
          ..write('syncInfoId: $syncInfoId, ')
          ..write('userId: $userId, ')
          ..write('keterangan: $keterangan, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(syncInfoId.hashCode,
      $mrjc(userId.hashCode, $mrjc(keterangan.hashCode, updatedAt.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SyncInfoData &&
          other.syncInfoId == this.syncInfoId &&
          other.userId == this.userId &&
          other.keterangan == this.keterangan &&
          other.updatedAt == this.updatedAt);
}

class SyncInfoCompanion extends UpdateCompanion<SyncInfoData> {
  final Value<String> syncInfoId;
  final Value<String> userId;
  final Value<String> keterangan;
  final Value<DateTime> updatedAt;
  const SyncInfoCompanion({
    this.syncInfoId = const Value.absent(),
    this.userId = const Value.absent(),
    this.keterangan = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SyncInfoCompanion.insert({
    @required String syncInfoId,
    this.userId = const Value.absent(),
    this.keterangan = const Value.absent(),
    @required DateTime updatedAt,
  })  : syncInfoId = Value(syncInfoId),
        updatedAt = Value(updatedAt);
  static Insertable<SyncInfoData> custom({
    Expression<String> syncInfoId,
    Expression<String> userId,
    Expression<String> keterangan,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (syncInfoId != null) 'sync_info_id': syncInfoId,
      if (userId != null) 'user_id': userId,
      if (keterangan != null) 'keterangan': keterangan,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SyncInfoCompanion copyWith(
      {Value<String> syncInfoId,
      Value<String> userId,
      Value<String> keterangan,
      Value<DateTime> updatedAt}) {
    return SyncInfoCompanion(
      syncInfoId: syncInfoId ?? this.syncInfoId,
      userId: userId ?? this.userId,
      keterangan: keterangan ?? this.keterangan,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (syncInfoId.present) {
      map['sync_info_id'] = Variable<String>(syncInfoId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (keterangan.present) {
      map['keterangan'] = Variable<String>(keterangan.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncInfoCompanion(')
          ..write('syncInfoId: $syncInfoId, ')
          ..write('userId: $userId, ')
          ..write('keterangan: $keterangan, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SyncInfoTable extends SyncInfo
    with TableInfo<$SyncInfoTable, SyncInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SyncInfoTable(this._db, [this._alias]);
  final VerificationMeta _syncInfoIdMeta = const VerificationMeta('syncInfoId');
  GeneratedTextColumn _syncInfoId;
  @override
  GeneratedTextColumn get syncInfoId => _syncInfoId ??= _constructSyncInfoId();
  GeneratedTextColumn _constructSyncInfoId() {
    return GeneratedTextColumn(
      'sync_info_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _keteranganMeta = const VerificationMeta('keterangan');
  GeneratedTextColumn _keterangan;
  @override
  GeneratedTextColumn get keterangan => _keterangan ??= _constructKeterangan();
  GeneratedTextColumn _constructKeterangan() {
    return GeneratedTextColumn(
      'keterangan',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [syncInfoId, userId, keterangan, updatedAt];
  @override
  $SyncInfoTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sync_info';
  @override
  final String actualTableName = 'sync_info';
  @override
  VerificationContext validateIntegrity(Insertable<SyncInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sync_info_id')) {
      context.handle(
          _syncInfoIdMeta,
          syncInfoId.isAcceptableOrUnknown(
              data['sync_info_id'], _syncInfoIdMeta));
    } else if (isInserting) {
      context.missing(_syncInfoIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    }
    if (data.containsKey('keterangan')) {
      context.handle(
          _keteranganMeta,
          keterangan.isAcceptableOrUnknown(
              data['keterangan'], _keteranganMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {syncInfoId};
  @override
  SyncInfoData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SyncInfoData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SyncInfoTable createAlias(String alias) {
    return $SyncInfoTable(_db, alias);
  }
}

class FotoVisitData extends DataClass implements Insertable<FotoVisitData> {
  final String fotoVisitId;
  final String visitId;
  final String localPath;
  final String original;
  final String modified;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  FotoVisitData(
      {@required this.fotoVisitId,
      @required this.visitId,
      @required this.localPath,
      this.original,
      this.modified,
      this.url,
      @required this.createdAt,
      @required this.updatedAt});
  factory FotoVisitData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return FotoVisitData(
      fotoVisitId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}foto_visit_id']),
      visitId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visit_id']),
      localPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}local_path']),
      original: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original']),
      modified: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}modified']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || fotoVisitId != null) {
      map['foto_visit_id'] = Variable<String>(fotoVisitId);
    }
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    if (!nullToAbsent || original != null) {
      map['original'] = Variable<String>(original);
    }
    if (!nullToAbsent || modified != null) {
      map['modified'] = Variable<String>(modified);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  FotoVisitCompanion toCompanion(bool nullToAbsent) {
    return FotoVisitCompanion(
      fotoVisitId: fotoVisitId == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoVisitId),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      original: original == null && nullToAbsent
          ? const Value.absent()
          : Value(original),
      modified: modified == null && nullToAbsent
          ? const Value.absent()
          : Value(modified),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FotoVisitData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FotoVisitData(
      fotoVisitId: serializer.fromJson<String>(json['fotoVisitId']),
      visitId: serializer.fromJson<String>(json['visitId']),
      localPath: serializer.fromJson<String>(json['localPath']),
      original: serializer.fromJson<String>(json['original']),
      modified: serializer.fromJson<String>(json['modified']),
      url: serializer.fromJson<String>(json['url']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fotoVisitId': serializer.toJson<String>(fotoVisitId),
      'visitId': serializer.toJson<String>(visitId),
      'localPath': serializer.toJson<String>(localPath),
      'original': serializer.toJson<String>(original),
      'modified': serializer.toJson<String>(modified),
      'url': serializer.toJson<String>(url),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FotoVisitData copyWith(
          {String fotoVisitId,
          String visitId,
          String localPath,
          String original,
          String modified,
          String url,
          DateTime createdAt,
          DateTime updatedAt}) =>
      FotoVisitData(
        fotoVisitId: fotoVisitId ?? this.fotoVisitId,
        visitId: visitId ?? this.visitId,
        localPath: localPath ?? this.localPath,
        original: original ?? this.original,
        modified: modified ?? this.modified,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('FotoVisitData(')
          ..write('fotoVisitId: $fotoVisitId, ')
          ..write('visitId: $visitId, ')
          ..write('localPath: $localPath, ')
          ..write('original: $original, ')
          ..write('modified: $modified, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      fotoVisitId.hashCode,
      $mrjc(
          visitId.hashCode,
          $mrjc(
              localPath.hashCode,
              $mrjc(
                  original.hashCode,
                  $mrjc(
                      modified.hashCode,
                      $mrjc(url.hashCode,
                          $mrjc(createdAt.hashCode, updatedAt.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FotoVisitData &&
          other.fotoVisitId == this.fotoVisitId &&
          other.visitId == this.visitId &&
          other.localPath == this.localPath &&
          other.original == this.original &&
          other.modified == this.modified &&
          other.url == this.url &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FotoVisitCompanion extends UpdateCompanion<FotoVisitData> {
  final Value<String> fotoVisitId;
  final Value<String> visitId;
  final Value<String> localPath;
  final Value<String> original;
  final Value<String> modified;
  final Value<String> url;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FotoVisitCompanion({
    this.fotoVisitId = const Value.absent(),
    this.visitId = const Value.absent(),
    this.localPath = const Value.absent(),
    this.original = const Value.absent(),
    this.modified = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FotoVisitCompanion.insert({
    @required String fotoVisitId,
    @required String visitId,
    @required String localPath,
    this.original = const Value.absent(),
    this.modified = const Value.absent(),
    this.url = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : fotoVisitId = Value(fotoVisitId),
        visitId = Value(visitId),
        localPath = Value(localPath),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FotoVisitData> custom({
    Expression<String> fotoVisitId,
    Expression<String> visitId,
    Expression<String> localPath,
    Expression<String> original,
    Expression<String> modified,
    Expression<String> url,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (fotoVisitId != null) 'foto_visit_id': fotoVisitId,
      if (visitId != null) 'visit_id': visitId,
      if (localPath != null) 'local_path': localPath,
      if (original != null) 'original': original,
      if (modified != null) 'modified': modified,
      if (url != null) 'url': url,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FotoVisitCompanion copyWith(
      {Value<String> fotoVisitId,
      Value<String> visitId,
      Value<String> localPath,
      Value<String> original,
      Value<String> modified,
      Value<String> url,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return FotoVisitCompanion(
      fotoVisitId: fotoVisitId ?? this.fotoVisitId,
      visitId: visitId ?? this.visitId,
      localPath: localPath ?? this.localPath,
      original: original ?? this.original,
      modified: modified ?? this.modified,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fotoVisitId.present) {
      map['foto_visit_id'] = Variable<String>(fotoVisitId.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (original.present) {
      map['original'] = Variable<String>(original.value);
    }
    if (modified.present) {
      map['modified'] = Variable<String>(modified.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FotoVisitCompanion(')
          ..write('fotoVisitId: $fotoVisitId, ')
          ..write('visitId: $visitId, ')
          ..write('localPath: $localPath, ')
          ..write('original: $original, ')
          ..write('modified: $modified, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FotoVisitTable extends FotoVisit
    with TableInfo<$FotoVisitTable, FotoVisitData> {
  final GeneratedDatabase _db;
  final String _alias;
  $FotoVisitTable(this._db, [this._alias]);
  final VerificationMeta _fotoVisitIdMeta =
      const VerificationMeta('fotoVisitId');
  GeneratedTextColumn _fotoVisitId;
  @override
  GeneratedTextColumn get fotoVisitId =>
      _fotoVisitId ??= _constructFotoVisitId();
  GeneratedTextColumn _constructFotoVisitId() {
    return GeneratedTextColumn(
      'foto_visit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visitIdMeta = const VerificationMeta('visitId');
  GeneratedTextColumn _visitId;
  @override
  GeneratedTextColumn get visitId => _visitId ??= _constructVisitId();
  GeneratedTextColumn _constructVisitId() {
    return GeneratedTextColumn(
      'visit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _localPathMeta = const VerificationMeta('localPath');
  GeneratedTextColumn _localPath;
  @override
  GeneratedTextColumn get localPath => _localPath ??= _constructLocalPath();
  GeneratedTextColumn _constructLocalPath() {
    return GeneratedTextColumn(
      'local_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originalMeta = const VerificationMeta('original');
  GeneratedTextColumn _original;
  @override
  GeneratedTextColumn get original => _original ??= _constructOriginal();
  GeneratedTextColumn _constructOriginal() {
    return GeneratedTextColumn(
      'original',
      $tableName,
      true,
    );
  }

  final VerificationMeta _modifiedMeta = const VerificationMeta('modified');
  GeneratedTextColumn _modified;
  @override
  GeneratedTextColumn get modified => _modified ??= _constructModified();
  GeneratedTextColumn _constructModified() {
    return GeneratedTextColumn(
      'modified',
      $tableName,
      true,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        fotoVisitId,
        visitId,
        localPath,
        original,
        modified,
        url,
        createdAt,
        updatedAt
      ];
  @override
  $FotoVisitTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foto_visit';
  @override
  final String actualTableName = 'foto_visit';
  @override
  VerificationContext validateIntegrity(Insertable<FotoVisitData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('foto_visit_id')) {
      context.handle(
          _fotoVisitIdMeta,
          fotoVisitId.isAcceptableOrUnknown(
              data['foto_visit_id'], _fotoVisitIdMeta));
    } else if (isInserting) {
      context.missing(_fotoVisitIdMeta);
    }
    if (data.containsKey('visit_id')) {
      context.handle(_visitIdMeta,
          visitId.isAcceptableOrUnknown(data['visit_id'], _visitIdMeta));
    } else if (isInserting) {
      context.missing(_visitIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path'], _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('original')) {
      context.handle(_originalMeta,
          original.isAcceptableOrUnknown(data['original'], _originalMeta));
    }
    if (data.containsKey('modified')) {
      context.handle(_modifiedMeta,
          modified.isAcceptableOrUnknown(data['modified'], _modifiedMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fotoVisitId};
  @override
  FotoVisitData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FotoVisitData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FotoVisitTable createAlias(String alias) {
    return $FotoVisitTable(_db, alias);
  }
}

abstract class _$NexDatabase extends GeneratedDatabase {
  _$NexDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $ProdukTable _produk;
  $ProdukTable get produk => _produk ??= $ProdukTable(this);
  $TrukTable _truk;
  $TrukTable get truk => _truk ??= $TrukTable(this);
  $StokTable _stok;
  $StokTable get stok => _stok ??= $StokTable(this);
  $OutletTable _outlet;
  $OutletTable get outlet => _outlet ??= $OutletTable(this);
  $SyncRuleTableTable _syncRuleTable;
  $SyncRuleTableTable get syncRuleTable =>
      _syncRuleTable ??= $SyncRuleTableTable(this);
  $JadwalTable _jadwal;
  $JadwalTable get jadwal => _jadwal ??= $JadwalTable(this);
  $VisitTable _visit;
  $VisitTable get visit => _visit ??= $VisitTable(this);
  $SalesTable _sales;
  $SalesTable get sales => _sales ??= $SalesTable(this);
  $OrderItemTable _orderItem;
  $OrderItemTable get orderItem => _orderItem ??= $OrderItemTable(this);
  $SyncInfoTable _syncInfo;
  $SyncInfoTable get syncInfo => _syncInfo ??= $SyncInfoTable(this);
  $FotoVisitTable _fotoVisit;
  $FotoVisitTable get fotoVisit => _fotoVisit ??= $FotoVisitTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as NexDatabase);
  ProdukDao _produkDao;
  ProdukDao get produkDao => _produkDao ??= ProdukDao(this as NexDatabase);
  TrukDao _trukDao;
  TrukDao get trukDao => _trukDao ??= TrukDao(this as NexDatabase);
  StokDao _stokDao;
  StokDao get stokDao => _stokDao ??= StokDao(this as NexDatabase);
  OutletDao _outletDao;
  OutletDao get outletDao => _outletDao ??= OutletDao(this as NexDatabase);
  SyncRuleDao _syncRuleDao;
  SyncRuleDao get syncRuleDao =>
      _syncRuleDao ??= SyncRuleDao(this as NexDatabase);
  JadwalDao _jadwalDao;
  JadwalDao get jadwalDao => _jadwalDao ??= JadwalDao(this as NexDatabase);
  VisitDao _visitDao;
  VisitDao get visitDao => _visitDao ??= VisitDao(this as NexDatabase);
  OrderDao _orderDao;
  OrderDao get orderDao => _orderDao ??= OrderDao(this as NexDatabase);
  OrderItemDao _orderItemDao;
  OrderItemDao get orderItemDao =>
      _orderItemDao ??= OrderItemDao(this as NexDatabase);
  SyncInfoDao _syncInfoDao;
  SyncInfoDao get syncInfoDao =>
      _syncInfoDao ??= SyncInfoDao(this as NexDatabase);
  FotoVisitDao _fotoVisitDao;
  FotoVisitDao get fotoVisitDao =>
      _fotoVisitDao ??= FotoVisitDao(this as NexDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        produk,
        truk,
        stok,
        outlet,
        syncRuleTable,
        jadwal,
        visit,
        sales,
        orderItem,
        syncInfo,
        fotoVisit
      ];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$FotoVisitDaoMixin on DatabaseAccessor<NexDatabase> {
  $FotoVisitTable get fotoVisit => attachedDatabase.fotoVisit;
}
mixin _$SyncInfoDaoMixin on DatabaseAccessor<NexDatabase> {
  $SyncInfoTable get syncInfo => attachedDatabase.syncInfo;
}
mixin _$JadwalDaoMixin on DatabaseAccessor<NexDatabase> {
  $JadwalTable get jadwal => attachedDatabase.jadwal;
  $OutletTable get outlet => attachedDatabase.outlet;
  Selectable<JadwalWithOutletResult> _jadwalWithOutlet(
      String var1, String var2) {
    return customSelect(
        'SELECT j.*, o.barcode, o.outlet_name, o.address, o.phone, o.owner, o.lat, o.lng, o.user FROM jadwal j LEFT JOIN outlet o ON j.outlet_id = o.outlet_id WHERE j.user_id = ? AND date(j.created_at) = date(?) ORDER BY j.visit DESC',
        variables: [Variable.withString(var1), Variable.withString(var2)],
        readsFrom: {outlet, jadwal}).map((QueryRow row) {
      return JadwalWithOutletResult(
        jadwalId: row.readString('jadwal_id'),
        userId: row.readString('user_id'),
        outletId: row.readString('outlet_id'),
        tanggal: row.readString('tanggal'),
        visit: row.readInt('visit'),
        createdAt: row.readString('created_at'),
        updatedAt: row.readString('updated_at'),
        barcode: row.readString('barcode'),
        outletName: row.readString('outlet_name'),
        address: row.readString('address'),
        phone: row.readString('phone'),
        owner: row.readString('owner'),
        lat: row.readString('lat'),
        lng: row.readString('lng'),
        user: row.readString('user'),
      );
    });
  }
}

class JadwalWithOutletResult {
  final String jadwalId;
  final String userId;
  final String outletId;
  final String tanggal;
  final int visit;
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String outletName;
  final String address;
  final String phone;
  final String owner;
  final String lat;
  final String lng;
  final String user;
  JadwalWithOutletResult({
    this.jadwalId,
    this.userId,
    this.outletId,
    this.tanggal,
    this.visit,
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.outletName,
    this.address,
    this.phone,
    this.owner,
    this.lat,
    this.lng,
    this.user,
  });
}

mixin _$VisitDaoMixin on DatabaseAccessor<NexDatabase> {
  $VisitTable get visit => attachedDatabase.visit;
  $OutletTable get outlet => attachedDatabase.outlet;
  Selectable<VisitWithOutletResult> _visitWithOutlet(
      String var1, String keyword, String var3, String var4) {
    return customSelect(
        'SELECT v.*, o.outlet_name, o.barcode, o.user FROM visit v LEFT JOIN outlet o ON v.outlet_id = o.outlet_id WHERE v.user_id = ? AND o.outlet_name LIKE :keyword AND date(v.created_at) >= date(?) AND date(v.created_at) <= date(?) ORDER BY v.created_at DESC',
        variables: [
          Variable.withString(var1),
          Variable.withString(keyword),
          Variable.withString(var3),
          Variable.withString(var4)
        ],
        readsFrom: {
          outlet,
          visit
        }).map((QueryRow row) {
      return VisitWithOutletResult(
        visitId: row.readString('visit_id'),
        orderId: row.readString('order_id'),
        kodeVisit: row.readString('kode_visit'),
        userId: row.readString('user_id'),
        outletId: row.readString('outlet_id'),
        lat: row.readString('lat'),
        lng: row.readString('lng'),
        tutup: row.readInt('tutup'),
        status: row.readString('status'),
        isPosted: row.readInt('is_posted'),
        createdAt: row.readString('created_at'),
        updatedAt: row.readString('updated_at'),
        outletName: row.readString('outlet_name'),
        barcode: row.readString('barcode'),
        user: row.readString('user'),
      );
    });
  }

  Selectable<VisitData> _getVisitToday(String var1, String var2, String var3) {
    return customSelect(
        'SELECT * FROM visit WHERE date(created_at) = date(?) AND user_id = ? AND outlet_id = ?',
        variables: [
          Variable.withString(var1),
          Variable.withString(var2),
          Variable.withString(var3)
        ],
        readsFrom: {
          visit
        }).map(visit.mapFromRow);
  }
}

class VisitWithOutletResult {
  final String visitId;
  final String orderId;
  final String kodeVisit;
  final String userId;
  final String outletId;
  final String lat;
  final String lng;
  final int tutup;
  final String status;
  final int isPosted;
  final String createdAt;
  final String updatedAt;
  final String outletName;
  final String barcode;
  final String user;
  VisitWithOutletResult({
    this.visitId,
    this.orderId,
    this.kodeVisit,
    this.userId,
    this.outletId,
    this.lat,
    this.lng,
    this.tutup,
    this.status,
    this.isPosted,
    this.createdAt,
    this.updatedAt,
    this.outletName,
    this.barcode,
    this.user,
  });
}

mixin _$OrderDaoMixin on DatabaseAccessor<NexDatabase> {
  $SalesTable get sales => attachedDatabase.sales;
  $OutletTable get outlet => attachedDatabase.outlet;
  Selectable<FetchOrderResult> _fetchOrder(
      String var1, String var2, String var3, String var4) {
    return customSelect(
        'SELECT o.*, l.user, l.outlet_name, l.lat, l.lng, l.owner, l.phone FROM sales o LEFT JOIN outlet l ON o.outlet_id = l.outlet_id WHERE date(o.created_at) >= date(?) AND date(o.created_at) <= date(?) AND o.po_user_id = ? AND l.outlet_name LIKE ? ORDER BY o.created_at DESC',
        variables: [
          Variable.withString(var1),
          Variable.withString(var2),
          Variable.withString(var3),
          Variable.withString(var4)
        ],
        readsFrom: {
          outlet,
          sales
        }).map((QueryRow row) {
      return FetchOrderResult(
        orderId: row.readString('order_id'),
        outletId: row.readString('outlet_id'),
        visitId: row.readString('visit_id'),
        barcode: row.readString('barcode'),
        kodeOrder: row.readString('kode_order'),
        nomorPO: row.readString('nomor_p_o'),
        nomorFaktur: row.readString('nomor_faktur'),
        poUserId: row.readString('po_user_id'),
        fakturUserId: row.readString('faktur_user_id'),
        status: row.readString('status'),
        totalBayar: row.readString('total_bayar'),
        pembayaran: row.readString('pembayaran'),
        createdAt: row.readString('created_at'),
        updatedAt: row.readString('updated_at'),
        user: row.readString('user'),
        outletName: row.readString('outlet_name'),
        lat: row.readString('lat'),
        lng: row.readString('lng'),
        owner: row.readString('owner'),
        phone: row.readString('phone'),
      );
    });
  }
}

class FetchOrderResult {
  final String orderId;
  final String outletId;
  final String visitId;
  final String barcode;
  final String kodeOrder;
  final String nomorPO;
  final String nomorFaktur;
  final String poUserId;
  final String fakturUserId;
  final String status;
  final String totalBayar;
  final String pembayaran;
  final String createdAt;
  final String updatedAt;
  final String user;
  final String outletName;
  final String lat;
  final String lng;
  final String owner;
  final String phone;
  FetchOrderResult({
    this.orderId,
    this.outletId,
    this.visitId,
    this.barcode,
    this.kodeOrder,
    this.nomorPO,
    this.nomorFaktur,
    this.poUserId,
    this.fakturUserId,
    this.status,
    this.totalBayar,
    this.pembayaran,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.outletName,
    this.lat,
    this.lng,
    this.owner,
    this.phone,
  });
}

mixin _$OrderItemDaoMixin on DatabaseAccessor<NexDatabase> {
  $OrderItemTable get orderItem => attachedDatabase.orderItem;
  $ProdukTable get produk => attachedDatabase.produk;
  Selectable<FetchJoinedOrderItemResult> _fetchJoinedOrderItem(String var1) {
    return customSelect(
        'SELECT i.*, p.nama, p.harga, p.stok, p.kode, p.aktif FROM order_item i INNER JOIN produk p ON i.produk_id = p.produk_id WHERE i.order_id = ?',
        variables: [Variable.withString(var1)],
        readsFrom: {produk, orderItem}).map((QueryRow row) {
      return FetchJoinedOrderItemResult(
        orderItemId: row.readString('order_item_id'),
        orderId: row.readString('order_id'),
        produkId: row.readString('produk_id'),
        kodeOrder: row.readString('kode_order'),
        userId: row.readString('user_id'),
        quantity: row.readInt('quantity'),
        totalHarga: row.readString('total_harga'),
        createdAt: row.readString('created_at'),
        updatedAt: row.readString('updated_at'),
        nama: row.readString('nama'),
        harga: row.readString('harga'),
        stok: row.readInt('stok'),
        kode: row.readString('kode'),
        aktif: row.readBool('aktif'),
      );
    });
  }
}

class FetchJoinedOrderItemResult {
  final String orderItemId;
  final String orderId;
  final String produkId;
  final String kodeOrder;
  final String userId;
  final int quantity;
  final String totalHarga;
  final String createdAt;
  final String updatedAt;
  final String nama;
  final String harga;
  final int stok;
  final String kode;
  final bool aktif;
  FetchJoinedOrderItemResult({
    this.orderItemId,
    this.orderId,
    this.produkId,
    this.kodeOrder,
    this.userId,
    this.quantity,
    this.totalHarga,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.harga,
    this.stok,
    this.kode,
    this.aktif,
  });
}

mixin _$SyncRuleDaoMixin on DatabaseAccessor<NexDatabase> {
  $SyncRuleTableTable get syncRuleTable => attachedDatabase.syncRuleTable;
}
mixin _$UserDaoMixin on DatabaseAccessor<NexDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
mixin _$ProdukDaoMixin on DatabaseAccessor<NexDatabase> {
  $ProdukTable get produk => attachedDatabase.produk;
}
mixin _$StokDaoMixin on DatabaseAccessor<NexDatabase> {
  $StokTable get stok => attachedDatabase.stok;
  $ProdukTable get produk => attachedDatabase.produk;
  Selectable<StokWithProductResult> _stokWithProduct(String var1, String var2) {
    return customSelect(
        'SELECT s.*, p.kode, p.nama, p.harga, p.aktif, p.stok FROM stok s LEFT JOIN produk p ON s.produk_id = p.produk_id WHERE s.truk_id = ? AND p.nama LIKE ? ORDER BY p.nama ASC',
        variables: [Variable.withString(var1), Variable.withString(var2)],
        readsFrom: {produk, stok}).map((QueryRow row) {
      return StokWithProductResult(
        trukId: row.readString('truk_id'),
        stokId: row.readString('stok_id'),
        produkId: row.readString('produk_id'),
        quantity: row.readInt('quantity'),
        createdAt: row.readString('created_at'),
        updatedAt: row.readString('updated_at'),
        kode: row.readString('kode'),
        nama: row.readString('nama'),
        harga: row.readString('harga'),
        aktif: row.readBool('aktif'),
        stok: row.readInt('stok'),
      );
    });
  }
}

class StokWithProductResult {
  final String trukId;
  final String stokId;
  final String produkId;
  final int quantity;
  final String createdAt;
  final String updatedAt;
  final String kode;
  final String nama;
  final String harga;
  final bool aktif;
  final int stok;
  StokWithProductResult({
    this.trukId,
    this.stokId,
    this.produkId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.kode,
    this.nama,
    this.harga,
    this.aktif,
    this.stok,
  });
}

mixin _$TrukDaoMixin on DatabaseAccessor<NexDatabase> {
  $TrukTable get truk => attachedDatabase.truk;
  $StokTable get stok => attachedDatabase.stok;
  Selectable<TrukWithStokSumResult> _trukWithStokSum() {
    return customSelect(
        'SELECT t.*, SUM(s.quantity) as total_stok FROM truk t JOIN stok s ON t.truk_id = s.truk_id GROUP BY t.truk_id',
        variables: [],
        readsFrom: {stok, truk}).map((QueryRow row) {
      return TrukWithStokSumResult(
        trukId: row.readString('truk_id'),
        nomorPlat: row.readString('nomor_plat'),
        brand: row.readString('brand'),
        createdAt: row.readString('created_at'),
        updatedAt: row.readString('updated_at'),
        totalStok: row.readInt('total_stok'),
      );
    });
  }
}

class TrukWithStokSumResult {
  final String trukId;
  final String nomorPlat;
  final String brand;
  final String createdAt;
  final String updatedAt;
  final int totalStok;
  TrukWithStokSumResult({
    this.trukId,
    this.nomorPlat,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.totalStok,
  });
}

mixin _$OutletDaoMixin on DatabaseAccessor<NexDatabase> {
  $OutletTable get outlet => attachedDatabase.outlet;
}
