// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';

class RectRadius extends StatefulWidget {
  RectRadius(this.nom, this.prix, {Key? key}) : super(key: key);
  double? prix;
  String? nom;

  @override
  _RectBody createState() => _RectBody();
}

class _RectBody extends State<RectRadius> {
  void chargerData() {
    if (widget.prix != null && widget.nom != null) {
      setState(() {
        widget.nom = plat_name;
        widget.prix = prix_plat;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    chargerData();
  }

  @override
  Widget build(BuildContext context) {
    // config
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height / 7;

    return Container(
      height: screenHeight,
      width: screenWidth * 0.9,
      color: Colors.amberAccent,
      child: rows_widget(screenWidth * 0.9, screenHeight),
    );
  }

  Widget column_droite(double width_droite, double height_droite) {
    return InkWell(
      child: Container(
        width: width_droite,
        height: height_droite,
        color: Colors.purpleAccent,
        child: Center(
          child: Icon(
            Icons.send_rounded,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        print('Envoyez');
      },
    );
  }

  Widget rows_widget(double width, double height) {
    return Row(
      children: [
        column_widget(width, height),
        column_droite(width * 0.3, height)
      ],
    );
  }

  Widget column_widget(double width, double height) {
    return Column(
      children: <Widget>[
        container_haut(height * 0.7, width * 0.7),
        container_bottom(height * 0.3, width * 0.7)
      ],
    );
  }

  String asset_imgBurger = 'images_assets/burger.jpeg';
  String plat_name = 'sand default';
  double prix_plat = 0.00;

  Widget container_haut(double hauteur, double width) {
    return Container(
      height: hauteur,
      width: width,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(asset_imgBurger),
          Center(
            child: Text(
              (widget.nom) != null ? widget.nom! : plat_name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
          Center(
            child: Text(
              (widget.prix) != null
                  ? widget.prix!.toString() + '€'
                  : prix_plat.toString() + '€',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }

  List une_liste = ['ketchup', 'mayo', 'piment'];
  Color couleur_sauces = Colors.black;

  Widget container_bottom(double hauteur, double width) {
    return Container(
      height: hauteur,
      width: width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              une_liste[0],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: couleur_sauces,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
          Center(
            child: Text(
              une_liste[1],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: couleur_sauces,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
          Center(
            child: Text(
              une_liste[2],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: couleur_sauces,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
