import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/register_store.dart';
import 'package:blog_snake/models/user_model.dart';
import 'package:blog_snake/views/auth/components/auth_field.dart';
import 'package:blog_snake/views/home/home_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final RegisterStore _registerStore = RegisterStore();

  @override
  Widget build(BuildContext context) {
    final _appStore = Provider.of<AppStore>(context);

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: !Responsive.isMobile(context)
                    ? kDarkBlackColor
                    : Colors.white),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Container(
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: Row(
                children: [
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding * 2),
                          height: double.infinity,
                          color: kBgColor,
                          child: SvgPicture.asset(
                            'assets/icons/register_art.svg',
                          )),
                    ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: double.infinity,
                      color: kDarkBlackColor,
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding * 2),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: kBgColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kDefaultPadding))),
                          width: 400,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: kDefaultPadding,
                                horizontal: !Responsive.isMobile(context)
                                    ? kDefaultPadding * 2
                                    : kDefaultPadding),
                            child: Observer(builder: (context) {
                              return Form(
                                key: _registerStore.formKey,
                                child: _registerStore.isLoading
                                    ? const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                kPrimaryColor),
                                      )
                                    : ListView(
                                        padding: EdgeInsets.zero,
                                        children: [
                                          const Text(
                                            'Create an account',
                                            style: TextStyle(
                                                color: kDarkBlackColor,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: kDefaultPadding,
                                          ),
                                          AuthField(
                                            labelText: 'First Name',
                                            autoFocus: true,
                                            obscureText: false,
                                            controller: _registerStore
                                                .firstNameController,
                                            validatorFunction: _registerStore
                                                .firstNameValidator,
                                            labelStyle: const TextStyle(
                                                color: kDarkBlackColor,
                                                fontWeight: FontWeight.bold),
                                            iconAndTextColor: kPrimaryColor,
                                            colorEnabledBorder: kDarkBlackColor,
                                          ),
                                          AuthField(
                                            labelText: 'Email',
                                            autoFocus: false,
                                            obscureText: false,
                                            controller:
                                                _registerStore.emailController,
                                            validatorFunction:
                                                _registerStore.emailValidator,
                                            labelStyle: const TextStyle(
                                                color: kDarkBlackColor,
                                                fontWeight: FontWeight.bold),
                                            iconAndTextColor: kPrimaryColor,
                                            colorEnabledBorder: kDarkBlackColor,
                                          ),
                                          AuthField(
                                            labelText: 'Username',
                                            autoFocus: false,
                                            obscureText: false,
                                            controller: _registerStore
                                                .usernameController,
                                            validatorFunction: _registerStore
                                                .usernameValidator,
                                            labelStyle: const TextStyle(
                                                color: kDarkBlackColor,
                                                fontWeight: FontWeight.bold),
                                            iconAndTextColor: kPrimaryColor,
                                            colorEnabledBorder: kDarkBlackColor,
                                          ),
                                          AuthField(
                                            keyboardType: TextInputType.number,
                                            maxLength: 11,
                                            labelText: 'CPF',
                                            autoFocus: false,
                                            obscureText: false,
                                            controller:
                                                _registerStore.cpfController,
                                            validatorFunction:
                                                _registerStore.cpfValidator,
                                            labelStyle: const TextStyle(
                                                color: kDarkBlackColor,
                                                fontWeight: FontWeight.bold),
                                            iconAndTextColor: kPrimaryColor,
                                            colorEnabledBorder: kDarkBlackColor,
                                          ),
                                          AuthField(
                                            labelText: 'Password',
                                            autoFocus: false,
                                            obscureText: true,
                                            controller: _registerStore
                                                .passwordController1,
                                            validatorFunction: _registerStore
                                                .passwordValidator,
                                            labelStyle: const TextStyle(
                                                color: kDarkBlackColor,
                                                fontWeight: FontWeight.bold),
                                            iconAndTextColor: kPrimaryColor,
                                            colorEnabledBorder: kDarkBlackColor,
                                          ),
                                          AuthField(
                                            labelText: 'Password Confirmation',
                                            autoFocus: false,
                                            obscureText: true,
                                            controller: _registerStore
                                                .passwordController2,
                                            validatorFunction: _registerStore
                                                .passwordValidator,
                                            labelStyle: const TextStyle(
                                                color: kDarkBlackColor,
                                                fontWeight: FontWeight.bold),
                                            iconAndTextColor: kPrimaryColor,
                                            colorEnabledBorder: kDarkBlackColor,
                                          ),
                                          const SizedBox(
                                            height: kDefaultPadding,
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: 120,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  if (_registerStore
                                                      .formKey.currentState!
                                                      .validate()) {
                                                    try {
                                                      UserModel? user =
                                                          await _registerStore
                                                              .register();

                                                      _appStore.saveUser(user);

                                                      SnackBar snackBar =
                                                          SnackBar(
                                                        content: Text(
                                                          'Welcome, ${user!.firstName}!',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18),
                                                        ),
                                                        backgroundColor:
                                                            Colors.green,
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                      );

                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  const HomeView()));

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    } on DioError catch (e) {
                                                      SnackBar snackBar =
                                                          SnackBar(
                                                        content: Text(
                                                            '${e.response!.data['detail']}! Inputed Email or Username already has an account!',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18)),
                                                        backgroundColor:
                                                            Colors.red,
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                      );

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                  }
                                                },
                                                child: const Text(
                                                  'Register',
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                )),
                                          ),
                                        ],
                                      ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
