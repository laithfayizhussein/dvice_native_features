import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/user_places_provider.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => UserPlaces()),
      ],
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            colorScheme: KColorScheme),
        home: PlacesList(),
        routes: {
          AddPlace.routeName: (context) => AddPlace(),
        },
      ),
    );
  }
}
