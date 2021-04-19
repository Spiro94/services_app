import 'package:flutter/material.dart';
import 'package:services_app/features/service_request/presentation/screens/select_person_page/select_person_page.dart';

class SelectCategoryPage extends StatefulWidget {
  static String routeName = '/select_category_page';
  const SelectCategoryPage({Key key}) : super(key: key);

  @override
  _SelectCategoryPageState createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  List<String> _services = ['Manicure', 'Pedicure', 'Peinados'];

  List<String> _selectedServices = [];

  @override
  void initState() {
    super.initState();
    _selectedServices.add(_services[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          // color: Color.fromARGB(255, 225, 204, 199),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Qué servicios necesitas hoy?',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: _services
                      .map(
                        (e) => ChoiceChip(
                          label: Text(e),
                          selected: _selectedServices.contains(e),
                          onSelected: (bool selected) {
                            setState(
                              () {
                                if (selected) {
                                  _selectedServices.add(e);
                                } else {
                                  _selectedServices.remove(e);
                                }
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 25,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SelectPersonPage.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Continuar'),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
