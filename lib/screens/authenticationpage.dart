import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'bottomNavBar.dart';
import 'forgot_password_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController = TextEditingController();
  final TextEditingController _signupConfirmPasswordController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }

  Future<void> _signup() async {
    if (_signupPasswordController.text != _signupConfirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _signupEmailController.text,
        password: _signupPasswordController.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F5F8),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  spreadRadius: 5.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Stack(
              children: [
                Container(
                  height: 300,
                  child: Center(
                    child: Image(
                      image: AssetImage("lib/assets/Food.png"), height: 200,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(
                        text: '        Login        ',
                      ),
                      Tab(
                        text: '       Sign-up       ',
                      ),
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Color(0xffFA4A0C),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Login tab
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 60.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            buildEmailField(_emailController),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            buildPasswordField(_passwordController, 'Password'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage()));
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(color: Color(0xffFA4A0C)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFF460A),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: 60,
                          width: 314,
                          child: TextButton(
                            onPressed: () {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                _login();
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Sign-up tab
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 30.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            buildEmailField(_signupEmailController),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            buildPasswordField(_signupPasswordController, 'Password'),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            buildPasswordField(_signupConfirmPasswordController, 'Confirm Password'),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFF460A),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: 60,
                          width: 314,
                          child: TextButton(
                            onPressed: () {
                              if (_signupEmailController.text.isNotEmpty &&
                                  _signupPasswordController.text.isNotEmpty &&
                                  _signupConfirmPasswordController.text.isNotEmpty) {
                                _signup();
                              }
                            },
                            child: Text(
                              "Sign-up",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller, String label) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        enableSuggestions: false,
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget buildEmailField(TextEditingController controller) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
