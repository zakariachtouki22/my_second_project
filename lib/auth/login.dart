import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/auth/signup.dart';
import 'package:grocery_app/consts/swiper.dart';
import 'package:grocery_app/screen/btm_bar.dart';
import 'package:grocery_app/screen/home_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/auth_button.dart';
import 'package:grocery_app/widgets/google_button.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import 'foget_password.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/SignUpScreenState';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('The form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          swippering.swiperWidget(),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  TextWidget(
                    text: 'Welcome Back',
                    color: Colors.white,
                    textSize: 24,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextWidget(
                      text: 'Sign in to continue',
                      color: Colors.white.withOpacity(0.8),
                      textSize: 18),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            helperStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            _submitFormOnLogin();
                          },
                          controller: _passTextController,
                          focusNode: _passFocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style:  TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                )),
                            hintText: 'Passsword',
                            helperStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        GlobalMethods.navigatTo(
                            context: context,
                            routeName: ForgetPassScreen.routeName1);
                      },
                      child: Text('Foget password?',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthBTN(
                      fct: () {
                        _submitFormOnLogin();
                        GlobalMethods.navigatTo(
                            context: context,
                            routeName: BottomBarScreen.routeName1);
                      },
                      buttonText: 'Login',
                      btncolor: Colors.white.withOpacity(0.5)),
                  SizedBox(
                    height: 10,
                  ),
                  GoogleBTN(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextWidget(
                                text: 'OR', color: Colors.white, textSize: 18),
                          )),
                      Flexible(
                        flex: 4,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthBTN(
                      fct: () {},
                      buttonText: 'Continue as a guest',
                      btncolor: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(text: 'Don\'t have an account? ', children: [
                      TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GlobalMethods.navigatTo(
                                  context: context,
                                  routeName: SignUpScreen.routeName);
                            }),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
