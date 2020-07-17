import 'package:moor_flutter/moor_flutter.dart';
import 'package:sales_track_nex/database/nex_database.dart';

abstract class FakeDataSource {
  //outlet
  Stream<List<OutletData>> fetchOutlet(String keyword);
  Future<List<OutletData>> getOutlet();
  Future<int> insertOutlet(Insertable<OutletData> outletData);
  Future<int> updateOutlet(Insertable<OutletData> outletData);
  Future deleteOutlet(Insertable<OutletData> outletData);
  Future deleteAllOutlet();
  Future<List<OutletData>> downloadOutlet(User user);
}

class FakeData implements FakeDataSource {
  @override
  Future deleteAllOutlet() {
    // TODO: implement deleteAllOutlet
    throw UnimplementedError();
  }

  @override
  Future deleteOutlet(Insertable<OutletData> outletData) {
    // TODO: implement deleteOutlet
    throw UnimplementedError();
  }

  @override
  Future<List<OutletData>> downloadOutlet(User user) {
    // TODO: implement downloadOutlet
    throw UnimplementedError();
  }

  @override
  Stream<List<OutletData>> fetchOutlet(String keyword) {
    // TODO: implement fetchOutlet
    throw UnimplementedError();
  }

  @override
  Future<List<OutletData>> getOutlet() {
    // TODO: implement getOutlet
    throw UnimplementedError();
  }

  @override
  Future<int> insertOutlet(Insertable<OutletData> outletData) {
    // TODO: implement insertOutlet
    throw UnimplementedError();
  }

  @override
  Future<int> updateOutlet(Insertable<OutletData> outletData) {
    // TODO: implement updateOutlet
    throw UnimplementedError();
  }
}
