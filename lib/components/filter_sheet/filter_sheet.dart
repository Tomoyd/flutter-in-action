import 'package:flutter/material.dart';
class FilterSheet extends StatefulWidget {
  final Widget trigger;
  final Widget child;
  final Widget result;
  FilterSheet({Key key,this.child,this.result,this.trigger}) : super(key: key);

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Stack(
        children:<Widget> [
            widget.result,
            SingleChildScrollView(child: Column(
              children:[
                widget.trigger,
                widget.child ??  Container() 
              ]
            ),)
            
        ],
       ),
    );
  }
}