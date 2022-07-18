import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mausam/info.dart';
import 'package:mausam/theme.dart';
import 'package:http/http.dart' as http;

import 'button_page.dart';

// String decimal(int num){
//   var n=num.toString().split('.')[0];
//   var d2=num.toString().split('.')[1].substring(0,2);
//   return (n+"."+d2);
// }

void main() {
  ErrorWidget.builder=(FlutterErrorDetails details){
    return const Material();
  };
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Home(),

    ),
  );
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

var temp;
var description;
var currently;
var humidity;
var windSpeed;
var visibility;
class _HomeState extends State<Home> {

  Future getWeather ()async{
    http.Response response=await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=delhi&appid=6152c729e0820df5a5634bb6bd5c92e9"));
    var results= jsonDecode(response.body);
    setState((){
      temp=results['main'] ['temp'];
      description=results['weather'] [0] ['description'];
      currently=results['weather'] [0] ['main'];
      humidity=results['main'] ['humidity'];
      windSpeed=results['wind'] ['speed'];
      visibility=results['visibility'] ;

    }
    );
  }
  @override
  void initState(){
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Thunder Lemon",
              style: TextStyle(
                fontSize: 30
              ),
            ),
            centerTitle: true,
                      ),
          body: SafeArea(
        child: Container(
          child: Column(
            children:<Widget> [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Center(
                  child: Image.asset("assets/gif_cloud.gif",
                  height: 400,
                    width: 500,
                    opacity: const AlwaysStoppedAnimation<double>(1),
                  ),
                ),
              ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: Text("Let's Know The Weather",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Column(
                   children: [
                     ElevatedButton(
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ButtonCall(),
                         ),
                         );
                       },
                       child: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text("Open List",
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.blue.shade900,
                           ),
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           Icon(Icons.list,
                           size: 24,
                           ),

                         ],
                       ),
                     ),
                   ],
                 ),

                 SizedBox(
                   width: 50,
                 ),

                 Column(
                   children: [
                     ElevatedButton(
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const InfoPage()),);
                       },
                       child: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text("Open City",
                             style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                               color: Colors.blue.shade900,
                             ),
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           Icon(Icons.location_city,
                             size: 24,
                           ),

                         ],
                       ),
                     ),
                   ],
                 ),
               ],
             ),
              // Container(
              //   child: Icon(
              //     Icons.arrow_right_alt,
              //   ),
              // ),
            ],
          ),

        ),
      ),
    ),
    );
  }
}





class SingleWeather extends StatelessWidget {
  const SingleWeather({Key? key}) : super(key: key);

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
                          "New Delhi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Text("Weather is " + (description!=null ? description.toString(): "Loading...")+".",
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
                    // Row(
                    //   children: [
                    //     SvgPicture.asset(
                    //       "assets/moon.svg",
                    //       width: 30,
                    //       height: 30,
                    //       color: Colors.white,
                    //     ),
                    //     SizedBox(width: 15,),
                    //     Text(
                    //       "Night",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 30,
                    //         fontWeight: FontWeight.w300,
                    //       ),
                    //     )
                    //
                    //   ],
                    // ),

                  ],
                ),
                SizedBox(height: 80,),

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
