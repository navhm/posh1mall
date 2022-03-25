import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class FlightStreamTile extends StatelessWidget {
  const FlightStreamTile({
    required this.airline,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.to,
    required this.from,
    required this.duration,
    required this.price,
    Key? key}) : super(key: key);

  final String airline;
  final Timestamp departureDateTime;
  final Timestamp arrivalDateTime;
  final String from;
  final String to;
  final String duration;
  final String price;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1,color: Colors.black87),
            borderRadius: BorderRadius.circular(17)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    backgroundImage: AssetImage("images/$airline.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(airline),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('kk:mm').format(departureDateTime.toDate()),style:  const TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),

                  Text(from,style:  const TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),

                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time,size: 25,),
                  const SizedBox(width: 5,),
                  Text(duration,style:  const TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('kk:mm').format(arrivalDateTime.toDate()),style:  const TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),

                  Text(to,style:  const TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),

                ],
              ),
              Column(
                children:  [
                  Text("Rs. $price"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Rs. $price",style: const TextStyle(decoration: TextDecoration.lineThrough),),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(Colors.blue)
                    ),
                    onPressed: (){}, child: const Text("Book Now",style: TextStyle(color: Colors.white),),),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}

