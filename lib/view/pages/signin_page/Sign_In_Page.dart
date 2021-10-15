import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/validetor/app_validetor.dart';
import 'package:iotflixcinema/core/view_models/sign_in_view_model.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

bool _passwordVisible = false;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signController.errorMsg = "".obs;

    _passwordVisible = false;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  bool obscureText = true;
  SignInViewModel signController = Get.put(SignInViewModel());

  void allUnFocus() {
    emailNode.unfocus();
    passwordNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ThemeController>(
        builder: (controller) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                controller.themeMode?.index == 2
                    ? "images/background.png"
                    : "assets/images/splash/light_splash.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.0, right: 20.0),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        AppRouter.navToHomePage(
                            fragment: HomePageFragment.dashboard);
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline1.color,
                            fontSize: 18,
                            fontFamily: 'poppins_bold'),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage("images/shadebackground.png"),
                              fit: BoxFit.fill,
                            )),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 30.0, right: 5.0, left: 5.0),
                          child: Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          color: Colors.white,
                                          //Color(0xFFEDEDED),
                                          border: Border.all(
                                            color: Color(0xffF0F0F0),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          )),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                        focusNode: emailNode,
                                        onFieldSubmitted: (v) {
                                          emailNode.unfocus();
                                          passwordNode.requestFocus();
                                        },
                                        validator: (value) =>
                                            AppValidTor.isEmail(value),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: 'poppins_semibold'),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontFamily: 'poppins_semibold'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                      child: Divider(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          color: Colors.white,
                                          //Color(0xFFEDEDED),
                                          border: Border.all(
                                            color: Color(0xffF0F0F0),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          )),
                                      child: TextFormField(
                                        obscureText: !_passwordVisible,
                                        controller: passwordController,
                                        focusNode: passwordNode,
                                        onFieldSubmitted: (v) {
                                          passwordNode.unfocus();
                                        },
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (value) =>
                                            AppValidTor.isPassword(value),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: 'poppins_semibold'),
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              size: 15.0,
                                              color: Theme.of(context)
                                                  .copyWith(
                                                      primaryColor:
                                                          Color(0xFFE15050))
                                                  .primaryColor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontFamily: 'poppins_semibold'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GetBuilder<SignInViewModel>(
                                builder: (controller) => RoundBoarderButton(
                                    padding: 10.0,
                                    text: "LOGIN",
                                    onPress: () {
                                      allUnFocus();
                                      if (_formKey.currentState.validate()) {
                                        controller?.signInMethod(
                                          email: emailController?.text?.trim(),
                                          password:
                                              passwordController?.text?.trim(),
                                          loginMethod: 'normal',
                                        );
                                      }
                                      print("sign in called");
                                    }

                                    // AppRouter.navToFavoritePage();

                                    ),
                              ),
                              GetX<SignInViewModel>(
                                builder: (controller) => Center(
                                  child: Visibility(
                                    visible: controller?.errorMsg?.value != "",
                                    child: Text(
                                      controller?.errorMsg?.value ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xffe11d74),
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontFamily: "poppins_medium",
                                        fontSize: 14.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    "or login with",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontFamily: "poppins_medium",
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.facebookF,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.google,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Became a member? ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontSize: 14.0,
                                        fontFamily: 'poppins_medium'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      AppRouter.navToSignUpPage();
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFFE15050),
                                          fontSize: 14.0,
                                          fontFamily: 'poppins_medium'),
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "By proceeding, you agree to our ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontSize: 12.0,
                                        fontFamily: 'poppins_medium'),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Term of Use",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFFE15050),
                                          fontSize: 12.0,
                                          fontFamily: 'poppins_medium'),
                                    ),
                                  ),
                                ],
                              )),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "\& ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontSize: 12.0,
                                        fontFamily: 'poppins_medium'),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Privacy Policy",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFFE15050),
                                          fontSize: 12.0,
                                          fontFamily: 'poppins_medium'),
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 20.0,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
