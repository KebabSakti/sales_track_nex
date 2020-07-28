import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'nex_database.g.dart';

@DataClassName('User')
class Users extends Table {
  TextColumn get userId => text()();
  TextColumn get truckId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get username => text()();
  TextColumn get type => text()();
  TextColumn get token => text()();

  @override
  Set<Column> get primaryKey => {userId};
}

@DataClassName('ProdukData')
class Produk extends Table {
  TextColumn get produkId => text()();
  TextColumn get kode => text()();
  TextColumn get nama => text()();
  TextColumn get harga => text()();
  IntColumn get stok => integer()();
  BoolColumn get aktif => boolean().withDefault(Constant(false))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {produkId};
}

@DataClassName('StokData')
class Stok extends Table {
  TextColumn get trukId => text()();
  TextColumn get stokId => text()();
  TextColumn get produkId => text()();
  IntColumn get quantity => integer()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {stokId};
}

@DataClassName('TrukData')
class Truk extends Table {
  TextColumn get trukId => text()();
  TextColumn get nomorPlat => text()();
  TextColumn get brand => text()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {trukId};
}

@DataClassName('OutletData')
class Outlet extends Table {
  TextColumn get outletId => text()();
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
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {outletId};
}

@DataClassName('SyncRule')
class SyncRuleTable extends Table {
  TextColumn get syncId => text()();
  TextColumn get target => text()();
  TextColumn get syncDate => text()();

  @override
  Set<Column> get primaryKey => {syncId};
}

@DataClassName('JadwalData')
class Jadwal extends Table {
  TextColumn get jadwalId => text()();
  TextColumn get userId => text()();
  TextColumn get outletId => text()();
  TextColumn get tanggal => text()();
  IntColumn get visit => integer().withDefault(const Constant(0))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {jadwalId};
}

@DataClassName('VisitData')
class Visit extends Table {
  TextColumn get visitId => text()();
  TextColumn get kodeVisit => text().nullable()();
  TextColumn get userId => text()();
  TextColumn get outletId => text()();
  TextColumn get lat => text()();
  TextColumn get lng => text()();
  IntColumn get tutup => integer().withDefault(const Constant(0))();
  TextColumn get status => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {visitId};
}

@DataClassName('OrderData')
class Order extends Table {
  TextColumn get orderId => text()();
  TextColumn get outletId => text()();
  TextColumn get barcode => text().nullable()();
  TextColumn get kodeOrder => text()();
  TextColumn get nomorPO => text()();
  TextColumn get nomorFaktur => text().nullable()();
  TextColumn get poUserId => text()();
  TextColumn get fakturUserId => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('PO'))();
  TextColumn get totalBayar => text()();
  TextColumn get pembayaran => text().withDefault(const Constant('Cash'))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {orderId};
}

@DataClassName('OrderItemData')
class OrderItem extends Table {
  TextColumn get orderItemId => text()();
  TextColumn get orderId => text()();
  TextColumn get produkId => text()();
  TextColumn get kodeOrder => text()();
  TextColumn get userId => text()();
  IntColumn get quantity => integer()();
  TextColumn get totalHarga => text()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {orderItemId};
}

class TrukWithStokSum {
  TrukWithStokSum(this.trukData, this.stokTotal);

  final TrukData trukData;
  final int stokTotal;
}

@UseMoor(tables: [
  Users,
  Produk,
  Truk,
  Stok,
  Outlet,
  SyncRuleTable,
  Jadwal,
  Visit,
  Order,
  OrderItem,
], daos: [
  UserDao,
  ProdukDao,
  TrukDao,
  StokDao,
  OutletDao,
  SyncRuleDao,
  JadwalDao,
  VisitDao,
  OrderDao,
  OrderItemDao,
])
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

@UseDao(tables: [Jadwal])
class JadwalDao extends DatabaseAccessor<NexDatabase> with _$JadwalDaoMixin {
  final NexDatabase database;

  JadwalDao(this.database) : super(database);

  Future<List<JadwalData>> getJadwal() => select(jadwal).get();
  Future<JadwalData> getJadwalById(String jadwalId) => (select(jadwal)
        ..where((tbl) => tbl.jadwalId.equals(jadwalId))
        ..limit(1))
      .getSingle();
  Future insertJadwal(Insertable<JadwalData> jadwalData) =>
      into(jadwal).insert(jadwalData);
  Future updateJadwal(Insertable<JadwalData> jadwalData) =>
      update(jadwal).replace(jadwalData);
  Future deleteJadwal() => delete(jadwal).go();
}

@UseDao(tables: [Visit])
class VisitDao extends DatabaseAccessor<NexDatabase> with _$VisitDaoMixin {
  final NexDatabase database;

  VisitDao(this.database) : super(database);

  Future<List<VisitData>> getVisit() => select(visit).get();
  Future<VisitData> getVisitById(String visitId) => (select(visit)
        ..where((tbl) => tbl.visitId.equals(visitId))
        ..limit(1))
      .getSingle();
  Future insertVisit(Insertable<VisitData> visitData) =>
      into(visit).insert(visitData);
  Future updateVisit(Insertable<VisitData> visitData) =>
      update(visit).replace(visitData);
  Future deleteVisit() => delete(visit).go();
}

@UseDao(tables: [Order])
class OrderDao extends DatabaseAccessor<NexDatabase> with _$OrderDaoMixin {
  final NexDatabase database;

  OrderDao(this.database) : super(database);

  Future<List<OrderData>> getOrder() => select(order).get();
  Future<OrderData> getOrderById(String orderId) => (select(order)
        ..where((tbl) => tbl.orderId.equals(orderId))
        ..limit(1))
      .getSingle();
  Future insertOrder(Insertable<OrderData> orderData) =>
      into(order).insert(orderData);
  Future updateOrder(Insertable<OrderData> orderData) =>
      update(order).replace(orderData);
  Future deleteJadwal() => delete(order).go();
}

@UseDao(tables: [OrderItem])
class OrderItemDao extends DatabaseAccessor<NexDatabase>
    with _$OrderItemDaoMixin {
  final NexDatabase database;

  OrderItemDao(this.database) : super(database);

  Future<List<OrderItemData>> getOrderItem() => select(orderItem).get();
  Future<OrderItemData> getOrderItemById(String orderItemId) =>
      (select(orderItem)
            ..where((tbl) => tbl.orderItemId.equals(orderItemId))
            ..limit(1))
          .getSingle();
  Future insertOrderItem(Insertable<OrderItemData> orderItemData) =>
      into(orderItem).insert(orderItemData);
  Future updateOrderItem(Insertable<OrderItemData> orderItemData) =>
      update(orderItem).replace(orderItemData);
  Future deleteOrderItem() => delete(orderItem).go();
}

@UseDao(tables: [SyncRuleTable])
class SyncRuleDao extends DatabaseAccessor<NexDatabase>
    with _$SyncRuleDaoMixin {
  final NexDatabase database;

  SyncRuleDao(this.database) : super(database);

  Future<SyncRule> getRule(String name) => (select(syncRuleTable)
        ..where((tbl) => tbl.target.equals(name))
        ..limit(1))
      .getSingle();
  Future insertRule(Insertable<SyncRule> syncRule) =>
      into(syncRuleTable).insert(syncRule);
  Future updateRule(Insertable<SyncRule> syncRule) =>
      update(syncRuleTable).replace(syncRule);
  Future deleteRule() => (delete(syncRuleTable)).go();
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
//          id: Value.absent(),
          username: Value(user.username),
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
  Future<ProdukData> getProdukById(String produkId) => (select(produk)
        ..where((tbl) => tbl.produkId.equals(produkId))
        ..limit(1))
      .getSingle();
  Future<List<ProdukData>> getProdukByKeyword(String keyword) => (select(produk)
        ..where(
            (tbl) => tbl.nama.like('%$keyword%') | tbl.kode.like('%$keyword%')))
      .get();
  Future insertProduk(Insertable<ProdukData> produkData) =>
      into(produk).insert(produkData);
  Future updateProduk(Insertable<ProdukData> produkData) =>
      update(produk).replace(produkData);
  Future deleteProduk() => delete(produk).go();
}

@UseDao(tables: [Stok])
class StokDao extends DatabaseAccessor<NexDatabase> with _$StokDaoMixin {
  final NexDatabase database;
  StokDao(this.database) : super(database);

  Future<List<StokData>> getStok() => select(stok).get();
  Future<StokData> getStokById(String stokId) => (select(stok)
        ..where((tbl) => tbl.stokId.equals(stokId))
        ..limit(1))
      .getSingle();
  Future insertStok(Insertable<StokData> stokData) =>
      into(stok).insert(stokData);
  Future updateStok(Insertable<StokData> stokData) =>
      update(stok).replace(stokData);
  Future deleteStok() => (delete(stok)).go();
}

@UseDao(tables: [
  Truk,
  Stok
], queries: {
  '_trukWithStokSum':
      ''' SELECT t.*, SUM(s.quantity) as total_stok FROM truk t JOIN stok s ON t.truk_id = s.truk_id GROUP BY t.truk_id  ''',
})
class TrukDao extends DatabaseAccessor<NexDatabase> with _$TrukDaoMixin {
  final NexDatabase database;
  TrukDao(this.database) : super(database);

  Future<List<TrukData>> getTruk() => select(truk).get();
  Future<TrukData> getTrukByid(String trukId) => (select(truk)
        ..where((tbl) => tbl.trukId.equals(trukId))
        ..limit(1))
      .getSingle();
  Future<int> insertTruk(Insertable<TrukData> trukData) =>
      into(truk).insert(trukData);
  Future updateTruk(Insertable<TrukData> trukData) =>
      update(truk).replace(trukData);
  Future deleteTruk() => (delete(truk)).go();
  //relationship query
  Future<List<TrukWithStokSum>> getTrukWithStokSum() {
    return _trukWithStokSum().map((row) {
      return TrukWithStokSum(
        TrukData(
            trukId: row.trukId,
            nomorPlat: row.nomorPlat,
            brand: row.brand,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt),
        row.totalStok,
      );
    }).get();
  }
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
  Future<OutletData> getOutletById(String outletId) => (select(outlet)
        ..where((tbl) => tbl.outletId.equals(outletId))
        ..limit(1))
      .getSingle();

  Future<int> insertOutlet(Insertable<OutletData> outletData) =>
      into(outlet).insert(outletData);

  Future updateOutlet(Insertable<OutletData> outletData) =>
      update(outlet).replace(outletData);

  Future deleteOutlet(Insertable<OutletData> outletData) =>
      delete(outlet).delete(outletData);

  Future deleteAllOutlet() => (delete(outlet)).go();
}
