import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/detail_order_bloc.dart';
import 'package:sales_track_nex/bloc/foto_bloc.dart';
import 'package:sales_track_nex/bloc/inbox_bloc.dart';
import 'package:sales_track_nex/bloc/jadwal_bloc.dart';
import 'package:sales_track_nex/bloc/keranjang_bloc.dart';
import 'package:sales_track_nex/bloc/list_order_bloc.dart';
import 'package:sales_track_nex/bloc/list_outlet_bloc.dart';
import 'package:sales_track_nex/bloc/list_visit_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/bloc/order_product_bloc.dart';
import 'package:sales_track_nex/bloc/person_bloc.dart';
import 'package:sales_track_nex/bloc/pilih_outlet_bloc.dart';
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

class MyApp extends StatefulWidget {
  final Repository repository;

  MyApp(this.repository);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print(message);
        showOverlayNotification((context) {
          return SafeArea(
            child: Card(
              elevation: 16,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
              ),
              child: ListTile(
                trailing: Icon(
                  Icons.mail,
                  color: Colors.blueAccent,
                ),
                title: Text('${message['notification']['title']}'),
                subtitle: Text(
                  '${message['notification']['body']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  OverlaySupportEntry.of(context).dismiss();
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigateToPageIndex(3));
                },
              ),
            ),
          );
        }, duration: Duration(seconds: 3));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume $message');
      },
    );

    _fcm.getToken().then((token) => print('token is $token'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SingletonBloc>(
          create: (context) => SingletonBloc(widget.repository),
        ),
        BlocProvider<AuthenticateBloc>(
          create: (context) => AuthenticateBloc(widget.repository),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(widget.repository),
        ),
        BlocProvider<SyncBloc>(
          create: (context) => SyncBloc(widget.repository),
        ),
        BlocProvider<ScannerBloc>(
          create: (context) => ScannerBloc(widget.repository),
        ),
        BlocProvider<TruckBloc>(
          create: (context) => TruckBloc(widget.repository),
        ),
        BlocProvider<JadwalBloc>(
          create: (context) => JadwalBloc(widget.repository),
        ),
        BlocProvider<TambahOutletBloc>(
          create: (context) => TambahOutletBloc(widget.repository),
        ),
        BlocProvider<VisitBloc>(
          create: (context) => VisitBloc(widget.repository),
        ),
        BlocProvider<FotoBloc>(
          create: (context) => FotoBloc(),
        ),
        BlocProvider<KeranjangBloc>(
          create: (context) => KeranjangBloc(widget.repository),
        ),
        BlocProvider<OrderProductBloc>(
          create: (context) => OrderProductBloc(widget.repository),
        ),
        BlocProvider<PersonBloc>(
          create: (context) => PersonBloc(widget.repository),
        ),
        BlocProvider<TestArrayBloc>(
          create: (context) => TestArrayBloc(),
        ),
        BlocProvider<ListVisitBloc>(
          create: (context) => ListVisitBloc(widget.repository),
        ),
        BlocProvider<PilihOutletBloc>(
          create: (context) => PilihOutletBloc(widget.repository),
        ),
        BlocProvider<ListOutletBloc>(
          create: (context) => ListOutletBloc(widget.repository),
        ),
        BlocProvider<ListOrderBloc>(
          create: (context) => ListOrderBloc(widget.repository),
        ),
        BlocProvider<DetailOrderBloc>(
          create: (context) => DetailOrderBloc(widget.repository),
        ),
        BlocProvider<InboxBloc>(
          create: (context) => InboxBloc(widget.repository),
        ),
      ],
      child: OverlaySupport(
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
          onGenerateRoute: RouteGenerator(widget.repository).generateRoute,
        ),
      ),
    );
  }
}
