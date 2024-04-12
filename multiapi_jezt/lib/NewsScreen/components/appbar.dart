import 'package:flutter/material.dart';


class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        ],
      backgroundColor: const Color.fromARGB(255, 224, 221, 221),
      elevation: 0,
      title: Container(
          height: 40,
          child:
          Text('Tech NEws',style: TextStyle(fontSize: 24),)
           ),
      centerTitle: true,
    );
  }
}
