import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:efficacy_user/widgets/phone_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.height * 0.77,
      borderRadius: 20,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.05),
        ],
      ),
      border: 1,
      blur: 5,
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 120,
              width: 120,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                image: DecorationImage(
                  image: AssetImage('assets/efficacy_logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Custom text input box
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: TextFormField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(43, 158, 179, 0.19),
                          width: 0.1,
                        ),
                      ),
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(43, 158, 179, 0.19),
                          width: 0.1,
                        ),
                      ),
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: const PhoneWidget(),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 42,
                  width: 130,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home_screen');
                    },
                    child: const Text('FINISH'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
