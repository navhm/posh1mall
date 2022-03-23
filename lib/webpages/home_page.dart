import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:posh_1_mall/widgets/custom_textfield.dart';
import 'package:intl/intl.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isTapped = true;
  bool isExpanded = false;
  final int adults = 1;
  final int children  = 0;
  final int infants = 0 ;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0,
            title: const Padding(
              padding: EdgeInsets.fromLTRB(100,0,0,0),
              child: Text("Posh 1 Mall"),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                child: Row(children: [
                  TextButton(onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SabPage()
                    //     ),
                    // );
                  }, child: const Text("Flights")),
                  TextButton(onPressed: (){}, child: const Text("Holiday Packages")),
                  TextButton(onPressed: (){}, child: const Text("Login")),
                  TextButton(onPressed: (){}, child: const Text("About Us")),
                ],),
              ),

            ],
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Image.asset("images/ic1.jpg",width: width,),
                  Positioned(
                    top: 50,
                    left: 200,
                    child: SizedBox(
                      width: width/3.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 30,sigmaX: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: 
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Book the perfect trip.",
                                    style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Your personal travel assistant.",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(" From",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                  const SizedBox(height: 5,),
                                  CustomTextField(
                                      controller: TextEditingController(),
                                      hintText: "From",
                                      icon: Icons.home_filled,
                                      isEmail: true,
                                      obscureText: false,
                                      warning: "Enter current city to continue",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(" To",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                  const SizedBox(height: 5,),
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    hintText: "To",
                                    icon: Icons.flight,
                                    isEmail: true,
                                    obscureText: false,
                                    warning: "Enter current city to continue",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(" Departure",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                            const SizedBox(height: 5,),
                                            Material(
                                              color: Colors.white.withOpacity(.1),
                                              borderRadius: BorderRadius.circular(15),
                                              child: ListTile(
                                                  leading: const Icon(Icons.date_range,color: Colors.white,),
                                                  title: Text(DateFormat('yyyy-MM-dd').format(DateTime.now()),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(" Return",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                            const SizedBox(height: 5,),
                                            Material(
                                              color: Colors.white.withOpacity(.1),
                                              borderRadius: BorderRadius.circular(15),
                                              child: ListTile(
                                                  leading: const Icon(Icons.date_range,color: Colors.white,),
                                                  title: Text(DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7))),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                setState(() {
                                                  isTapped = !isTapped;
                                                });
                                              },
                                              onHighlightChanged: (value) {
                                                setState(() {
                                                  isExpanded = value;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(seconds: 1),
                                                curve: Curves.fastLinearToSlowEaseIn,
                                                decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.1),
                                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //     color: Color(0xff6F12E8).withOpacity(0.5),
                                                  //     blurRadius: 20,
                                                  //     offset: Offset(0, 10),
                                                  //   ),
                                                  // ],
                                                ),
                                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                child: isTapped
                                                    ? SingleChildScrollView(
                                                      child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          const Text(
                                                            '1 Traveller',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.w400),
                                                          ),
                                                          Icon(
                                                            isTapped
                                                                ? Icons.keyboard_arrow_down
                                                                : Icons.keyboard_arrow_up,
                                                            color: Colors.white,
                                                            size: 27,
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                                    )
                                                    :
                                                SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          const Text(
                                                            '1 Traveller',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.w400),
                                                          ),
                                                          Icon(
                                                            isTapped
                                                                ? Icons.keyboard_arrow_down
                                                                : Icons.keyboard_arrow_up,
                                                            color: Colors.white,
                                                            size: 27,
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                        isTapped
                                                            ? const SizedBox()
                                                            : Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  const Text("Adults", style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w400),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      IconButton(
                                                                        icon: const Icon(Icons.remove_circle_outline,color: Colors.white,),
                                                                        onPressed: (){},),
                                                                      const Text("1" , style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.w400),),
                                                                      IconButton(
                                                                        icon: const Icon(Icons.add_circle_outline, color: Colors.white,),
                                                                        onPressed: (){},),
                                                                    ],
                                                                  ),
                                                                  ]),
                                                            Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  const Text("Children", style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.w400),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      IconButton(
                                                                        icon: const Icon(Icons.remove_circle_outline,color: Colors.white,),
                                                                        onPressed: (){},),
                                                                      const Text("1" , style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.w400),),
                                                                      IconButton(
                                                                        icon: const Icon(Icons.add_circle_outline, color: Colors.white,),
                                                                        onPressed: (){},),
                                                                    ],
                                                                  ),
                                                                ]),
                                                            Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  const Text("Infants", style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.w400),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      IconButton(
                                                                        icon: const Icon(Icons.remove_circle_outline,color: Colors.white,),
                                                                        onPressed: (){},),
                                                                      const Text("1" , style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.w400),),
                                                                      IconButton(
                                                                        icon: const Icon(Icons.add_circle_outline, color: Colors.white,),
                                                                        onPressed: (){},),
                                                                    ],
                                                                  ),
                                                                ]),
                                                          ],
                                                        ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex : 1,
                                          child: TextButton(
                                              style:ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                                padding: MaterialStateProperty.all(const EdgeInsets.all(22)),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),)

                                              ),
                                              onPressed: (){}, child: const Text("Search Flights"))),
                                    ],
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                color: Colors.black,
                height: 400,
              ),

            ],
          ),
    );
  }
}
