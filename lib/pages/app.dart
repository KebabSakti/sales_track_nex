import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/navigation_bloc.dart';
import 'package:sales_track_nex/pages/dashboard.dart';
import 'package:sales_track_nex/pages/debug.dart';
import 'package:sales_track_nex/pages/inbox.dart';
import 'package:sales_track_nex/pages/outlet.dart';
import 'package:sales_track_nex/pages/user.dart';
import 'package:sales_track_nex/pages/order.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToPage(int index) {
      BlocProvider.of<NavigationBloc>(context).add(NavigateToPageIndex(index));
    }

    return Scaffold(
      extendBody: true,
      body: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) {
          print(state);
          if (state is NavigateLogoutCompleted) {
            //navigasi user ke halaman login
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
          } else if (state is NavigateError) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.blue[600],
      //   elevation: 2.0,
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
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
    );
  }
}
