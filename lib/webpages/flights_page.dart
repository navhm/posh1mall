import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';
import 'flightUpdate.dart';


class FlightsPage extends StatefulWidget {
  const FlightsPage({
      required this.getFlightsInfo,
    Key? key}) : super(key: key);

  final Future<void> getFlightsInfo;

  @override
  _FlightsPageState createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> with TickerProviderStateMixin{
  AnimationController? _controller;
  Animation<double>? _animation;
  Animation<double>? _animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.getFlightsInfo;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));

    _controller!.forward();

  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(100,0,0,0),
          child: Text("Posh 1 Mall"),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
            child: Row(children: [
              Consumer<ApplicationState>(
                builder: (context, appSate, _) =>
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightsPage(
                              getFlightsInfo: appSate.getFlightsStream(),

                            )
                        ),
                      );
                    }, child: const Text("Flights")),),
              TextButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FlightUpdate()
                  ),
                );
              }, child: const Text("Update Flights")),
              TextButton(onPressed: (){}, child: const Text("Login")),
              TextButton(onPressed: (){}, child: const Text("About Us")),
            ],),
          ),

        ],
      ),
      body: SafeArea(
        child: ListView(
          clipBehavior: Clip.antiAlias,
          shrinkWrap: true,
          children: [

            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width/5,10,width/5,20),
              child: Material(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1,color: Colors.black87),
                    borderRadius: BorderRadius.circular(17)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Airline",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                      Text("Departure",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                      Text("Duration",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                      Text("Arrival",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                      Text("Price",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(width/5,10,width/5,20),
              child: Consumer<ApplicationState>(
                  builder: (context, appSate, _) => Opacity(
                    opacity: _animation!.value,
                    child: Transform.translate(
                      offset: Offset(0, _animation2!.value),
                      child: Column(
                        children: appSate.streamInfo,
                      ),
                    ),
                  )
              ),
            ),
          ],
        )
      ),
    );
  }
}

