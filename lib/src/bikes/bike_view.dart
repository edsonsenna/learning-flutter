import 'package:flutter/material.dart';
import 'package:flutter_api/src/bikes/bikes.dart';
import 'package:flutter_api/src/bikes/bikes_service.dart';

class BikesListView extends StatefulWidget {
  const BikesListView({Key? key}) : super(key: key);

  static const routeName = '/bikes';

  @override
  _BikesListState createState() => _BikesListState();
}

class _BikesListState extends State<BikesListView> {
  late Future<Bikes> futureBikes;
  final BikesService bikeService = BikesService();

  @override
  void initState() {
    super.initState();
    futureBikes = bikeService.fetchBikes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Bikes v1 POC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text('Fetch Bikes POC')),
            body: Center(
              child: FutureBuilder<Bikes>(
                future: futureBikes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Bikes bikesData = snapshot.data as Bikes;
                    return ListView.builder(
                        restorationId: 'sampleItemListView',
                        itemCount: bikesData.bikes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = bikesData.bikes[index];

                          return ListTile(
                            title: Text('${item.name} - Price: ${item.price}'),
                            leading: const CircleAvatar(
                              // Display the Flutter Logo image asset.
                              foregroundImage:
                                  AssetImage('assets/images/flutter_logo.png'),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )));
  }
}
