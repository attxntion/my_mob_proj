import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_mob_proj/homePage.dart';
import 'package:my_mob_proj/loginScreen.dart';
import 'dateWidget.dart';

class schedulePage extends StatefulWidget {



  @override
  _schedulePageState createState() => _schedulePageState();


  }


  class _schedulePageState extends State<schedulePage> {




    Widget topRow() {
      return Row(
        children: [
          Row(
            children: <Widget>[
              Text(
                'Daily',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 8.0),
              Text('meetings',
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Spacer(),
          Text('CE-48',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      );
    }

    Widget returnBtn() {
      return Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: Color (0xffFFAEBC),
            borderRadius: BorderRadius.circular(20)),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen())
            );
          },
          child: Text(
            'Return',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x66A0E7E5),
                          Color(0x99A0E7E5),
                          Color(0xccA0E7E5),
                          Color(0xffA0E7E5),
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),

                  child: Column(
                    children: <Widget>[
                      topRow(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(5,
                                  (index) =>
                                  dateWidget(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              returnBtn(),
            ],
          ),
        ),
      ),
    );
  }

}