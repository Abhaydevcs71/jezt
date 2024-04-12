import 'package:flutter/material.dart';
import 'package:multiapi_jetz/NewsScreen/Functions/functions.dart';


class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: SearchBarWidget.searchcontroller,
                  decoration: InputDecoration(
                      hintText: 'Search a Keyword or a Phrase',
                      
                      border: InputBorder.none),
                ))
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.grey[800], shape: BoxShape.circle),
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
}
