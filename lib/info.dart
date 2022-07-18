import 'package:flutter/material.dart';
import 'package:mausam/second_page.dart';
import 'package:mausam/theme.dart';
import 'main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool _isloading = false;
  void _startLoading() async {
    setState(() {
      _isloading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isloading = false;
    });
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
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: _isloading
                ? const CircularProgressIndicator()
                : Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          "Today's Weather",
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
            Image.asset(
              "assets/redfort.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            NavRow(),
            SingleWeather(),
          ],
        ),
      ),
    );
    ;
  }
}

class NavRow extends StatelessWidget {
  const NavRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 140, left: 10),
          child: Row(
            children: [
              Container(
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
            ],
          ),
        ),
      ],
    );
  }
}
