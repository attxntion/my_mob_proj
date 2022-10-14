import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dateWidget extends StatefulWidget {

  @override
  _dateWidgetState createState() => _dateWidgetState();
}

class _dateWidgetState extends State<dateWidget> {

  bool _selectDate = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectDate = !_selectDate;
        });
      },
      child: Container(
        decoration: _selectDate ? null
            : BoxDecoration(
          color: Color(0xffFFAEBC),
          borderRadius: BorderRadius.all(
            Radius.circular((4)
            ),
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              'Mo',
              style: TextStyle(
                  fontWeight: _selectDate ? FontWeight.bold : FontWeight.normal,
                  color: _selectDate ? Color(0xffFFAEBC) : Colors.white
              ),
            ),
            Container(
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectDate ? Color(0xffFFAEBC) : Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}