// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nex_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final String nomorPlat;
  final String username;
  final String password;
  final String type;
  final String token;
  final String hid;
  User(
      {@required this.id,
      this.nomorPlat,
      @required this.username,
      this.password,
      @required this.type,
      @required this.token,
      @required this.hid});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nomorPlat: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomor_plat']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
      hid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}hid']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || nomorPlat != null) {
      map['nomor_plat'] = Variable<String>(nomorPlat);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || hid != null) {
      map['hid'] = Variable<String>(hid);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nomorPlat: nomorPlat == null && nullToAbsent
          ? const Value.absent()
          : Value(nomorPlat),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      hid: hid == null && nullToAbsent ? const Value.absent() : Value(hid),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      nomorPlat: serializer.fromJson<String>(json['nomorPlat']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      type: serializer.fromJson<String>(json['type']),
      token: serializer.fromJson<String>(json['token']),
      hid: serializer.fromJson<String>(json['hid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nomorPlat': serializer.toJson<String>(nomorPlat),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'type': serializer.toJson<String>(type),
      'token': serializer.toJson<String>(token),
      'hid': serializer.toJson<String>(hid),
    };
  }

  User copyWith(
          {int id,
          String nomorPlat,
          String username,
          String password,
          String type,
          String token,
          String hid}) =>
      User(
        id: id ?? this.id,
        nomorPlat: nomorPlat ?? this.nomorPlat,
        username: username ?? this.username,
        password: password ?? this.password,
        type: type ?? this.type,
        token: token ?? this.token,
        hid: hid ?? this.hid,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('nomorPlat: $nomorPlat, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('type: $type, ')
          ..write('token: $token, ')
          ..write('hid: $hid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nomorPlat.hashCode,
          $mrjc(
              username.hashCode,
              $mrjc(
                  password.hashCode,
                  $mrjc(
                      type.hashCode, $mrjc(token.hashCode, hid.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.nomorPlat == this.nomorPlat &&
          other.username == this.username &&
          other.password == this.password &&
          other.type == this.type &&
          other.token == this.token &&
          other.hid == this.hid);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> nomorPlat;
  final Value<String> username;
  final Value<String> password;
  final Value<String> type;
  final Value<String> token;
  final Value<String> hid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.nomorPlat = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.type = const Value.absent(),
    this.token = const Value.absent(),
    this.hid = const Value.absent(),
  });
  UsersCompanion.insert({
    @required int id,
    this.nomorPlat = const Value.absent(),
    @required String username,
    this.password = const Value.absent(),
    @required String type,
    @required String token,
    @required String hid,
  })  : id = Value(id),
        username = Value(username),
        type = Value(type),
        token = Value(token),
        hid = Value(hid);
  static Insertable<User> custom({
    Expression<int> id,
    Expression<String> nomorPlat,
    Expression<String> username,
    Expression<String> password,
    Expression<String> type,
    Expression<String> token,
    Expression<String> hid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nomorPlat != null) 'nomor_plat': nomorPlat,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (type != null) 'type': type,
      if (token != null) 'token': token,
      if (hid != null) 'hid': hid,
    });
  }

  UsersCompanion copyWith(
      {Value<int> id,
      Value<String> nomorPlat,
      Value<String> username,
      Value<String> password,
      Value<String> type,
      Value<String> token,
      Value<String> hid}) {
    return UsersCompanion(
      id: id ?? this.id,
      nomorPlat: nomorPlat ?? this.nomorPlat,
      username: username ?? this.username,
      password: password ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
      hid: hid ?? this.hid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nomorPlat.present) {
      map['nomor_plat'] = Variable<String>(nomorPlat.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (hid.present) {
      map['hid'] = Variable<String>(hid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('nomorPlat: $nomorPlat, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('type: $type, ')
          ..write('token: $token, ')
          ..write('hid: $hid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
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
      true,
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

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      true,
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

  final VerificationMeta _hidMeta = const VerificationMeta('hid');
  GeneratedTextColumn _hid;
  @override
  GeneratedTextColumn get hid => _hid ??= _constructHid();
  GeneratedTextColumn _constructHid() {
    return GeneratedTextColumn(
      'hid',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, nomorPlat, username, password, type, token, hid];
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nomor_plat')) {
      context.handle(_nomorPlatMeta,
          nomorPlat.isAcceptableOrUnknown(data['nomor_plat'], _nomorPlatMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password'], _passwordMeta));
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
    if (data.containsKey('hid')) {
      context.handle(
          _hidMeta, hid.isAcceptableOrUnknown(data['hid'], _hidMeta));
    } else if (isInserting) {
      context.missing(_hidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
  final int id;
  final String kode;
  final String nama;
  final String harga;
  final bool aktif;
  final DateTime syncDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  ProdukData(
      {@required this.id,
      @required this.kode,
      @required this.nama,
      @required this.harga,
      @required this.aktif,
      this.syncDate,
      @required this.createdAt,
      @required this.updatedAt});
  factory ProdukData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ProdukData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      kode: stringType.mapFromDatabaseResponse(data['${effectivePrefix}kode']),
      nama: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nama']),
      harga:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}harga']),
      aktif: boolType.mapFromDatabaseResponse(data['${effectivePrefix}aktif']),
      syncDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
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
    if (!nullToAbsent || aktif != null) {
      map['aktif'] = Variable<bool>(aktif);
    }
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<DateTime>(syncDate);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ProdukCompanion toCompanion(bool nullToAbsent) {
    return ProdukCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      kode: kode == null && nullToAbsent ? const Value.absent() : Value(kode),
      nama: nama == null && nullToAbsent ? const Value.absent() : Value(nama),
      harga:
          harga == null && nullToAbsent ? const Value.absent() : Value(harga),
      aktif:
          aktif == null && nullToAbsent ? const Value.absent() : Value(aktif),
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
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
      id: serializer.fromJson<int>(json['id']),
      kode: serializer.fromJson<String>(json['kode']),
      nama: serializer.fromJson<String>(json['nama']),
      harga: serializer.fromJson<String>(json['harga']),
      aktif: serializer.fromJson<bool>(json['aktif']),
      syncDate: serializer.fromJson<DateTime>(json['syncDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kode': serializer.toJson<String>(kode),
      'nama': serializer.toJson<String>(nama),
      'harga': serializer.toJson<String>(harga),
      'aktif': serializer.toJson<bool>(aktif),
      'syncDate': serializer.toJson<DateTime>(syncDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProdukData copyWith(
          {int id,
          String kode,
          String nama,
          String harga,
          bool aktif,
          DateTime syncDate,
          DateTime createdAt,
          DateTime updatedAt}) =>
      ProdukData(
        id: id ?? this.id,
        kode: kode ?? this.kode,
        nama: nama ?? this.nama,
        harga: harga ?? this.harga,
        aktif: aktif ?? this.aktif,
        syncDate: syncDate ?? this.syncDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ProdukData(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('harga: $harga, ')
          ..write('aktif: $aktif, ')
          ..write('syncDate: $syncDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          kode.hashCode,
          $mrjc(
              nama.hashCode,
              $mrjc(
                  harga.hashCode,
                  $mrjc(
                      aktif.hashCode,
                      $mrjc(syncDate.hashCode,
                          $mrjc(createdAt.hashCode, updatedAt.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProdukData &&
          other.id == this.id &&
          other.kode == this.kode &&
          other.nama == this.nama &&
          other.harga == this.harga &&
          other.aktif == this.aktif &&
          other.syncDate == this.syncDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProdukCompanion extends UpdateCompanion<ProdukData> {
  final Value<int> id;
  final Value<String> kode;
  final Value<String> nama;
  final Value<String> harga;
  final Value<bool> aktif;
  final Value<DateTime> syncDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProdukCompanion({
    this.id = const Value.absent(),
    this.kode = const Value.absent(),
    this.nama = const Value.absent(),
    this.harga = const Value.absent(),
    this.aktif = const Value.absent(),
    this.syncDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProdukCompanion.insert({
    @required int id,
    @required String kode,
    @required String nama,
    @required String harga,
    this.aktif = const Value.absent(),
    this.syncDate = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : id = Value(id),
        kode = Value(kode),
        nama = Value(nama),
        harga = Value(harga),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProdukData> custom({
    Expression<int> id,
    Expression<String> kode,
    Expression<String> nama,
    Expression<String> harga,
    Expression<bool> aktif,
    Expression<DateTime> syncDate,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kode != null) 'kode': kode,
      if (nama != null) 'nama': nama,
      if (harga != null) 'harga': harga,
      if (aktif != null) 'aktif': aktif,
      if (syncDate != null) 'sync_date': syncDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProdukCompanion copyWith(
      {Value<int> id,
      Value<String> kode,
      Value<String> nama,
      Value<String> harga,
      Value<bool> aktif,
      Value<DateTime> syncDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return ProdukCompanion(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      aktif: aktif ?? this.aktif,
      syncDate: syncDate ?? this.syncDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (aktif.present) {
      map['aktif'] = Variable<bool>(aktif.value);
    }
    if (syncDate.present) {
      map['sync_date'] = Variable<DateTime>(syncDate.value);
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
    return (StringBuffer('ProdukCompanion(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('harga: $harga, ')
          ..write('aktif: $aktif, ')
          ..write('syncDate: $syncDate, ')
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
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

  final VerificationMeta _aktifMeta = const VerificationMeta('aktif');
  GeneratedBoolColumn _aktif;
  @override
  GeneratedBoolColumn get aktif => _aktif ??= _constructAktif();
  GeneratedBoolColumn _constructAktif() {
    return GeneratedBoolColumn('aktif', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  GeneratedDateTimeColumn _syncDate;
  @override
  GeneratedDateTimeColumn get syncDate => _syncDate ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
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
  List<GeneratedColumn> get $columns =>
      [id, kode, nama, harga, aktif, syncDate, createdAt, updatedAt];
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('aktif')) {
      context.handle(
          _aktifMeta, aktif.isAcceptableOrUnknown(data['aktif'], _aktifMeta));
    }
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date'], _syncDateMeta));
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
  final int id;
  final String nomorPlat;
  final String brand;
  final DateTime syncDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  TrukData(
      {@required this.id,
      @required this.nomorPlat,
      @required this.brand,
      this.syncDate,
      @required this.createdAt,
      @required this.updatedAt});
  factory TrukData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return TrukData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nomorPlat: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomor_plat']),
      brand:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}brand']),
      syncDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || nomorPlat != null) {
      map['nomor_plat'] = Variable<String>(nomorPlat);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<DateTime>(syncDate);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TrukCompanion toCompanion(bool nullToAbsent) {
    return TrukCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nomorPlat: nomorPlat == null && nullToAbsent
          ? const Value.absent()
          : Value(nomorPlat),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
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
      id: serializer.fromJson<int>(json['id']),
      nomorPlat: serializer.fromJson<String>(json['nomorPlat']),
      brand: serializer.fromJson<String>(json['brand']),
      syncDate: serializer.fromJson<DateTime>(json['syncDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nomorPlat': serializer.toJson<String>(nomorPlat),
      'brand': serializer.toJson<String>(brand),
      'syncDate': serializer.toJson<DateTime>(syncDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TrukData copyWith(
          {int id,
          String nomorPlat,
          String brand,
          DateTime syncDate,
          DateTime createdAt,
          DateTime updatedAt}) =>
      TrukData(
        id: id ?? this.id,
        nomorPlat: nomorPlat ?? this.nomorPlat,
        brand: brand ?? this.brand,
        syncDate: syncDate ?? this.syncDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TrukData(')
          ..write('id: $id, ')
          ..write('nomorPlat: $nomorPlat, ')
          ..write('brand: $brand, ')
          ..write('syncDate: $syncDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nomorPlat.hashCode,
          $mrjc(
              brand.hashCode,
              $mrjc(syncDate.hashCode,
                  $mrjc(createdAt.hashCode, updatedAt.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TrukData &&
          other.id == this.id &&
          other.nomorPlat == this.nomorPlat &&
          other.brand == this.brand &&
          other.syncDate == this.syncDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TrukCompanion extends UpdateCompanion<TrukData> {
  final Value<int> id;
  final Value<String> nomorPlat;
  final Value<String> brand;
  final Value<DateTime> syncDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TrukCompanion({
    this.id = const Value.absent(),
    this.nomorPlat = const Value.absent(),
    this.brand = const Value.absent(),
    this.syncDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TrukCompanion.insert({
    @required int id,
    @required String nomorPlat,
    @required String brand,
    this.syncDate = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : id = Value(id),
        nomorPlat = Value(nomorPlat),
        brand = Value(brand),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrukData> custom({
    Expression<int> id,
    Expression<String> nomorPlat,
    Expression<String> brand,
    Expression<DateTime> syncDate,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nomorPlat != null) 'nomor_plat': nomorPlat,
      if (brand != null) 'brand': brand,
      if (syncDate != null) 'sync_date': syncDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TrukCompanion copyWith(
      {Value<int> id,
      Value<String> nomorPlat,
      Value<String> brand,
      Value<DateTime> syncDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return TrukCompanion(
      id: id ?? this.id,
      nomorPlat: nomorPlat ?? this.nomorPlat,
      brand: brand ?? this.brand,
      syncDate: syncDate ?? this.syncDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nomorPlat.present) {
      map['nomor_plat'] = Variable<String>(nomorPlat.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (syncDate.present) {
      map['sync_date'] = Variable<DateTime>(syncDate.value);
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
    return (StringBuffer('TrukCompanion(')
          ..write('id: $id, ')
          ..write('nomorPlat: $nomorPlat, ')
          ..write('brand: $brand, ')
          ..write('syncDate: $syncDate, ')
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
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

  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  GeneratedDateTimeColumn _syncDate;
  @override
  GeneratedDateTimeColumn get syncDate => _syncDate ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
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
  List<GeneratedColumn> get $columns =>
      [id, nomorPlat, brand, syncDate, createdAt, updatedAt];
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date'], _syncDateMeta));
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
  final int id;
  final int trukId;
  final int userId;
  final String namaProduk;
  final int quantity;
  final DateTime syncDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  StokData(
      {@required this.id,
      @required this.trukId,
      @required this.userId,
      @required this.namaProduk,
      @required this.quantity,
      this.syncDate,
      @required this.createdAt,
      @required this.updatedAt});
  factory StokData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return StokData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      trukId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}truk_id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      namaProduk: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nama_produk']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      syncDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || trukId != null) {
      map['truk_id'] = Variable<int>(trukId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || namaProduk != null) {
      map['nama_produk'] = Variable<String>(namaProduk);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<DateTime>(syncDate);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  StokCompanion toCompanion(bool nullToAbsent) {
    return StokCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      trukId:
          trukId == null && nullToAbsent ? const Value.absent() : Value(trukId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      namaProduk: namaProduk == null && nullToAbsent
          ? const Value.absent()
          : Value(namaProduk),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
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
      id: serializer.fromJson<int>(json['id']),
      trukId: serializer.fromJson<int>(json['trukId']),
      userId: serializer.fromJson<int>(json['userId']),
      namaProduk: serializer.fromJson<String>(json['namaProduk']),
      quantity: serializer.fromJson<int>(json['quantity']),
      syncDate: serializer.fromJson<DateTime>(json['syncDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trukId': serializer.toJson<int>(trukId),
      'userId': serializer.toJson<int>(userId),
      'namaProduk': serializer.toJson<String>(namaProduk),
      'quantity': serializer.toJson<int>(quantity),
      'syncDate': serializer.toJson<DateTime>(syncDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StokData copyWith(
          {int id,
          int trukId,
          int userId,
          String namaProduk,
          int quantity,
          DateTime syncDate,
          DateTime createdAt,
          DateTime updatedAt}) =>
      StokData(
        id: id ?? this.id,
        trukId: trukId ?? this.trukId,
        userId: userId ?? this.userId,
        namaProduk: namaProduk ?? this.namaProduk,
        quantity: quantity ?? this.quantity,
        syncDate: syncDate ?? this.syncDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('StokData(')
          ..write('id: $id, ')
          ..write('trukId: $trukId, ')
          ..write('userId: $userId, ')
          ..write('namaProduk: $namaProduk, ')
          ..write('quantity: $quantity, ')
          ..write('syncDate: $syncDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          trukId.hashCode,
          $mrjc(
              userId.hashCode,
              $mrjc(
                  namaProduk.hashCode,
                  $mrjc(
                      quantity.hashCode,
                      $mrjc(syncDate.hashCode,
                          $mrjc(createdAt.hashCode, updatedAt.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StokData &&
          other.id == this.id &&
          other.trukId == this.trukId &&
          other.userId == this.userId &&
          other.namaProduk == this.namaProduk &&
          other.quantity == this.quantity &&
          other.syncDate == this.syncDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StokCompanion extends UpdateCompanion<StokData> {
  final Value<int> id;
  final Value<int> trukId;
  final Value<int> userId;
  final Value<String> namaProduk;
  final Value<int> quantity;
  final Value<DateTime> syncDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StokCompanion({
    this.id = const Value.absent(),
    this.trukId = const Value.absent(),
    this.userId = const Value.absent(),
    this.namaProduk = const Value.absent(),
    this.quantity = const Value.absent(),
    this.syncDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StokCompanion.insert({
    this.id = const Value.absent(),
    @required int trukId,
    @required int userId,
    @required String namaProduk,
    @required int quantity,
    this.syncDate = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : trukId = Value(trukId),
        userId = Value(userId),
        namaProduk = Value(namaProduk),
        quantity = Value(quantity),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<StokData> custom({
    Expression<int> id,
    Expression<int> trukId,
    Expression<int> userId,
    Expression<String> namaProduk,
    Expression<int> quantity,
    Expression<DateTime> syncDate,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trukId != null) 'truk_id': trukId,
      if (userId != null) 'user_id': userId,
      if (namaProduk != null) 'nama_produk': namaProduk,
      if (quantity != null) 'quantity': quantity,
      if (syncDate != null) 'sync_date': syncDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StokCompanion copyWith(
      {Value<int> id,
      Value<int> trukId,
      Value<int> userId,
      Value<String> namaProduk,
      Value<int> quantity,
      Value<DateTime> syncDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return StokCompanion(
      id: id ?? this.id,
      trukId: trukId ?? this.trukId,
      userId: userId ?? this.userId,
      namaProduk: namaProduk ?? this.namaProduk,
      quantity: quantity ?? this.quantity,
      syncDate: syncDate ?? this.syncDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trukId.present) {
      map['truk_id'] = Variable<int>(trukId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (namaProduk.present) {
      map['nama_produk'] = Variable<String>(namaProduk.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (syncDate.present) {
      map['sync_date'] = Variable<DateTime>(syncDate.value);
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
    return (StringBuffer('StokCompanion(')
          ..write('id: $id, ')
          ..write('trukId: $trukId, ')
          ..write('userId: $userId, ')
          ..write('namaProduk: $namaProduk, ')
          ..write('quantity: $quantity, ')
          ..write('syncDate: $syncDate, ')
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _trukIdMeta = const VerificationMeta('trukId');
  GeneratedIntColumn _trukId;
  @override
  GeneratedIntColumn get trukId => _trukId ??= _constructTrukId();
  GeneratedIntColumn _constructTrukId() {
    return GeneratedIntColumn(
      'truk_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _namaProdukMeta = const VerificationMeta('namaProduk');
  GeneratedTextColumn _namaProduk;
  @override
  GeneratedTextColumn get namaProduk => _namaProduk ??= _constructNamaProduk();
  GeneratedTextColumn _constructNamaProduk() {
    return GeneratedTextColumn(
      'nama_produk',
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

  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  GeneratedDateTimeColumn _syncDate;
  @override
  GeneratedDateTimeColumn get syncDate => _syncDate ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
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
        id,
        trukId,
        userId,
        namaProduk,
        quantity,
        syncDate,
        createdAt,
        updatedAt
      ];
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('truk_id')) {
      context.handle(_trukIdMeta,
          trukId.isAcceptableOrUnknown(data['truk_id'], _trukIdMeta));
    } else if (isInserting) {
      context.missing(_trukIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('nama_produk')) {
      context.handle(
          _namaProdukMeta,
          namaProduk.isAcceptableOrUnknown(
              data['nama_produk'], _namaProdukMeta));
    } else if (isInserting) {
      context.missing(_namaProdukMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date'], _syncDateMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
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
  final int id;
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
  final DateTime syncDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  OutletData(
      {@required this.id,
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
      this.syncDate,
      @required this.createdAt,
      @required this.updatedAt});
  factory OutletData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return OutletData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
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
      syncDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
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
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<DateTime>(syncDate);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  OutletCompanion toCompanion(bool nullToAbsent) {
    return OutletCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
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
      id: serializer.fromJson<int>(json['id']),
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
      syncDate: serializer.fromJson<DateTime>(json['syncDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
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
      'syncDate': serializer.toJson<DateTime>(syncDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OutletData copyWith(
          {int id,
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
          DateTime syncDate,
          DateTime createdAt,
          DateTime updatedAt}) =>
      OutletData(
        id: id ?? this.id,
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
        syncDate: syncDate ?? this.syncDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('OutletData(')
          ..write('id: $id, ')
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
          ..write('syncDate: $syncDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
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
                                                  syncDate.hashCode,
                                                  $mrjc(
                                                      createdAt.hashCode,
                                                      updatedAt
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OutletData &&
          other.id == this.id &&
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
          other.syncDate == this.syncDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OutletCompanion extends UpdateCompanion<OutletData> {
  final Value<int> id;
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
  final Value<DateTime> syncDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const OutletCompanion({
    this.id = const Value.absent(),
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
    this.syncDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  OutletCompanion.insert({
    this.id = const Value.absent(),
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
    this.syncDate = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : barcode = Value(barcode),
        user = Value(user),
        outletName = Value(outletName),
        lat = Value(lat),
        lng = Value(lng),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OutletData> custom({
    Expression<int> id,
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
    Expression<DateTime> syncDate,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
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
      if (syncDate != null) 'sync_date': syncDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  OutletCompanion copyWith(
      {Value<int> id,
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
      Value<DateTime> syncDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return OutletCompanion(
      id: id ?? this.id,
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
      syncDate: syncDate ?? this.syncDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (syncDate.present) {
      map['sync_date'] = Variable<DateTime>(syncDate.value);
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
    return (StringBuffer('OutletCompanion(')
          ..write('id: $id, ')
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
          ..write('syncDate: $syncDate, ')
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
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

  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  GeneratedDateTimeColumn _syncDate;
  @override
  GeneratedDateTimeColumn get syncDate => _syncDate ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
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
        id,
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
        syncDate,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
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
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date'], _syncDateMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
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
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, produk, truk, stok, outlet];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<NexDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
mixin _$ProdukDaoMixin on DatabaseAccessor<NexDatabase> {
  $ProdukTable get produk => attachedDatabase.produk;
}
mixin _$StokDaoMixin on DatabaseAccessor<NexDatabase> {
  $StokTable get stok => attachedDatabase.stok;
}
mixin _$TrukDaoMixin on DatabaseAccessor<NexDatabase> {
  $TrukTable get truk => attachedDatabase.truk;
  $StokTable get stok => attachedDatabase.stok;
}
mixin _$OutletDaoMixin on DatabaseAccessor<NexDatabase> {
  $OutletTable get outlet => attachedDatabase.outlet;
}
