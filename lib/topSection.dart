import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class TopSection extends StatelessWidget {
  var temp;
  var description;
  var city;
  var weatherIcon;
  var address;

  TopSection(this.temp, this.description, this.city, this.weatherIcon, this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'http://openweathermap.org/img/w/${weatherIcon.toString()}.png', //adds an image background icon
              ),
              fit: BoxFit.scaleDown,
            ),
            color: Colors.blue),
        height: MediaQuery.of(context).size.height / 2.5, // ge the height of dev
        width: MediaQuery.of(context).size.width, //get width,
        //color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //y axis
          crossAxisAlignment: CrossAxisAlignment.center, //x axis
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 70), //add padding to the bottom
              child: Text(
                city != null ? city.toString() : "N/A",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              temp != null ? temp.toString() + "\u00B0" : "Loading",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10), //add padding to the bottom
              child: Text(
                description != null ? description.toString() : "Loading",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
