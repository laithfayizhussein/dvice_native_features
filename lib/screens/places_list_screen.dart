import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/add_place_screen.dart';
import '../providers/user_places_provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddPlace.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<UserPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) => Consumer<UserPlaces>(
              builder: (ctx, userPlaces, ch) =>
                  //Use bang ! operation on ch!
                  userPlaces.items.length <= 0
                      ? ch!
                      : ListView.builder(
                          itemCount: userPlaces.items.length,
                          itemBuilder: (context, i) => ListTile(
                            leading: Container(
                              child: CircleAvatar(
                                backgroundImage:
                                    FileImage(userPlaces.items[i].image),
                              ),
                            ),
                            title: Text(
                              userPlaces.items[i].title,
                            ),
                            onTap: () {},
                          ),
                        ),
              child: Center(
                child: Text('theres no places have been added '),
              )),
        ));
  }
}
