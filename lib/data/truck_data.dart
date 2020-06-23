class TruckData {
  int id;
  String plat;
  String brand;

  int get truckId {
    return this.id;
  }

  String get truckPlat {
    return this.plat;
  }

  String get truckBrand {
    return this.brand;
  }

  TruckData({this.id, this.plat, this.brand});
}
