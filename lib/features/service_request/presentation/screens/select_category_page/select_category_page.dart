import 'package:flutter/material.dart';

import '../select_person_page/select_person_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectCategoryPage extends StatefulWidget {
  static String routeName = '/select_category_page';
  const SelectCategoryPage({Key key}) : super(key: key);

  @override
  _SelectCategoryPageState createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  List<String> _services = ['Manicure', 'Pedicure', 'Peinados'];

  List<String> _selectedServices = [];

  Size size;

  @override
  void initState() {
    super.initState();
    _selectedServices.add(_services[0]);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * .70,
                ),
                Image(
                  height: size.height * .699,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/main_image1.jpg'),
                ),
                Positioned(
                  bottom: size.height * 0.12,
                  right: size.width * 0.05,
                  child: Text(
                    'Descubre\nTu\nBelleza',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(fontSize: 45, color: Colors.white),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.0),
                            Colors.white,
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 25,
                left: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 228, 195, 177),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              height: size.height * .30,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Servicios',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: size.height * .30 / 2.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.pushNamed(
                                context, SelectPersonPage.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 226, 186, 159),
                                radius: 35,
                                child: Icon(
                                  Icons.accessibility_new_outlined,
                                  size: 50,
                                  color: Color.fromARGB(255, 124, 86, 64),
                                ),
                              ),
                              Text(
                                'Manicura',
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.pushNamed(
                                context, SelectPersonPage.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 226, 186, 159),
                                radius: 35,
                                child: Icon(
                                  Icons.accessibility_new_outlined,
                                  size: 50,
                                  color: Color.fromARGB(255, 124, 86, 64),
                                ),
                              ),
                              Text(
                                'Pedicura',
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.pushNamed(
                                context, SelectPersonPage.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 226, 186, 159),
                                radius: 35,
                                child: Icon(
                                  Icons.accessibility_new_outlined,
                                  size: 50,
                                  color: Color.fromARGB(255, 124, 86, 64),
                                ),
                              ),
                              Text(
                                'Peinados',
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
