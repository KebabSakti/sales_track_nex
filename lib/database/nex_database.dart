import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/relation/truk_with_stok.dart';

part 'nex_database.g.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get nomor_plat => text().nullable()();
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
  DateTimeColumn get sync_date => dateTime().nullable()();
  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
}

@DataClassName('StokData')
class Stok extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get truck_id => integer()();
  IntColumn get user_id => integer()();
  TextColumn get nama_produk => text()();
  IntColumn get quantity => integer()();
  DateTimeColumn get sync_date => dateTime().nullable()();
  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
}

@DataClassName('TrukData')
class Truk extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nomor_plat => text()();
  TextColumn get brand => text()();
  DateTimeColumn get sync_date => dateTime().nullable()();
  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
}

@UseMoor(
    tables: [Users, Produk, Truk, Stok],
    daos: [UserDao, ProdukDao, TrukDao, StokDao])
class NexDatabase extends _$NexDatabase {
  // we tell the database where to store the data with this constructor
  NexDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'nex.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: false,
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
          nomor_plat: Value(user.nomor_plat),
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
      (select(truk)..where((tbl) => tbl.nomor_plat.like('%$keyword%'))).get();
  Stream<List<TrukWithStok>> getTrukWithStok() {
    return select(truk)
        .join([leftOuterJoin(stok, stok.truck_id.equalsExp(truk.id))])
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
