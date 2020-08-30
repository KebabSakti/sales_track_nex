import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/pilih_outlet_bloc.dart';
import 'package:sales_track_nex/database/nex_database.dart';
import 'package:sales_track_nex/widget/SearchAppBar.dart';

class PilihOutlet extends StatefulWidget {
  @override
  _PilihOutletState createState() => _PilihOutletState();
}

class _PilihOutletState extends State<PilihOutlet> {
  // ignore: close_sinks
  PilihOutletBloc pilihOutletBloc;
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;

  OutletData outletData;

  void _searchAppBarListener(value) {
    _fetchOutletByKeyword(value);
  }

  _fetchOutletByKeyword(keyword) {
    pilihOutletBloc.add(FetchOutlet(keyword, authenticateBloc.state.user));
  }

  @override
  void initState() {
    pilihOutletBloc = BlocProvider.of<PilihOutletBloc>(context);
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);

    _fetchOutletByKeyword('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchAppBar(
        title: 'Pilih Outlet',
        hintText: 'Ketik nama outlet',
        onTextChanged: _searchAppBarListener,
      ),
      body: BlocConsumer<PilihOutletBloc, PilihOutletState>(
        listener: (context, state) {
          if (state is GetLocationDataComplete)
            Navigator.of(context).pop([outletData, state.locationData]);
        },
        builder: (context, state) {
          if (state is FetchOutletComplete) {
            return ListView.separated(
                itemBuilder: (context, index) => Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: ListTile(
                        title: Text(
                          '${state.outletData[index].outletName}',
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                        subtitle: Text(
                          '${state.outletData[index].owner}',
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                        onTap: () {
                          outletData = state.outletData[index];
                          pilihOutletBloc.add(GetLocationData());
                        },
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      height: 1,
                    ),
                itemCount: state.outletData.length);
          } else if (state is FetchOutletLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is FetchOutletError) {
            return Container(
              child: Center(
                child: Text(state.message),
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
