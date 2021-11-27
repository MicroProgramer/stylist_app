import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderContainerDesign extends StatefulWidget {
  Widget child;
  Widget? bottomNavigationBar;
  List<Widget>? appBarActions;

  HeaderContainerDesign(
      {required this.child, bottomNavigationBar, appBarActions});

  @override
  _HeaderContainerDesignState createState() => _HeaderContainerDesignState();
}

class _HeaderContainerDesignState extends State<HeaderContainerDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      bottomNavigationBar: widget.bottomNavigationBar,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 200,
        actions: widget.appBarActions,
        elevation: 0,
        title: Image.asset("assets/top.png"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: []),
        child: Container(margin: EdgeInsets.only(top: 20), child: widget.child),
      ),
    );
  }
}
