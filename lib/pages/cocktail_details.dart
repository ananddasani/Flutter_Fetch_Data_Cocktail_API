import 'dart:convert';

import 'package:flutter/material.dart';

class CocktailDetails extends StatefulWidget {
  const CocktailDetails({Key? key}) : super(key: key);

  @override
  _CocktailDetailsState createState() => _CocktailDetailsState();
}

class _CocktailDetailsState extends State<CocktailDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/cocktail.json"),
      builder: (context, snapShot) {
        var myData = json.decode(snapShot.data.toString());

        if (myData == null) {
          return CircularProgressIndicator();
        } else {
          return Center(
            child: ListView.builder(
              itemCount: myData["drinks"].length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(myData["drinks"][index]["strDrinkThumb"]),
                  ),
                  title: Text(
                    myData["drinks"][index]["strDrink"],
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    myData["drinks"][index]["idDrink"],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
