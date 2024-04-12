import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key, this.onSearch}) : super(key: key);

  final void Function(String)? onSearch;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search a TimeZone',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        if (widget.onSearch != null) {
                          widget.onSearch!(value);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: _clearSearch,
                    icon: Icon(Icons.clear),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: _search,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }

  void _search() {
    FocusScope.of(context).unfocus();
    if (widget.onSearch != null) {
      widget.onSearch!(_searchController.text);
    }
  }

  void _clearSearch() {
    _searchController.clear();
    if (widget.onSearch != null) {
      widget.onSearch!('');
    }
  }
}
