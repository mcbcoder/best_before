import 'Food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class foodCard extends StatelessWidget {
  CollectionReference all = FirebaseFirestore.instance.collection('all');
  final Food _food;

  foodCard(this._food);

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Card(
      color: Color.fromARGB(162, 135, 226, 219),
      child: Padding (
        padding: const EdgeInsets.all(12.0),
          child:Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: (
                       Text ('${_food.productName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Fredoka',fontSize: 20,))),
                  ),
                ],
              ),
              Column(
                children: [
                  Align (alignment: Alignment.topRight,child: Text("${DateFormat('dd/MM/yyyy').format(_food.expiryDate!).toString()}",style: TextStyle(color: Colors.black, fontFamily: 'Fredoka',fontSize: 20))),
                 // Text("${DateFormat('dd/MM/yyyy').format(_food.expiryDate!).toString()}"),
                ],
              )
            ],)
      
    )
    )
    );
  }
}