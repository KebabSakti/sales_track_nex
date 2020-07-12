import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/bloc/singleton_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/repository/authenticate_repository.dart';
import 'package:sales_track_nex/utils/route.dart';

void main() {
  final NexDatabase database = NexDatabase();
  final Dio dio = Dio();

  runApp(MyApp(database, dio));
}

class MyApp extends StatelessWidget {
  final NexDatabase database;
  final Dio dio;

  MyApp(this.database, this.dio);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SingletonBloc>(
          create: (context) => SingletonBloc(database, dio),
        ),
        BlocProvider<AuthenticateBloc>(
          create: (context) =>
              AuthenticateBloc(AuthenticateRepository(database, dio)),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) =>
              NavigationBloc(AuthenticateRepository(database, dio)),
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
