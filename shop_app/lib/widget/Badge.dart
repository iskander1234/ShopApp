import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
 final Widget child;
 final String value;
 Badge({this.child,this.value});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).accentColor,

            ),
            child: Text(value, textAlign: TextAlign.center,style: TextStyle(
              fontSize: 10,
            ),),
          ),
        ),
      ],
    );
  }
}

