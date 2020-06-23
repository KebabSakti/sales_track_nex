import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:sales_track_nex/data/outlet_data.dart';
import 'package:sales_track_nex/event/outlet_event.dart';
import 'package:sales_track_nex/utils/constan.dart';

class OutletBloc extends Bloc<OutletEvent, List<OutletData>> {
  @override
  // TODO: implement initialState
  List<OutletData> get initialState => List<OutletData>();

  @override
  Stream<List<OutletData>> mapEventToState(OutletEvent event) async* {
    switch (event) {
      case OutletEvent.init:
        List<OutletData> outlets = List<OutletData>();
        Response response = await Dio().get('$baseUrl/outlet/skip/5/take/2');
        Map parsed = jsonDecode(response.toString());

        for (var outlet in parsed['data']) {
          outlets.add(
              OutletData(barcode: outlet['barcode'], name: outlet['name']));
        }

        yield (outlets);
        break;

      default:
        throw ('Event not found $event');
    }
  }
}
