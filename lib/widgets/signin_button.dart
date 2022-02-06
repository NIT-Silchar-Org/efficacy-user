import 'package:efficacy_user/provider/google_signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInButton extends StatelessWidget {
  final Function callback;
  const SignInButton({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 312,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff4783C7)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextButton(
          onPressed: () async {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            final user = await provider.preLogin();
            callback(user);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/google_logo.png'),
                width: 33,
                height: 33,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Continue with Google',
                  style: TextStyle(
                      color: Color(0xff1976D2),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
