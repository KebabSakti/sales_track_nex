import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/outlet_bloc.dart';
import 'package:sales_track_nex/utils/route.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OutletBloc>(
            create: (BuildContext context) => OutletBloc()),
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
