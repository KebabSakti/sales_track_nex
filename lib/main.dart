import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/foto_bloc.dart';
import 'package:sales_track_nex/bloc/jadwal_bloc.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/bloc/list_visit_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/bloc/order_product_bloc.dart';
import 'package:sales_track_nex/bloc/person_bloc.dart';
import 'package:sales_track_nex/bloc/scanner_bloc.dart';
import 'package:sales_track_nex/bloc/singleton_bloc.dart';
import 'package:sales_track_nex/bloc/sync_bloc.dart';
import 'package:sales_track_nex/bloc/tambah_outlet_bloc.dart';
import 'package:sales_track_nex/bloc/test_array_bloc.dart';
import 'package:sales_track_nex/bloc/truck_bloc.dart';
import 'package:sales_track_nex/bloc/visit_bloc.dart';
import 'package:sales_track_nex/bloc_observer.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/constan.dart';
import 'package:sales_track_nex/utils/route.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final Location location = Location();
  final NexDatabase database = NexDatabase();
  final Dio dio = Dio(new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  ));
  dio.interceptors.add(LogInterceptor(responseBody: false));

  runApp(MyApp(Repository(location, database, dio)));
}

class MyApp extends StatelessWidget {
  final Repository repository;

  MyApp(this.repository);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SingletonBloc>(
          create: (context) => SingletonBloc(repository),
        ),
        BlocProvider<AuthenticateBloc>(
          create: (context) => AuthenticateBloc(repository),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(repository),
        ),
        BlocProvider<SyncBloc>(
          create: (context) => SyncBloc(repository),
        ),
        BlocProvider<ScannerBloc>(
          create: (context) => ScannerBloc(repository),
        ),
        BlocProvider<TruckBloc>(
          create: (context) => TruckBloc(repository),
        ),
        BlocProvider<JadwalBloc>(
          create: (context) => JadwalBloc(repository),
        ),
        BlocProvider<TambahOutletBloc>(
          create: (context) => TambahOutletBloc(repository),
        ),
        BlocProvider<VisitBloc>(
          create: (context) => VisitBloc(repository),
        ),
        BlocProvider<FotoBloc>(
          create: (context) => FotoBloc(),
        ),
        BlocProvider<KeranjangBloc>(
          create: (context) => KeranjangBloc(repository),
        ),
        BlocProvider<OrderProductBloc>(
          create: (context) => OrderProductBloc(repository),
        ),
        BlocProvider<PersonBloc>(
          create: (context) => PersonBloc(repository),
        ),
        BlocProvider<TestArrayBloc>(
          create: (context) => TestArrayBloc(),
        ),
        BlocProvider<ListVisitBloc>(
          create: (context) => ListVisitBloc(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NEX',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: "Poppins",
            scaffoldBackgroundColor: Colors.grey[100],
            appBarTheme: AppBarTheme(color: Colors.deepPurple[600]),
            textTheme:
                TextTheme(bodyText1: TextStyle(color: Color(0xFF4B4B4B)))),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator(repository).generateRoute,
      ),
    );
  }
}
