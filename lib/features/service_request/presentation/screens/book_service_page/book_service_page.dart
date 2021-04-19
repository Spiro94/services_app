import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceBookPage extends StatelessWidget {
  static String routeName = '/service_book_page';
  const ServiceBookPage({Key key}) : super(key: key);

  final String phone = '+573184440119';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: 'profile_pic0',
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              child: Image(image: AssetImage('assets/images/ProfilePic.jpg')),
            ),
          ),
          Text(
            'NOMBRE PERSONA',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bucaramanga y área metropolitana',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          contactBuilder(),
          galleryBuilder(),
          ListTile(
            title: Text('Litado de precios'),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {},
          ),
          ListTile(
            title: Text('Calificaciones y comentarios'),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          )
        ],
      ),
    );
  }

  Row contactBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.call),
          onPressed: () {
            launch('tel:$phone');
          },
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          iconSize: 30,
          icon: FaIcon(FontAwesomeIcons.whatsapp),
          color: Color.fromARGB(255, 37, 211, 102),
          onPressed: () {
            launch(url());
          },
        ),
      ],
    );
  }

  String url() {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone";
    } else {
      return "https://api.whatsapp.com/send?phone=$phone";
    }
  }

  Widget galleryBuilder() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.pink,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
