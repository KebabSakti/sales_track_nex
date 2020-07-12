// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nex_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final String nomor_plat;
  final String username;
  final String password;
  final String type;
  final String token;
  final String hid;
  User(
      {@required this.id,
      this.nomor_plat,
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
      nomor_plat: stringType
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
    if (!nullToAbsent || nomor_plat != null) {
      map['nomor_plat'] = Variable<String>(nomor_plat);
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
      nomor_plat: nomor_plat == null && nullToAbsent
          ? const Value.absent()
          : Value(nomor_plat),
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
      nomor_plat: serializer.fromJson<String>(json['nomor_plat']),
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
      'nomor_plat': serializer.toJson<String>(nomor_plat),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'type': serializer.toJson<String>(type),
      'token': serializer.toJson<String>(token),
      'hid': serializer.toJson<String>(hid),
    };
  }

  User copyWith(
          {int id,
          String nomor_plat,
          String username,
          String password,
          String type,
          String token,
          String hid}) =>
      User(
        id: id ?? this.id,
        nomor_plat: nomor_plat ?? this.nomor_plat,
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
          ..write('nomor_plat: $nomor_plat, ')
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
          nomor_plat.hashCode,
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
          other.nomor_plat == this.nomor_plat &&
          other.username == this.username &&
          other.password == this.password &&
          other.type == this.type &&
          other.token == this.token &&
          other.hid == this.hid);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> nomor_plat;
  final Value<String> username;
  final Value<String> password;
  final Value<String> type;
  final Value<String> token;
  final Value<String> hid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.nomor_plat = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.type = const Value.absent(),
    this.token = const Value.absent(),
    this.hid = const Value.absent(),
  });
  UsersCompanion.insert({
    @required int id,
    this.nomor_plat = const Value.absent(),
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
    Expression<String> nomor_plat,
    Expression<String> username,
    Expression<String> password,
    Expression<String> type,
    Expression<String> token,
    Expression<String> hid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nomor_plat != null) 'nomor_plat': nomor_plat,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (type != null) 'type': type,
      if (token != null) 'token': token,
      if (hid != null) 'hid': hid,
    });
  }

  UsersCompanion copyWith(
      {Value<int> id,
      Value<String> nomor_plat,
      Value<String> username,
      Value<String> password,
      Value<String> type,
      Value<String> token,
      Value<String> hid}) {
    return UsersCompanion(
      id: id ?? this.id,
      nomor_plat: nomor_plat ?? this.nomor_plat,
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
    if (nomor_plat.present) {
      map['nomor_plat'] = Variable<String>(nomor_plat.value);
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
          ..write('nomor_plat: $nomor_plat, ')
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

  final VerificationMeta _nomor_platMeta = const VerificationMeta('nomor_plat');
  GeneratedTextColumn _nomor_plat;
  @override
  GeneratedTextColumn get nomor_plat => _nomor_plat ??= _constructNomorPlat();
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
      [id, nomor_plat, username, password, type, token, hid];
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
      context.handle(
          _nomor_platMeta,
          nomor_plat.isAcceptableOrUnknown(
              data['nomor_plat'], _nomor_platMeta));
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
  final DateTime sync_date;
  final DateTime created_at;
  final DateTime updated_at;
  ProdukData(
      {@required this.id,
      @required this.kode,
      @required this.nama,
      @required this.harga,
      @required this.aktif,
      this.sync_date,
      @required this.created_at,
      @required this.updated_at});
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
      sync_date: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updated_at: dateTimeType
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
    if (!nullToAbsent || sync_date != null) {
      map['sync_date'] = Variable<DateTime>(sync_date);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<DateTime>(updated_at);
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
      sync_date: sync_date == null && nullToAbsent
          ? const Value.absent()
          : Value(sync_date),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
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
      sync_date: serializer.fromJson<DateTime>(json['sync_date']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      updated_at: serializer.fromJson<DateTime>(json['updated_at']),
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
      'sync_date': serializer.toJson<DateTime>(sync_date),
      'created_at': serializer.toJson<DateTime>(created_at),
      'updated_at': serializer.toJson<DateTime>(updated_at),
    };
  }

  ProdukData copyWith(
          {int id,
          String kode,
          String nama,
          String harga,
          bool aktif,
          DateTime sync_date,
          DateTime created_at,
          DateTime updated_at}) =>
      ProdukData(
        id: id ?? this.id,
        kode: kode ?? this.kode,
        nama: nama ?? this.nama,
        harga: harga ?? this.harga,
        aktif: aktif ?? this.aktif,
        sync_date: sync_date ?? this.sync_date,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );
  @override
  String toString() {
    return (StringBuffer('ProdukData(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('harga: $harga, ')
          ..write('aktif: $aktif, ')
          ..write('sync_date: $sync_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
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
                      $mrjc(
                          sync_date.hashCode,
                          $mrjc(
                              created_at.hashCode, updated_at.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProdukData &&
          other.id == this.id &&
          other.kode == this.kode &&
          other.nama == this.nama &&
          other.harga == this.harga &&
          other.aktif == this.aktif &&
          other.sync_date == this.sync_date &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class ProdukCompanion extends UpdateCompanion<ProdukData> {
  final Value<int> id;
  final Value<String> kode;
  final Value<String> nama;
  final Value<String> harga;
  final Value<bool> aktif;
  final Value<DateTime> sync_date;
  final Value<DateTime> created_at;
  final Value<DateTime> updated_at;
  const ProdukCompanion({
    this.id = const Value.absent(),
    this.kode = const Value.absent(),
    this.nama = const Value.absent(),
    this.harga = const Value.absent(),
    this.aktif = const Value.absent(),
    this.sync_date = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
  });
  ProdukCompanion.insert({
    @required int id,
    @required String kode,
    @required String nama,
    @required String harga,
    this.aktif = const Value.absent(),
    this.sync_date = const Value.absent(),
    @required DateTime created_at,
    @required DateTime updated_at,
  })  : id = Value(id),
        kode = Value(kode),
        nama = Value(nama),
        harga = Value(harga),
        created_at = Value(created_at),
        updated_at = Value(updated_at);
  static Insertable<ProdukData> custom({
    Expression<int> id,
    Expression<String> kode,
    Expression<String> nama,
    Expression<String> harga,
    Expression<bool> aktif,
    Expression<DateTime> sync_date,
    Expression<DateTime> created_at,
    Expression<DateTime> updated_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kode != null) 'kode': kode,
      if (nama != null) 'nama': nama,
      if (harga != null) 'harga': harga,
      if (aktif != null) 'aktif': aktif,
      if (sync_date != null) 'sync_date': sync_date,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
    });
  }

  ProdukCompanion copyWith(
      {Value<int> id,
      Value<String> kode,
      Value<String> nama,
      Value<String> harga,
      Value<bool> aktif,
      Value<DateTime> sync_date,
      Value<DateTime> created_at,
      Value<DateTime> updated_at}) {
    return ProdukCompanion(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      aktif: aktif ?? this.aktif,
      sync_date: sync_date ?? this.sync_date,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
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
    if (sync_date.present) {
      map['sync_date'] = Variable<DateTime>(sync_date.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
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
          ..write('sync_date: $sync_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
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

  final VerificationMeta _sync_dateMeta = const VerificationMeta('sync_date');
  GeneratedDateTimeColumn _sync_date;
  @override
  GeneratedDateTimeColumn get sync_date => _sync_date ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updated_atMeta = const VerificationMeta('updated_at');
  GeneratedDateTimeColumn _updated_at;
  @override
  GeneratedDateTimeColumn get updated_at =>
      _updated_at ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, kode, nama, harga, aktif, sync_date, created_at, updated_at];
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
      context.handle(_sync_dateMeta,
          sync_date.isAcceptableOrUnknown(data['sync_date'], _sync_dateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at'], _updated_atMeta));
    } else if (isInserting) {
      context.missing(_updated_atMeta);
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
  final String nomor_plat;
  final String brand;
  final DateTime sync_date;
  final DateTime created_at;
  final DateTime updated_at;
  TrukData(
      {@required this.id,
      @required this.nomor_plat,
      @required this.brand,
      this.sync_date,
      @required this.created_at,
      @required this.updated_at});
  factory TrukData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return TrukData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nomor_plat: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nomor_plat']),
      brand:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}brand']),
      sync_date: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updated_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || nomor_plat != null) {
      map['nomor_plat'] = Variable<String>(nomor_plat);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || sync_date != null) {
      map['sync_date'] = Variable<DateTime>(sync_date);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<DateTime>(updated_at);
    }
    return map;
  }

  TrukCompanion toCompanion(bool nullToAbsent) {
    return TrukCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nomor_plat: nomor_plat == null && nullToAbsent
          ? const Value.absent()
          : Value(nomor_plat),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      sync_date: sync_date == null && nullToAbsent
          ? const Value.absent()
          : Value(sync_date),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
    );
  }

  factory TrukData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TrukData(
      id: serializer.fromJson<int>(json['id']),
      nomor_plat: serializer.fromJson<String>(json['nomor_plat']),
      brand: serializer.fromJson<String>(json['brand']),
      sync_date: serializer.fromJson<DateTime>(json['sync_date']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      updated_at: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nomor_plat': serializer.toJson<String>(nomor_plat),
      'brand': serializer.toJson<String>(brand),
      'sync_date': serializer.toJson<DateTime>(sync_date),
      'created_at': serializer.toJson<DateTime>(created_at),
      'updated_at': serializer.toJson<DateTime>(updated_at),
    };
  }

  TrukData copyWith(
          {int id,
          String nomor_plat,
          String brand,
          DateTime sync_date,
          DateTime created_at,
          DateTime updated_at}) =>
      TrukData(
        id: id ?? this.id,
        nomor_plat: nomor_plat ?? this.nomor_plat,
        brand: brand ?? this.brand,
        sync_date: sync_date ?? this.sync_date,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );
  @override
  String toString() {
    return (StringBuffer('TrukData(')
          ..write('id: $id, ')
          ..write('nomor_plat: $nomor_plat, ')
          ..write('brand: $brand, ')
          ..write('sync_date: $sync_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nomor_plat.hashCode,
          $mrjc(
              brand.hashCode,
              $mrjc(sync_date.hashCode,
                  $mrjc(created_at.hashCode, updated_at.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TrukData &&
          other.id == this.id &&
          other.nomor_plat == this.nomor_plat &&
          other.brand == this.brand &&
          other.sync_date == this.sync_date &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class TrukCompanion extends UpdateCompanion<TrukData> {
  final Value<int> id;
  final Value<String> nomor_plat;
  final Value<String> brand;
  final Value<DateTime> sync_date;
  final Value<DateTime> created_at;
  final Value<DateTime> updated_at;
  const TrukCompanion({
    this.id = const Value.absent(),
    this.nomor_plat = const Value.absent(),
    this.brand = const Value.absent(),
    this.sync_date = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
  });
  TrukCompanion.insert({
    this.id = const Value.absent(),
    @required String nomor_plat,
    @required String brand,
    this.sync_date = const Value.absent(),
    @required DateTime created_at,
    @required DateTime updated_at,
  })  : nomor_plat = Value(nomor_plat),
        brand = Value(brand),
        created_at = Value(created_at),
        updated_at = Value(updated_at);
  static Insertable<TrukData> custom({
    Expression<int> id,
    Expression<String> nomor_plat,
    Expression<String> brand,
    Expression<DateTime> sync_date,
    Expression<DateTime> created_at,
    Expression<DateTime> updated_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nomor_plat != null) 'nomor_plat': nomor_plat,
      if (brand != null) 'brand': brand,
      if (sync_date != null) 'sync_date': sync_date,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
    });
  }

  TrukCompanion copyWith(
      {Value<int> id,
      Value<String> nomor_plat,
      Value<String> brand,
      Value<DateTime> sync_date,
      Value<DateTime> created_at,
      Value<DateTime> updated_at}) {
    return TrukCompanion(
      id: id ?? this.id,
      nomor_plat: nomor_plat ?? this.nomor_plat,
      brand: brand ?? this.brand,
      sync_date: sync_date ?? this.sync_date,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nomor_plat.present) {
      map['nomor_plat'] = Variable<String>(nomor_plat.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sync_date.present) {
      map['sync_date'] = Variable<DateTime>(sync_date.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrukCompanion(')
          ..write('id: $id, ')
          ..write('nomor_plat: $nomor_plat, ')
          ..write('brand: $brand, ')
          ..write('sync_date: $sync_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
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
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nomor_platMeta = const VerificationMeta('nomor_plat');
  GeneratedTextColumn _nomor_plat;
  @override
  GeneratedTextColumn get nomor_plat => _nomor_plat ??= _constructNomorPlat();
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

  final VerificationMeta _sync_dateMeta = const VerificationMeta('sync_date');
  GeneratedDateTimeColumn _sync_date;
  @override
  GeneratedDateTimeColumn get sync_date => _sync_date ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updated_atMeta = const VerificationMeta('updated_at');
  GeneratedDateTimeColumn _updated_at;
  @override
  GeneratedDateTimeColumn get updated_at =>
      _updated_at ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, nomor_plat, brand, sync_date, created_at, updated_at];
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
    }
    if (data.containsKey('nomor_plat')) {
      context.handle(
          _nomor_platMeta,
          nomor_plat.isAcceptableOrUnknown(
              data['nomor_plat'], _nomor_platMeta));
    } else if (isInserting) {
      context.missing(_nomor_platMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand'], _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('sync_date')) {
      context.handle(_sync_dateMeta,
          sync_date.isAcceptableOrUnknown(data['sync_date'], _sync_dateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at'], _updated_atMeta));
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
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
  final int truck_id;
  final int user_id;
  final String nama_produk;
  final int quantity;
  final DateTime sync_date;
  final DateTime created_at;
  final DateTime updated_at;
  StokData(
      {@required this.id,
      @required this.truck_id,
      @required this.user_id,
      @required this.nama_produk,
      @required this.quantity,
      this.sync_date,
      @required this.created_at,
      @required this.updated_at});
  factory StokData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return StokData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      truck_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}truck_id']),
      user_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      nama_produk: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nama_produk']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      sync_date: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updated_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || truck_id != null) {
      map['truck_id'] = Variable<int>(truck_id);
    }
    if (!nullToAbsent || user_id != null) {
      map['user_id'] = Variable<int>(user_id);
    }
    if (!nullToAbsent || nama_produk != null) {
      map['nama_produk'] = Variable<String>(nama_produk);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || sync_date != null) {
      map['sync_date'] = Variable<DateTime>(sync_date);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<DateTime>(updated_at);
    }
    return map;
  }

  StokCompanion toCompanion(bool nullToAbsent) {
    return StokCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      truck_id: truck_id == null && nullToAbsent
          ? const Value.absent()
          : Value(truck_id),
      user_id: user_id == null && nullToAbsent
          ? const Value.absent()
          : Value(user_id),
      nama_produk: nama_produk == null && nullToAbsent
          ? const Value.absent()
          : Value(nama_produk),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      sync_date: sync_date == null && nullToAbsent
          ? const Value.absent()
          : Value(sync_date),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
    );
  }

  factory StokData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StokData(
      id: serializer.fromJson<int>(json['id']),
      truck_id: serializer.fromJson<int>(json['truck_id']),
      user_id: serializer.fromJson<int>(json['user_id']),
      nama_produk: serializer.fromJson<String>(json['nama_produk']),
      quantity: serializer.fromJson<int>(json['quantity']),
      sync_date: serializer.fromJson<DateTime>(json['sync_date']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      updated_at: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'truck_id': serializer.toJson<int>(truck_id),
      'user_id': serializer.toJson<int>(user_id),
      'nama_produk': serializer.toJson<String>(nama_produk),
      'quantity': serializer.toJson<int>(quantity),
      'sync_date': serializer.toJson<DateTime>(sync_date),
      'created_at': serializer.toJson<DateTime>(created_at),
      'updated_at': serializer.toJson<DateTime>(updated_at),
    };
  }

  StokData copyWith(
          {int id,
          int truck_id,
          int user_id,
          String nama_produk,
          int quantity,
          DateTime sync_date,
          DateTime created_at,
          DateTime updated_at}) =>
      StokData(
        id: id ?? this.id,
        truck_id: truck_id ?? this.truck_id,
        user_id: user_id ?? this.user_id,
        nama_produk: nama_produk ?? this.nama_produk,
        quantity: quantity ?? this.quantity,
        sync_date: sync_date ?? this.sync_date,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );
  @override
  String toString() {
    return (StringBuffer('StokData(')
          ..write('id: $id, ')
          ..write('truck_id: $truck_id, ')
          ..write('user_id: $user_id, ')
          ..write('nama_produk: $nama_produk, ')
          ..write('quantity: $quantity, ')
          ..write('sync_date: $sync_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          truck_id.hashCode,
          $mrjc(
              user_id.hashCode,
              $mrjc(
                  nama_produk.hashCode,
                  $mrjc(
                      quantity.hashCode,
                      $mrjc(
                          sync_date.hashCode,
                          $mrjc(
                              created_at.hashCode, updated_at.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StokData &&
          other.id == this.id &&
          other.truck_id == this.truck_id &&
          other.user_id == this.user_id &&
          other.nama_produk == this.nama_produk &&
          other.quantity == this.quantity &&
          other.sync_date == this.sync_date &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class StokCompanion extends UpdateCompanion<StokData> {
  final Value<int> id;
  final Value<int> truck_id;
  final Value<int> user_id;
  final Value<String> nama_produk;
  final Value<int> quantity;
  final Value<DateTime> sync_date;
  final Value<DateTime> created_at;
  final Value<DateTime> updated_at;
  const StokCompanion({
    this.id = const Value.absent(),
    this.truck_id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.nama_produk = const Value.absent(),
    this.quantity = const Value.absent(),
    this.sync_date = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
  });
  StokCompanion.insert({
    this.id = const Value.absent(),
    @required int truck_id,
    @required int user_id,
    @required String nama_produk,
    @required int quantity,
    this.sync_date = const Value.absent(),
    @required DateTime created_at,
    @required DateTime updated_at,
  })  : truck_id = Value(truck_id),
        user_id = Value(user_id),
        nama_produk = Value(nama_produk),
        quantity = Value(quantity),
        created_at = Value(created_at),
        updated_at = Value(updated_at);
  static Insertable<StokData> custom({
    Expression<int> id,
    Expression<int> truck_id,
    Expression<int> user_id,
    Expression<String> nama_produk,
    Expression<int> quantity,
    Expression<DateTime> sync_date,
    Expression<DateTime> created_at,
    Expression<DateTime> updated_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (truck_id != null) 'truck_id': truck_id,
      if (user_id != null) 'user_id': user_id,
      if (nama_produk != null) 'nama_produk': nama_produk,
      if (quantity != null) 'quantity': quantity,
      if (sync_date != null) 'sync_date': sync_date,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
    });
  }

  StokCompanion copyWith(
      {Value<int> id,
      Value<int> truck_id,
      Value<int> user_id,
      Value<String> nama_produk,
      Value<int> quantity,
      Value<DateTime> sync_date,
      Value<DateTime> created_at,
      Value<DateTime> updated_at}) {
    return StokCompanion(
      id: id ?? this.id,
      truck_id: truck_id ?? this.truck_id,
      user_id: user_id ?? this.user_id,
      nama_produk: nama_produk ?? this.nama_produk,
      quantity: quantity ?? this.quantity,
      sync_date: sync_date ?? this.sync_date,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (truck_id.present) {
      map['truck_id'] = Variable<int>(truck_id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<int>(user_id.value);
    }
    if (nama_produk.present) {
      map['nama_produk'] = Variable<String>(nama_produk.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (sync_date.present) {
      map['sync_date'] = Variable<DateTime>(sync_date.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StokCompanion(')
          ..write('id: $id, ')
          ..write('truck_id: $truck_id, ')
          ..write('user_id: $user_id, ')
          ..write('nama_produk: $nama_produk, ')
          ..write('quantity: $quantity, ')
          ..write('sync_date: $sync_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
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

  final VerificationMeta _truck_idMeta = const VerificationMeta('truck_id');
  GeneratedIntColumn _truck_id;
  @override
  GeneratedIntColumn get truck_id => _truck_id ??= _constructTruckId();
  GeneratedIntColumn _constructTruckId() {
    return GeneratedIntColumn(
      'truck_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _user_idMeta = const VerificationMeta('user_id');
  GeneratedIntColumn _user_id;
  @override
  GeneratedIntColumn get user_id => _user_id ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nama_produkMeta =
      const VerificationMeta('nama_produk');
  GeneratedTextColumn _nama_produk;
  @override
  GeneratedTextColumn get nama_produk =>
      _nama_produk ??= _constructNamaProduk();
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

  final VerificationMeta _sync_dateMeta = const VerificationMeta('sync_date');
  GeneratedDateTimeColumn _sync_date;
  @override
  GeneratedDateTimeColumn get sync_date => _sync_date ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updated_atMeta = const VerificationMeta('updated_at');
  GeneratedDateTimeColumn _updated_at;
  @override
  GeneratedDateTimeColumn get updated_at =>
      _updated_at ??= _constructUpdatedAt();
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
        truck_id,
        user_id,
        nama_produk,
        quantity,
        sync_date,
        created_at,
        updated_at
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
    if (data.containsKey('truck_id')) {
      context.handle(_truck_idMeta,
          truck_id.isAcceptableOrUnknown(data['truck_id'], _truck_idMeta));
    } else if (isInserting) {
      context.missing(_truck_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id'], _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('nama_produk')) {
      context.handle(
          _nama_produkMeta,
          nama_produk.isAcceptableOrUnknown(
              data['nama_produk'], _nama_produkMeta));
    } else if (isInserting) {
      context.missing(_nama_produkMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('sync_date')) {
      context.handle(_sync_dateMeta,
          sync_date.isAcceptableOrUnknown(data['sync_date'], _sync_dateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at'], _updated_atMeta));
    } else if (isInserting) {
      context.missing(_updated_atMeta);
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
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as NexDatabase);
  ProdukDao _produkDao;
  ProdukDao get produkDao => _produkDao ??= ProdukDao(this as NexDatabase);
  TrukDao _trukDao;
  TrukDao get trukDao => _trukDao ??= TrukDao(this as NexDatabase);
  StokDao _stokDao;
  StokDao get stokDao => _stokDao ??= StokDao(this as NexDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, produk, truk, stok];
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
