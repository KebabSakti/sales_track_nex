import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/relation/truk_with_stok.dart';

part 'nex_database.g.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get nomorPlat => text().nullable()();
  TextColumn get username => text()();
  TextColumn get password => text().nullable()();
  TextColumn get type => text()();
  TextColumn get token => text()();
  TextColumn get hid => text()();
}

@DataClassName('ProdukData')
class Produk extends Table {
  IntColumn get id => integer()();
  TextColumn get kode => text()();
  TextColumn get nama => text()();
  TextColumn get harga => text()();
  BoolColumn get aktif => boolean().withDefault(Constant(false))();
  DateTimeColumn get syncDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('StokData')
class Stok extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get trukId => integer()();
  IntColumn get userId => integer()();
  TextColumn get namaProduk => text()();
  IntColumn get quantity => integer()();
  DateTimeColumn get syncDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('TrukData')
class Truk extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nomorPlat => text()();
  TextColumn get brand => text()();
  DateTimeColumn get syncDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('OutletData')
class Outlet extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get barcode => text()();
  TextColumn get user => text()();
  TextColumn get outletName => text()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get owner => text().nullable()();
  TextColumn get lat => text()();
  TextColumn get lng => text()();
  TextColumn get geofence => text().nullable()();
  TextColumn get picture => text().nullable()();
  DateTimeColumn get syncDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@UseMoor(
    tables: [Users, Produk, Truk, Stok, Outlet],
    daos: [UserDao, ProdukDao, TrukDao, StokDao, OutletDao])
class NexDatabase extends _$NexDatabase {
  // we tell the database where to store the data with this constructor
  NexDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'nex.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<NexDatabase> with _$UserDaoMixin {
  final NexDatabase database;

  UserDao(this.database) : super(database);

  Future<User> getUser() => (select(users)..limit(1)).getSingle();
  Future<User> getUserByUsername(String username) =>
      (select(users)..where((tbl) => tbl.username.equals(username)))
          .getSingle();
  Future<int> insertUser(User user) => into(users).insert(user);
  Future updateUser(User user) =>
      (update(users)..where((tbl) => tbl.username.equals(user.username))).write(
        UsersCompanion(
          id: Value.absent(),
          username: Value(user.username),
          hid: Value(user.hid),
          nomorPlat: Value(user.nomorPlat),
          password: Value.absent(),
          token: Value(user.token),
          type: Value(user.type),
        ),
      );
  Future<int> deleteUserByUsername(String username) =>
      (delete(users)..where((tbl) => tbl.username.equals(username))).go();
  Future<int> deleteUsers() => (delete(users)).go();
}

@UseDao(tables: [Produk])
class ProdukDao extends DatabaseAccessor<NexDatabase> with _$ProdukDaoMixin {
  final NexDatabase database;
  ProdukDao(this.database) : super(database);

  Future<List<ProdukData>> getProduk() => select(produk).get();
  Future<List<ProdukData>> getProdukByKeyword(String keyword) => (select(produk)
        ..where(
            (tbl) => tbl.nama.like('%$keyword%') | tbl.kode.like('%$keyword%')))
      .get();
}

@UseDao(tables: [Stok])
class StokDao extends DatabaseAccessor<NexDatabase> with _$StokDaoMixin {
  final NexDatabase database;
  StokDao(this.database) : super(database);

  Future<List<StokData>> getStok() => select(stok).get();
  Future insertStok(StokCompanion stokCompanion) =>
      into(stok).insert(stokCompanion);
  Future deleteStok() => (delete(stok)).go();
}

@UseDao(tables: [Truk, Stok])
class TrukDao extends DatabaseAccessor<NexDatabase> with _$TrukDaoMixin {
  final NexDatabase database;
  TrukDao(this.database) : super(database);

  Future<int> insertTruk(TrukCompanion trukCompanion) =>
      into(truk).insert(trukCompanion);
  Stream<List<TrukData>> getTruk() => select(truk).watch();
  Future<List<TrukData>> getTrukByKeyword(String keyword) =>
      (select(truk)..where((tbl) => tbl.nomorPlat.like('%$keyword%'))).get();
  Stream<List<TrukWithStok>> getTrukWithStok() {
    return select(truk)
        .join([leftOuterJoin(stok, stok.trukId.equalsExp(truk.id))])
        .watch()
        .map((rows) {
          return rows
              .map((row) => TrukWithStok(
                    row.readTable(truk),
                    row.readTable(stok),
                  ))
              .toList();
        });
  }

  Future deleteTruk() => (delete(truk)).go();
}

@UseDao(tables: [Outlet])
class OutletDao extends DatabaseAccessor<NexDatabase> with _$OutletDaoMixin {
  final NexDatabase database;

  OutletDao(this.database) : super(database);

  Stream<List<OutletData>> fetchOutlet(String keyword) => (select(outlet)
        ..where((tbl) =>
            tbl.barcode.like('%$keyword%') | tbl.user.like('%$keyword%')))
      .watch();

  Future<List<OutletData>> getOutlet() => select(outlet).get();

  Future<int> insertOutlet(Insertable<OutletData> outletData) =>
      into(outlet).insert(outletData);

  Future updateOutlet(Insertable<OutletData> outletData) =>
      update(outlet).replace(outletData);

  Future deleteOutlet(Insertable<OutletData> outletData) =>
      delete(outlet).delete(outletData);

  Future deleteAllOutlet() => (delete(outlet)).go();
}
