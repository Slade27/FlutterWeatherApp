import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './temp.dart';
import './topSection.dart';


void main () => runApp(
    MaterialApp(
  title: "Weather App",
  home: Home(),
));

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}



class _HomeState extends State<Home>{
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var city;
  var weatherIcon;
  
  Future getWeather () async{
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Saskatoon&units=metric&appid=87bfbf759166bab256872a776672fa22"); //url and api key
    var results = jsonDecode(response.body); //decodes the json file
    //print(results);
    setState(() {
      this.temp = results["main"]["temp"];
      this.description = results["weather"][0]["description"];
      this.currently = results["weather"][0]["main"];
      this.humidity =results["main"]["humidity"];
      this.windSpeed = results["wind"]["speed"];
      this.city = results["name"];
      this.weatherIcon = results["weather"][0]["icon"].toString();
    });
  
  }
  
  @override
  void initState() { //this will run anything in this method first!
    super.initState();
    this.getWeather(); //run get weather
  }
  
  
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopSection(temp, description, city, weatherIcon),
          Expanded(
              child: ListView(
                children: [
                  // Image.network('http://openweathermap.org/img/w/${weatherIcon.toString()}.png',),
                  Temp(FaIcon(FontAwesomeIcons.temperatureLow), "Temperature", temp != null ? temp.toString() + "\u00B0": "Loading"), //check if its null and if it is say loading
                  Temp(FaIcon(FontAwesomeIcons.cloud), "Description", description != null ? description.toString(): "Loading"),
                  Temp(FaIcon(FontAwesomeIcons.sun), "Humidity", humidity != null ? humidity.toString()  + "%"  :"Loading"),
                  Temp(FaIcon(FontAwesomeIcons.wind), "Wind Speed", windSpeed != null ? windSpeed.toString() + " m/sec": "Loading"),
                  
                ],
              ),
          )
        ],
      ),
    );
  }

}

