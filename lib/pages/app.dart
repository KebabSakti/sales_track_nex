import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/pages/dashboard.dart';
import 'package:sales_track_nex/pages/debug.dart';
import 'package:sales_track_nex/pages/inbox.dart';
import 'package:sales_track_nex/pages/order.dart';
import 'package:sales_track_nex/pages/outlet.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    //get logged in user info event
    BlocProvider.of<AuthenticateBloc>(context).add(GetUserLocal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _navigateToPage(int index) {
      BlocProvider.of<NavigationBloc>(context).add(NavigateToPageIndex(index));
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            _navigationBlocListener(context, state);
          },
        ),
        BlocListener<AuthenticateBloc, AuthenticateState>(
          listener: (context, state) {
            _authenticateBlocListener(context, state);
          },
        ),
      ],
      child: Scaffold(
        extendBody: true,
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            Widget activePage = Dashboard();

            if (state is SetPageIndex) {
              switch (state.index) {
                case 0:
                  activePage = Dashboard();
                  break;

                case 1:
                  activePage = Outlet();
                  break;

                case 2:
                  activePage = Order();
                  break;

                case 3:
                  activePage = Inbox();
                  break;

                case 4:
                  activePage = DebugPage();
                  break;

                default:
                  activePage = Dashboard();
              }
            }

            return activePage;
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  title: Text('Outlet'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  title: Text('Order'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  title: Text('Inbox'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('User'),
                ),
              ],
              currentIndex: (state is SetPageIndex) ? state.index : 0,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey[600],
              showUnselectedLabels: true,
              onTap: _navigateToPage,
            );
          },
        ),
      ),
    );
  }

  void _navigationBlocListener(BuildContext context, NavigationState state) {
    if (state is NavigateLogoutCompleted) {
      //navigasi user ke halaman login
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    } else if (state is NavigateError) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(state.message),
      ));
    }
  }

  void _authenticateBlocListener(
      BuildContext context, AuthenticateState state) {
    print(state);
    if (state is GetUserLocalCompleted) if (state.user.type == "Delivery" &&
        state.user.truckId == null) {
      //redirect ke halaman pilih truck
      Navigator.of(context).pushNamed('/truck');
    }
  }
}
