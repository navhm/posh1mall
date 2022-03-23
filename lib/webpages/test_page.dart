import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:posh_1_mall/constants.dart';
import 'package:posh_1_mall/widgets/custom_textfield.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Image.asset("images/ic1.jpg",width: MediaQuery.of(context).size.width,),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w/4,vertical: w/20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 30,sigmaX: 30),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(75.0),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    hintText: "Hello",
                                    icon: Icons.flight,
                                    isEmail: true,
                                    obscureText: false,
                                    warning: "Enter current city to continue",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    hintText: "Hello",
                                    icon: Icons.flight,
                                    isEmail: true,
                                    obscureText: false,
                                    warning: "Enter current city to continue",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    hintText: "Hello",
                                    icon: Icons.flight,
                                    isEmail: true,
                                    obscureText: false,
                                    warning: "Enter current city to continue",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.blue,
                height: 400,
              ),

            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            color: Colors.black.withOpacity(0.07),
            width: double.infinity,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestPage(),
                        ),
                      );
                    },
                    child: const Text("Flights",style: appBarTextStyle,)),
                const Text("Holiday Packages" ,style: appBarTextStyle,),
                const Text("Posh 1 Mall", style: appBarTextStyle,),
                const Text("Login", style: appBarTextStyle,),
                const Text("About Us", style: appBarTextStyle,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
