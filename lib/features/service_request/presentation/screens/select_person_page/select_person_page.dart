import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:services_app/features/service_request/presentation/screens/book_service_page/book_service_page.dart';

class SelectPersonPage extends StatefulWidget {
  static String routeName = '/select_person_page';
  SelectPersonPage({Key key}) : super(key: key);

  @override
  _SelectPersonPageState createState() => _SelectPersonPageState();
}

class _SelectPersonPageState extends State<SelectPersonPage> {
  @override
  Widget build(BuildContext context) {
    // final isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FloatingSearchAppBar(
                    hint: 'Buscar persona ...',
                    body: Container(),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.filter_alt_outlined), onPressed: () {})
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print('TAP');
                          Navigator.pushNamed(
                              context, ServiceBookPage.routeName);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Hero(
                                          tag: 'profile_pic$i',
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 50,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/ProfilePic.jpg'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '4,9',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'NOMBRE PERSONA',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Bucaramanga y área metropolitana',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_outlined),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
