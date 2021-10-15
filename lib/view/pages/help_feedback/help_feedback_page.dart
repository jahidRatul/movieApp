import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/utils/toast/flutter_toast.dart';
import 'package:iotflixcinema/core/validetor/app_validetor.dart';
import 'package:iotflixcinema/core/view_models/feedback_view_model.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

import 'help_text_field_widget.dart';

class HelpFeedbackPage extends StatefulWidget {
  @override
  _HelpFeedbackPageState createState() => _HelpFeedbackPageState();
}

class _HelpFeedbackPageState extends State<HelpFeedbackPage> {
  bool _lights = false;
  bool _allowNotifications = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    feedbackController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Feedback',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: 'poppins_medium'),
        ),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: ImageIcon(
              AssetImage('images/backIcon.png'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileViewModel>(
          builder: (profileController) => Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GetBuilder<ThemeController>(
                  builder: (controller) => Center(
                    child: Image.asset(
                      controller.themeMode.index == 2
                          ? 'images/helpImg.png'
                          : "assets/images/help_and_feedBack/helpFeedLight.png",
                      height: hp(26),
                      width: wp(60),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      HelpTextField(
                        nameField: 'User Name',
                        initialValue:
                            profileController?.profileModel?.data?.name ?? "",
                        controller: nameController,
                        validator: (value) => AppValidTor.isEmpty(value),
                        hintField: 'Ex. Shakib',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      HelpTextField(
                        nameField: 'Phone Number',
                        initialValue:
                            profileController?.profileModel?.data?.phone ?? "",
                        controller: phoneController,
                        validator: (value) => AppValidTor.isMobile(value),
                        hintField: '+880',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      HelpTextField(
                        nameField: 'Email Address',
                        initialValue:
                            profileController?.profileModel?.data?.email ?? "",
                        controller: emailController,
                        validator: (value) => AppValidTor.isEmail(value),
                        hintField: 'example@mail.com',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      HelpTextField(
                        nameField: 'Detail Massage',
                        hintField: 'Type here',
                        feedbackMsgController: feedbackController,
                        validator: (value) => AppValidTor.isEmpty(value),
                        maxLine: 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<FeedbackViewModel>(
                  builder: (feedbackViewController) => Container(
                    width: wp(80),
                    child: RoundBoarderButton(
                      text: 'SEND',
                      padding: 8,
                      onPress: () async {
                        if (_formKey.currentState.validate()) {
                          await feedbackViewController.getFeedbackMethod(
                              name: nameController.text.isEmpty ||
                                      nameController?.text == null
                                  ? profileController
                                          ?.profileModel?.data?.name ??
                                      ""
                                  : nameController?.text ?? "",
                              phone: phoneController.text.isEmpty ||
                                      phoneController?.text == null
                                  ? profileController
                                          ?.profileModel?.data?.phone ??
                                      ""
                                  : phoneController?.text ?? "",
                              email: emailController.text.isEmpty ||
                                      emailController?.text == null
                                  ? profileController
                                          ?.profileModel?.data?.email ??
                                      ""
                                  : emailController?.text ?? "",
                              feedback: feedbackController.text);
                          if (feedbackViewController.feedbackModel.success ==
                              true) {
                            FlutterToast.showSuccess(
                                message: "Thank you for your feedback.",
                                context: context);
                            // feedbackViewController.feedbackModel.success = false;
                          }
                          setState(() {
                            nameController.clear();
                            phoneController.clear();
                            emailController.clear();
                            feedbackController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
