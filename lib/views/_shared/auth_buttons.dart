import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/views/auth/login_view.dart';
import 'package:blog_snake/views/auth/register_view.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 90,

      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
            padding: EdgeInsets.zero
        ),
        child: const Text(
          'Register',
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterView()));
        },
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black54,
          onPrimary: Colors.white,
          padding: EdgeInsets.zero
        ),
        child: const Text(
          'Login',
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginView()));
        },
      ),
    );
  }
}
