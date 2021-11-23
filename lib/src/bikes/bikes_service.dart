import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/src/bikes/bike.dart';
import 'package:flutter_api/src/bikes/bikes.dart';
import 'package:http/http.dart' as http;

class BikesService {
  Future<Bikes> fetchBikes() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-esj-exemplo1.cloudfunctions.net/simple-list'));

    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body);
      List<dynamic> resultBikes = result['bikes'];
      debugPrint(resultBikes.toString());
      List<Bike> bikes = resultBikes.map((bike) => Bike.fromMap(bike)).toList();
      debugPrint(bikes.toString());
      return Bikes.fromJson(bikes);
    } else {
      throw Exception('Failed to load bikes');
    }
  }
}
