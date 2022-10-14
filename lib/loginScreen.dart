import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_mob_proj/homePage.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> _globalKey =  GlobalKey<FormState>();

  bool isRememberMe = false;

  Widget buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )

              ]
          ),
          height: 60,
          child: TextFormField(
            controller: loginController,
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.account_circle_outlined ,
                    color: Color(0xffFFAEBC)
                ),
                hintText: 'Login',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
            validator: (String? value) {
              if(value == null || value.isEmpty){
                return 'Enter login';
              }
              return null;
            },
          ),

        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )

              ]
          ),
          height: 60,
          child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xffFFAEBC)
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Colors.black38
                  )
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter password';
                }
                return null;
              }
          ),

        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.white,
              activeColor: Colors.black26,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      key: _globalKey,
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Color (0xffFFAEBC),
          borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(loginController.text))
          );
        },
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'Don`t have an Account?         ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  )
              ),
              TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  )
              )
            ]
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 50),
                      buildLogin(),
                      SizedBox(height: 50),
                      buildPassword(),
                      buildForgotPassBtn(),
                      buildRememberCb(),
                      Divider(
                        height: 30,
                        color: Colors.white,
                      ),
                      buildLoginBtn(),
                      SizedBox(
                        height: 50,
                      ),
                      buildSignUpBtn()
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

