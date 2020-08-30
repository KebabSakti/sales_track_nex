import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onTextChanged;
  final String title;
  final String hintText;

  SearchAppBar(
      {Key key, @required this.onTextChanged, this.title, this.hintText})
      : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController _searchText = TextEditingController();
  bool _toggleSearchBar = false;
  bool _toggleClearText = false;

  _searchTextChangeListener() {
    setState(() {
      if (_searchText.text.length > 0)
        _toggleClearText = true;
      else
        _toggleClearText = false;
    });
    widget.onTextChanged(_searchText.text);
  }

  _mToggleSearchBar() {
    _toggleSearchBar = !_toggleSearchBar;
  }

  _clearSearchField() {
    _searchText.clear();
    widget.onTextChanged('');
  }

  @override
  void initState() {
    _searchText.addListener(_searchTextChangeListener);
    super.initState();
  }

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (!_toggleSearchBar)
          ? Text(widget.title)
          : TextField(
              controller: _searchText,
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
      actions: <Widget>[
        Builder(
          builder: (context) {
            if (_toggleSearchBar && _toggleClearText)
              return IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  //clear search field
                  setState(() {
                    _clearSearchField();
                  });
                },
              );
            else
              return IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  //clear search field
                  setState(() {
                    _mToggleSearchBar();
                  });
                },
              );
          },
        ),
      ],
    );
  }
}
