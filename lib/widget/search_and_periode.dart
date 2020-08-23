import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:sales_track_nex/utils/helper.dart';

class SearchPeriode extends StatefulWidget {
  final ValueChanged<String> onSearchFieldChanged;
  final ValueChanged<DateTime> onPeriodeAwalChanged;
  final ValueChanged<DateTime> onPeriodeAkhirChanged;

  SearchPeriode({
    @required this.onSearchFieldChanged,
    @required this.onPeriodeAwalChanged,
    @required this.onPeriodeAkhirChanged,
  });

  @override
  _SearchPeriodeState createState() => _SearchPeriodeState();
}

class _SearchPeriodeState extends State<SearchPeriode> {
  final TextEditingController _searchFieldText = TextEditingController();
  final TextEditingController _periodeAwalText = TextEditingController();
  final TextEditingController _periodeAkhirText = TextEditingController();
  DateTime _periodeAwal, _periodeAkhir;

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
    _periodeAwalText.dispose();
    _periodeAkhirText.dispose();
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
          SizedBox(width: 20),
          Container(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Periode',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  )
                ],
              ),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 270,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Pilih Periode',
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          TextField(
                            controller: _periodeAwalText,
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: Colors.grey[600],
                            cursorWidth: 0.5,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              fillColor: Colors.grey[300],
                              isDense: true,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Pilih periode awal',
                              hintStyle: TextStyle(fontSize: 14),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.blueAccent,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  _periodeAwal = await showRoundedDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 1),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    borderRadius: 16,
                                  );

                                  if (_periodeAwal != null)
                                    _periodeAwalText.text = Helper()
                                        .getFormattedDate(_periodeAwal,
                                            mDateFormat:
                                                DateFormat('dd/MM/yyyy'));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _periodeAkhirText,
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: Colors.grey[600],
                            cursorWidth: 0.5,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              fillColor: Colors.grey[300],
                              isDense: true,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Pilih periode akhir',
                              hintStyle: TextStyle(fontSize: 14),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.blueAccent,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  _periodeAkhir = await showRoundedDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 1),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    borderRadius: 16,
                                  );

                                  if (_periodeAkhir != null)
                                    _periodeAkhirText.text = Helper()
                                        .getFormattedDate(_periodeAkhir,
                                            mDateFormat:
                                                DateFormat('dd/MM/yyyy'));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 45,
                            child: FlatButton(
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Set Periode',
                                style: TextStyle(color: Colors.grey[100]),
                              ),
                              onPressed: () {
                                if (_periodeAwal != null &&
                                    _periodeAkhir != null) {
                                  widget.onPeriodeAwalChanged(_periodeAwal);
                                  widget.onPeriodeAkhirChanged(_periodeAkhir);
                                }

                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
