import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/bloc/authenticate_bloc.dart';
import 'package:sales_track_nex/bloc/inbox_bloc.dart';
import 'package:sales_track_nex/utils/helper.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  // ignore: close_sinks
  AuthenticateBloc authenticateBloc;
  // ignore: close_sinks
  InboxBloc inboxBloc;

  Future<void> _fetchData() async {
    inboxBloc.add(FetchMessage(authenticateBloc.state.user));
  }

  @override
  void initState() {
    authenticateBloc = BlocProvider.of<AuthenticateBloc>(context);
    inboxBloc = BlocProvider.of<InboxBloc>(context);

    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('Keluar dari aplikasi?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Tidak'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Ya'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: RefreshIndicator(
        onRefresh: _fetchData,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Inbox'),
          ),
          body: BlocBuilder<InboxBloc, InboxState>(
            builder: (context, state) {
              if (state is FetchDataComplete) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 15,
                          right: 15,
                        ),
                        title: Text(
                          '${state.messages[index].judul}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '${state.messages[index].deskripsi}',
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${Helper().getFormattedDate(DateTime.parse(state.messages[index].createdAt), mDateFormat: DateFormat('d MMMM y H:m'))}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.new_releases,
                          size: 18,
                          color: state.messages[index].isRead == 0
                              ? Colors.red
                              : Colors.transparent,
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                  ),
                  itemCount: state.messages.length,
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
