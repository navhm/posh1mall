import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posh_1_mall/widgets/flight_stream_template.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState () {
    init();
  }

  void init() async {

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDJts1G4dePOP02UJUODwwJO7y4iEwkfYU",
        appId: "1:472662499393:web:bcb29f97bcb5f7530ee6c0",
        messagingSenderId: "G-YP0HSM58KZ",
        projectId: "posh-1-mall-3460f",
      ),
    );
    notifyListeners();
  }

  ///Get Flight Stream

  List<FlightStreamTile> _streamInfo = [];
  List<FlightStreamTile> get streamInfo => _streamInfo;

  Future<void> getFlightsStream () async {

    try{

      FirebaseFirestore.instance
          .collection("flightsUpdate")
          .orderBy("price",descending: true)
          .snapshots()
          .listen((snapshot) {

        _streamInfo = [];
        for (final info in snapshot.docs) {
          _streamInfo.add(
            FlightStreamTile(
              airline: info['airline'],
              arrivalDateTime: info['arrivalDateTime'],
              departureDateTime: info['departureDateTime'],
              from: info['from'],
              to: info['to'],
              price: info['price'],
              duration: info['duration'],
            ),
          );
        }
        notifyListeners();
      });}
    on SocketException catch(e){
      _streamInfo = [];
      print(e.message);
    }
  }

  ///Update Flights

  Future<DocumentReference> addFlights(
      String airline,
      String flightNumber,
      String flightId,
      String from,
      String to,
      DateTime departureDateTime,
      DateTime arrivalDateTime,
      String seats,
      String price,
      String duration,
      ) {

    // if (_loginState != ApplicationLoginState.loggedIn) {
    //   throw Exception('Must be logged in');
    // }

    return FirebaseFirestore.instance

        .collection('flightsUpdate')
        .add(<String, dynamic>{
          'airline': airline,
          'flightNumber': flightNumber,
          'flightId': flightId,
          'from': from,
          'to': to,
          'departureDateTime': departureDateTime,
          'arrivalDateTime': arrivalDateTime,
          'seats': seats,
          'price': price,
          'duration' : duration,

    });
  }


}



