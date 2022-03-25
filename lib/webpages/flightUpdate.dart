import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/app_state.dart';
import '../widgets/custom_textfield.dart';
import 'flights_page.dart';

class FlightUpdate extends StatefulWidget {
  const FlightUpdate({Key? key}) : super(key: key);

  @override
  _FlightUpdateState createState() => _FlightUpdateState();
}

class _FlightUpdateState extends State<FlightUpdate> {

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _seats = TextEditingController();
  final TextEditingController _flightId = TextEditingController();
  final TextEditingController _flightNumber = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  DateTime _departureDate = DateTime.now();
  TimeOfDay _departureTime = const TimeOfDay(hour: 00,minute: 00);
  DateTime _arrivalDate = DateTime.now();
  TimeOfDay _arrivalTime = const TimeOfDay(hour: 00,minute: 00);

  String selectedAirLine = 'Select Airline';

  List airlines = <String>['Indigo', 'AirAsia', 'Vistara', 'AirIndia', 'SpiceJet', 'GoAir', 'JetAirways'];


  bool isTapped = true;
  bool isExpanded = false;
  final int adults = 1;
  final int children  = 0;
  final int infants = 0 ;


  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 600.0,vertical: 100),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 75),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add Flights.",
                        style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.white.withOpacity(.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 3),
                          child: DropdownButton<String>(
                            enableFeedback: false,
                            focusColor: Colors.transparent,
                            focusNode: FocusNode(),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(17),
                            hint: Text(selectedAirLine,style: const TextStyle(color: Colors.white),),
                            icon: const Icon(Icons.arrow_drop_down_outlined,color: Colors.white60,),
                            style: const TextStyle(color: Colors.black),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedAirLine = newValue!;
                              });
                            },
                            items: <String>['Select Airline', 'Indigo', 'AirAsia', 'Vistara', 'AirIndia', 'SpiceJet', 'GoAir', 'JetAirways',]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: CustomTextField(controller: _flightNumber, hintText: "Flight Number", icon: Icons.flight, isEmail: true, obscureText: false, warning: "Enter Flight Number")),
                          const SizedBox(width: 10,),
                          Expanded(child: CustomTextField(controller: _flightId, hintText: "Flight ID", icon: Icons.info, isEmail: true, obscureText: false, warning: "Enter Flight ID"))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(" From",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                      const SizedBox(height: 5,),
                      CustomTextField(
                        controller: _fromController,
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
                        controller: _toController,
                        hintText: "To",
                        icon: Icons.flight_land,
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
                                Text(" Departure Date",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                const SizedBox(height: 5,),
                                Material(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(15),
                                  child: ListTile(
                                    onTap: () async{
                                      DateTime? departureDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(DateTime.now().year),
                                        lastDate: DateTime(2100),
                                      );

                                      if(departureDate == null) return;

                                      setState(() {
                                        _departureDate = departureDate;
                                      });
                                      print(departureDate);

                                    },
                                      leading: const Icon(Icons.date_range,color: Colors.white,),
                                      title: Text(DateFormat('EEE, d MMMM, yy').format(_departureDate),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w100),)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(" Departure Time",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                const SizedBox(height: 5,),
                                Material(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(15),
                                  child: ListTile(
                                    onTap: () async {
                                        TimeOfDay? _selectedTime = await showTimePicker(
                                        context: context,
                                        initialTime: const TimeOfDay(hour: 0, minute: 0),
                                        initialEntryMode: TimePickerEntryMode.input,
                                        helpText: "Enter departure time (24hr)",
                                        builder: (BuildContext context, Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                            child: child!,
                                          );
                                        },
                                      );

                                      if(_selectedTime == null) return;

                                      setState(() {
                                        _departureTime = _selectedTime;
                                      });
                                      print(DateFormat('kk:mm').format(DateTime(2022,1,2,0,0).add(Duration(hours: _departureTime.hour,minutes: _departureTime.minute))));
                                      print(_departureDate.add(Duration(hours: _departureTime.hour,minutes: _departureTime.minute)));

                                    },
                                      leading: const Icon(Icons.access_time,color: Colors.white,),
                                      title: Text(
                                        DateFormat('kk:mm').format(DateTime(2022,1,2,0,0).add(Duration(hours: _departureTime.hour,minutes: _departureTime.minute))),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100),
                                      ),
                                  ),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(" Arrival Date",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                const SizedBox(height: 5,),
                                Material(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(15),
                                  child: ListTile(
                                      onTap: () async{
                                        DateTime? newDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(DateTime.now().year),
                                          lastDate: DateTime(2100),
                                        );

                                        if(newDate == null) return;

                                        setState(() {
                                          _arrivalDate = newDate;
                                        });

                                      },
                                      leading: const Icon(Icons.date_range,color: Colors.white,),
                                      title: Text(DateFormat('EEE, d MMMM, yy').format(_arrivalDate),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w100),)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(" Arrival Time",style: TextStyle(color: Colors.white.withOpacity(0.9)),),
                                const SizedBox(height: 5,),
                                Material(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(15),
                                  child: ListTile(
                                      onTap: () async {
                                        TimeOfDay? _selectedTime = await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(hour: 0, minute: 0),
                                          initialEntryMode: TimePickerEntryMode.input,
                                          helpText: "Enter Arrival time (24hr)",
                                          builder: (BuildContext context, Widget? child) {
                                            return MediaQuery(
                                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                              child: child!,
                                            );
                                          },
                                        );

                                        if(_selectedTime == null) return;

                                        setState(() {
                                          _arrivalTime = _selectedTime;
                                        });
                                        print(_selectedTime);

                                      },
                                      leading: const Icon(Icons.access_time,color: Colors.white,),
                                      title: Text(DateFormat('kk:mm').format(DateTime(2022,1,2,0,0).add(Duration(hours: _arrivalTime.hour,minutes: _arrivalTime.minute))),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w100),)),
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
                          Expanded(child: CustomTextField(controller: _seats, hintText: "Seats", icon: Icons.event_seat, isEmail: true, obscureText: false, warning: "Enter number of seats")),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(child: CustomTextField(controller: _priceController, hintText: "Price ", icon: Icons.currency_rupee, isEmail: false, obscureText: false, warning: "Enter Price")),

                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appSate, _) =>
                      TextButton(
                          style:ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),)

                          ),
                          child: const Text("Add Flight"),
                          onPressed: (){

                            DateTime _departureDateTime = _departureDate.add(Duration(hours: _departureTime.hour,minutes: _departureTime.minute)) ;

                            DateTime _arrivalDateTime = _arrivalDate.add(Duration(hours: _arrivalTime.hour,minutes: _arrivalTime.minute));

                            final travelDuration = (_arrivalDateTime.difference(_departureDateTime));

                            DateTime _randomDateTime = DateTime(2022,1,2,0,0).add(travelDuration);

                            String _durationString = (DateFormat('kk:mm').format(_randomDateTime));


                            appSate.addFlights(
                                selectedAirLine.toLowerCase(),
                                _flightNumber.text,
                                _flightId.text,
                                _fromController.text,
                                _toController.text,
                                _departureDateTime,
                                _arrivalDateTime,
                                _seats.text,
                                _priceController.text,
                                _durationString,
                            );
                          }, ),)
                    ],
                  ),
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
