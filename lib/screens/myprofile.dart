import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/drawer.dart';

import 'bottomNavBar.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _value = false;
  Object? val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home screen
            Navigator.pop(context); // Pop the current route from the stack
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()), // Replace YourWidget with the widget you want to navigate to
            );
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.black.withOpacity(0.9)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Information",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 135,
              width: 315,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://th.bing.com/th/id/R.0619cd8cb4a39896aa00c1f367557bff?rik=8ULsoil8Vwr6FA&pid=ImgRaw&r=0',
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "M Usman",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "221403@gmail.com",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 13),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "Air University Islamabad",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 231,
              width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    ListTile(
                      horizontalTitleGap: 5,
                      title: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xffF47B0A),
                            ),
                            child: ImageIcon(
                              AssetImage("lib/assets/profile_cardicon.png"),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Card',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: Color(0xffFA4A0C),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    ListTile(
                      horizontalTitleGap: 5,
                      title: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xffEB4796),
                            ),
                            child: ImageIcon(
                              AssetImage("lib/assets/profile_bankicon.png"),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Bank Account',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: Color(0xffFA4A0C),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    ListTile(
                      horizontalTitleGap: 5,
                      title: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff0038FF),
                            ),

                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'JazzCash',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 3,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: Color(0xffFA4A0C),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
