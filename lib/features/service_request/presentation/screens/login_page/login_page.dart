import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../select_category_page/select_category_page.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/login_Page';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 233, 231),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage(
                  'assets/images/login.jpg',
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'SERVICES',
                    style: GoogleFonts.poppins(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'app',
                    style: GoogleFonts.nothingYouCouldDo(fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    child: TextField(
                      style: GoogleFonts.poppins(),
                      cursorColor: Color.fromARGB(255, 134, 93, 71),
                      decoration: InputDecoration(
                        hintText: 'Usuario',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 134, 93, 71),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    child: TextField(
                      style: GoogleFonts.poppins(),
                      cursorColor: Color.fromARGB(255, 134, 93, 71),
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 134, 93, 71),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 184, 126, 90),
                      ),
                      child: Text(
                        'Ingresar',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SelectCategoryPage.routeName);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
