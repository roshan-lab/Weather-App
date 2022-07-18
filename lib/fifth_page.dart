import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/button_page.dart';
import 'package:mausam/sixth_page.dart';

import 'main.dart';


var temp;
var description;
var currently;
var humidity;
var windSpeed;
var visibility;


class FifthPage extends StatefulWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  State<FifthPage> createState() => _FifthPageState();
}



class _FifthPageState extends State<FifthPage> {

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=bengaluru&appid=6152c729e0820df5a5634bb6bd5c92e9"));
    var results = jsonDecode(response.body);
    setState(() {
      temp = results['main'] ['temp'];
      description = results['weather'] [0] ['description'];
      currently = results['weather'] [0] ['main'];
      humidity = results['main'] ['humidity'];
      windSpeed = results['wind'] ['speed'];
      visibility = results['visibility'];
    }
    );
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 30,
          ), onPressed: () {
          Navigator.pop(context);

        },
        ),
        actions: [
          IconButton(
            icon:Icon(Icons.arrow_forward_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SixthPage(),
              ),
              );

            },
          ),
        ],
        centerTitle: true,
        title: Text("Today's Weather",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.asset("assets/Bengaluru.jpg",
              fit: BoxFit.cover,
              height:double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 140,left: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),

                      ),


                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),


                      ),

                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),

                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 12,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),

            WeatherPage5(),
          ],
        ),
      ),
    );
  }
}

class WeatherPage5 extends StatelessWidget {
  const WeatherPage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),

      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(

                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.2,),
                  Center(
                    child: Container(
                      child: Text(
                        "Bengaluru",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Text("Weather is "+(description!=null ? description.toString(): "Loading...")+".",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      temp !=null ? (temp-273.15).toString().split('.')[0]+"."+((temp-273.15).toString().split('.')[1].substring(0,2))+ "\u2103" : "Loading...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 85,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.1,),

              Column(                            //////// Border
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white38,
                        )
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Wind",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),

                              Text(windSpeed !=null ? windSpeed.toString():"Loading...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),

                              ),
                              Text("Km/h",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),

                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    height: 5,
                                    width: windSpeed!=null?(windSpeed/40)*100:0,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [Colors.greenAccent, Colors.red]),

                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Visibility",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),

                              Text(visibility !=null ? visibility.toString():"Loading...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),

                              ),
                              Text("Meter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),

                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    height: 5,
                                    width: (visibility/100),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [Colors.greenAccent, Colors.red]),

                                    ),
                                    //color: Colors.yellow.shade700,
                                  ),
                                ],
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),

                              Text(humidity !=null ? humidity.toString():"Loading...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),

                              ),
                              Text("%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),

                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    height: 5,
                                    width: humidity/2,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [Colors.greenAccent, Colors.red]),

                                    ),
                                    //color: Colors.greenAccent,
                                  ),
                                ],
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),


    );
  }
}



