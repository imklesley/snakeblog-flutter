import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/login_store.dart';
import 'package:blog_snake/views/forgot_password/forgot_password_view.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/config/constants.dart';
import '/views/_shared/logo_snake_blog.dart';
import 'components/auth_field.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _loginStore = LoginStore();

  String? _emailFieldValidator(String? email) {
    if (email!.isEmpty) {
      return 'Please enter an email!';
    } else if (!EmailValidator.validate(email)) {
      return 'Your email isn\'t valid!';
    }
  }

  String? _passwordFieldValidator(String? password) {
    if (password!.isEmpty) {
      return 'Please enter a password!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _appStore = Provider.of<AppStore>(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color:
                Responsive.isMobile(context) ? Colors.white : kDarkBlackColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!Responsive.isMobile(context))
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: kBgColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(kDefaultPadding * 3),
                            bottomRight: Radius.circular(kDefaultPadding))),
                    padding: const EdgeInsets.all(kDefaultPadding * 3),
                    child: SvgPicture.asset('assets/icons/art_login.svg'),
                  )),
            Expanded(
                flex: 4,
                child: Container(
                  color: kDarkBlackColor,
                  child: SizedBox(
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LogoSnakeBlog(),
                        const SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        Observer(builder: (context) {
                          return _loginStore.isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      kPrimaryColor),
                                )
                              : Form(
                                  key: _loginStore.formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding * 3),
                                    child: Column(
                                      children: [
                                        AuthField(
                                            controller:
                                                _loginStore.emailController,
                                            labelText: 'Email',
                                            obscureText: false,
                                            autoFocus: true,
                                            validatorFunction:
                                                _emailFieldValidator,
                                        ),
                                        const SizedBox(
                                          height: kDefaultPadding,
                                        ),
                                        Observer(builder: (context) {
                                          return AuthField(
                                            controller:
                                                _loginStore.passwordController,
                                            labelText: 'Password',
                                            obscureText: true,
                                            autoFocus: false,
                                            validatorFunction:
                                                _passwordFieldValidator,

                                          );
                                        }),
                                        const SizedBox(
                                          height: kDefaultPadding * 2,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 200,
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                if (_loginStore
                                                    .formKey.currentState!
                                                    .validate()) {
                                                  try {
                                                    _appStore.saveUser(
                                                        await _loginStore
                                                            .login());
                                                    _loginStore.isLoading =
                                                        false;
                                                    SnackBar snackBar =
                                                        SnackBar(
                                                      content: Text(
                                                        'Welcome back ${_appStore.user?.firstName} !',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      backgroundColor:
                                                          Colors.green,
                                                    );

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                    Navigator.pop(
                                                      context,
                                                    );
                                                  } on DioError catch (e) {
                                                    _loginStore.isLoading =
                                                        false;
                                                    SnackBar snackBar =
                                                        SnackBar(
                                                      content: Text(
                                                        e.response
                                                            ?.data['detail'],
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      backgroundColor:
                                                          Colors.red,
                                                    );

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  }
                                                } else {
                                                  SnackBar snackBar =
                                                      const SnackBar(
                                                    content: Text(
                                                      'There is an error in your login form!',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    duration:
                                                        Duration(seconds: 2),
                                                    backgroundColor: Colors.red,
                                                  );

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              },
                                              child: const Text('Login')),
                                        ),
                                        const SizedBox(height: kDefaultPadding,),
                                        TextButton(onPressed: (){

                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const ForgotPasswordView()));


                                        }, child: const Text('Forgot Password ?'))
                                      ],
                                    ),
                                  ),
                                );
                        })
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
