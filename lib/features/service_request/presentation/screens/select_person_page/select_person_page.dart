import 'package:flutter/material.dart';

class SelectPersonPage extends StatefulWidget {
  static String routeName = '/select_person_page';
  SelectPersonPage({Key key}) : super(key: key);

  @override
  _SelectPersonPageState createState() => _SelectPersonPageState();
}

class _SelectPersonPageState extends State<SelectPersonPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Placeholder(
              fallbackHeight: 50,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Image(
                          height: 70,
                          width: 70,
                          image: AssetImage('assets/images/ProfilePic.jpg'),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Información persona'),
                            Text('Información persona'),
                            Text('Información persona'),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
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
