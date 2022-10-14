import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_mob_proj/loginScreen.dart';
import 'package:my_mob_proj/schedulePage.dart';


class HomePage extends StatefulWidget {

  String login;

  HomePage(
      this.login
      );

  @override
  _HomePageState createState() => _HomePageState(login);
}



class _HomePageState extends State<HomePage> {

  String login;

  _HomePageState(
      this.login
      );

  Widget buildBackBtn() {
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

  Widget buildScheduleBtn() {
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
              MaterialPageRoute(builder: (context) => schedulePage())
          );
        },
        child: Text(
          'To Schedule',
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
  
  Widget buildPicklist() {

    const List<String> groupsList = <String>[
      'CE-41',
      'CE-42',
      'CE-43',
      'CE-44'
    ];

    String dropdownvalue = groupsList.first;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
              value: 'Choose your group',
              icon: const Icon(Icons.keyboard_arrow_down),
              items: groupsList.map((String groupsList) {
                return DropdownMenuItem(
                    value: groupsList,
                    child: Text(groupsList)
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              }),
        ],
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome\n' + login,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 450,
                      ),
                      //buildPicklist(),
                      buildScheduleBtn(),
                      SizedBox(height: 25,),
                      buildBackBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



