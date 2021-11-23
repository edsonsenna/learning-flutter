import 'package:flutter/material.dart';
import 'package:flutter_api/src/bikes/bike.dart';

class Bikes {
  final List<Bike> bikes;

  Bikes({
    required this.bikes,
  });

  factory Bikes.fromJson(List<Bike> json) {
    // debugPrint(json['bikes'][0].toString());

    // final Iterable<Bike> rawBikes = List<Bike>.from(json['bikes']);

    // final List<Bike> mappedBikes = List<Bike>.from(json['bikes']);
    // final List<Bike> mappedBikes =
    //     rawBikes.map((bike) => Bike.fromJson(bike)).toList();

    return Bikes(
      bikes: json,
    );
  }
}
