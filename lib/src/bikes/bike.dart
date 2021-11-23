class Bike {
  final String id;
  final String name;
  final String brand;
  final String price;
  final String year;

  Bike({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.year,
  });

  factory Bike.fromJson(Bike bike) {
    return Bike(
      id: bike.id,
      name: bike.name,
      brand: bike.brand,
      price: bike.price,
      year: bike.year,
    );
  }

  factory Bike.fromMap(Map<String, dynamic> map) {
    return Bike(
      id: map['id'] as String,
      name: map['name'] as String,
      brand: map['brand'] as String,
      price: map['price'] as String,
      year: map['year'] as String,
    );
  }
}
