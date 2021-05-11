import 'package:flutter/material.dart';
import 'package:services_app/core/widgets/main_text.dart';

import '../select_person_page/select_person_page.dart';

class SelectCategoryPage extends StatefulWidget {
  static String routeName = '/select_category_page';
  const SelectCategoryPage({Key key}) : super(key: key);

  @override
  _SelectCategoryPageState createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  List<String> _services = [
    'Uñas',
    'Peinados',
    'Maquillaje',
  ];

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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(right: 20, left: 20, top: 15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        MainText(
                          'Buenos días, ',
                          color: Color.fromARGB(255, 115, 63, 40),
                        ),
                        MainText(
                          'Alana',
                          color: Color.fromARGB(255, 115, 63, 40),
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/pic1.jpg'),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: size.height / 5,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 115, 63, 40),
                      ),
                      margin: const EdgeInsets.only(right: 7),
                      width: size.width * 0.8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 142, 87, 57),
                      ),
                      margin: const EdgeInsets.only(right: 7),
                      width: size.width * 0.8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MainText(
              'Servicios',
              color: Color.fromARGB(255, 115, 63, 40),
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              runSpacing: 10,
              spacing: 30,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: _services
                  .map(
                    (service) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pushNamed(
                            context, SelectPersonPage.routeName);
                      },
                      child: Container(
                        width: size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 226, 186, 159),
                              radius: 25,
                              child: Icon(
                                Icons.accessibility_new_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 124, 86, 64),
                              ),
                            ),
                            MainText(
                              service,
                              size: 13,
                              color: Color.fromARGB(255, 115, 63, 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 30,
            ),
            MainText(
              'Top especialistas',
              color: Color.fromARGB(255, 115, 63, 40),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: size.height / 4,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(
                      right: 20,
                    ),
                    width: size.width * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                            image: AssetImage('assets/images/pic2.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              MainText(
                                'Lady Villa',
                                size: 15,
                                textAlign: TextAlign.start,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MainText(
                                    '4.7',
                                    size: 12,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Color.fromARGB(255, 115, 63, 40),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color.fromARGB(150, 115, 63, 40),
        selectedItemColor: Color.fromARGB(255, 115, 63, 40),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
              size: 25,
            ),
            label: 'Citas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: 'Perfil',
          )
        ],
      ),
    );
  }
}
