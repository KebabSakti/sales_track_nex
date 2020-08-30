import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/list_outlet_bloc.dart';

class ListOutlet extends StatefulWidget {
  @override
  _ListOutletState createState() => _ListOutletState();
}

class _ListOutletState extends State<ListOutlet> {
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;
  // ignore: close_sinks
  ListOutletBloc listOutletBloc;

  String _searchKeyword = '';

  void _onSearchFieldChangedListener(value) {
    _searchKeyword = value;

    _fetchDataOutlet();
  }

  Future<void> _fetchDataOutlet() async {
    listOutletBloc.add(FetchOutlet(
      keyword: _searchKeyword,
      user: authenticateBloc.state.user,
    ));
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    listOutletBloc = BlocProvider.of<ListOutletBloc>(context);

    _fetchDataOutlet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchDataOutlet,
      child: Column(
        children: <Widget>[
          SearchOutletBar(
            onSearchFieldChanged: _onSearchFieldChangedListener,
          ),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ListOutletBloc, ListOutletState>(
              builder: (context, state) {
                if (state is FetchOutletComplete) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: ListTile(
                          title: Text(
                            '${state.outletData[index].outletName}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),
                          subtitle: Text(
                            '${state.outletData[index].owner}',
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/detail_outlet',
                                arguments: state.outletData[index]);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(height: 1),
                    itemCount: state.outletData.length,
                  );
                } else if (state is FetchOutletError) {
                  return Center(
                    child: Text(
                      'Tidak ada data',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchOutletBar extends StatefulWidget {
  final ValueChanged<String> onSearchFieldChanged;

  SearchOutletBar({
    @required this.onSearchFieldChanged,
  });

  @override
  _SearchOutletBarState createState() => _SearchOutletBarState();
}

class _SearchOutletBarState extends State<SearchOutletBar> {
  final TextEditingController _searchFieldText = TextEditingController();

  void _searchFieldChangeListener() {
    widget.onSearchFieldChanged(_searchFieldText.text);
  }

  @override
  void initState() {
    _searchFieldText.addListener(_searchFieldChangeListener);
    super.initState();
  }

  @override
  void dispose() {
    _searchFieldText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _searchFieldText,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.grey[600],
              cursorWidth: 0.5,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                fillColor: Colors.grey[300],
                isDense: true,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: 'Ketik untuk mencari',
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
