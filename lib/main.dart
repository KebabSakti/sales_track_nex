import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/bloc/sync_outlet_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/repository.dart';
import 'package:sales_track_nex/utils/route.dart';

void main() {
  final NexDatabase database = NexDatabase();
  final Dio dio = Dio();

  runApp(MyApp(Repository(database, dio)));
}

class MyApp extends StatelessWidget {
  final Repository repository;

  MyApp(this.repository);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticateBloc>(
          create: (context) => AuthenticateBloc(repository),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(repository),
        ),
        BlocProvider<SyncOutletBloc>(
          create: (context) => SyncOutletBloc(repository),
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
            textTheme:
                TextTheme(bodyText1: TextStyle(color: Color(0xFF4B4B4B)))),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
