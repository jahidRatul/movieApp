import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/utils/toast/flutter_toast.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

class EditProfilePage extends StatefulWidget {
  final int nestedId;

  EditProfilePage({this.nestedId});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool checkedValue = false;
  bool editNameEnable = false;
  bool editEmail = false;
  bool editPhone = false;
  bool editPassword = false;
  bool oldEditPassword = false;

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode oldPasswordNode = FocusNode();
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  allUnFocus() {
    nameNode.unfocus();
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    oldPasswordController.dispose();

    super.dispose();
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        elevation: 0,
        //  backgroundColor: AppColors.appBarColor,
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
        scrollDirection: Axis.vertical,
        child: GetBuilder<ProfileViewModel>(
          builder: (controller) => SafeArea(
            child: Column(
              children: [
                Container(
                  height: 220,
                  color: Theme.of(context).appBarTheme.color,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: wp(80),
                          child: Center(
                            child: Text(
                              'Upload Profile Image',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(66),
                            elevation: 2,
                            child: CircleAvatar(
                              child: CircleAvatar(
                                radius: 63,
                                backgroundImage: _image != null
                                    ? FileImage(_image)
                                    : NetworkImage(controller
                                                ?.profileModel?.data?.avatar ==
                                            null
                                        ? 'https://picsum.photos/100'
                                        : AppUrls.imageBaseUrl +
                                            controller
                                                ?.profileModel?.data?.avatar),
                              ),
                              backgroundColor: AppColors.white,
                              radius: 66,
                            ),
                          ),
                          Positioned(
                            right: hp(0),
                            bottom: wp(0),
                            child: Container(
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.white,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 20,
                                    color: AppColors.deepRed,
                                  ),
                                  onPressed: () {
                                    getImage();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: wp(100),
                        height: hp(.2),
                        color: AppColors.deepRed,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.searchBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: editNameEnable,

                          initialValue:
                              controller?.profileModel?.data?.name ?? "",
                          onChanged: (text) {
                            nameController.text = text;
                          },

                          // controller: nameController
                          //   ..text = controller?.profileModel?.data?.name
                          //   ..selection = TextSelection.fromPosition(
                          //     TextPosition(offset: nameController.text.length),
                          //   ),
                          focusNode: nameNode,
                          enableInteractiveSelection: editNameEnable,
                          cursorColor: AppColors.textFieldTextColor,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textFieldTextColor,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 8, bottom: 8),
                            // hintText: "MD. Shakib Khan",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.textFieldTextColor,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            editNameEnable = true;
                            allUnFocus();
                            setState(() {});
                            await Future.delayed(Duration(milliseconds: 500));
                            nameNode.requestFocus();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.deepRed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Email Address",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.searchBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: editEmail,
                          readOnly: true,
                          initialValue:
                              controller?.profileModel?.data?.email ?? "",

                          // controller: emailController
                          //   ..text = controller?.profileModel?.data?.email
                          //   ..selection = TextSelection.fromPosition(
                          //     TextPosition(offset: emailController.text.length),
                          //   ),
                          focusNode: emailNode,
                          enableInteractiveSelection: editEmail,
                          cursorColor: AppColors.textFieldTextColor,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textFieldTextColor,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 8, bottom: 8),
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.textFieldTextColor,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            editEmail = true;
                            allUnFocus();
                            setState(() {});
                            await Future.delayed(Duration(milliseconds: 500));
                            emailNode.requestFocus();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.deepRed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.searchBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: editPhone,
                          initialValue:
                              controller?.profileModel?.data?.phone ?? "",
                          onChanged: (text) {
                            phoneController.text = text;
                          },
                          // controller: phoneController
                          //   ..text = controller?.profileModel?.data?.phone
                          //   ..selection = TextSelection.fromPosition(
                          //     TextPosition(offset: phoneController.text.length),
                          //   ),
                          focusNode: phoneNode,
                          enableInteractiveSelection: editPhone,
                          cursorColor: AppColors.textFieldTextColor,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textFieldTextColor,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 8, bottom: 8),
                            // hintText: "+8801674695987",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.textFieldTextColor,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            editPhone = true;
                            allUnFocus();
                            setState(() {});
                            await Future.delayed(Duration(milliseconds: 500));
                            phoneNode.requestFocus();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.deepRed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Old Password",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.searchBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: oldEditPassword,
                          onChanged: (text) {
                            oldPasswordController.text = text;
                          },
                          focusNode: oldPasswordNode,
                          enableInteractiveSelection: oldEditPassword,
                          cursorColor: AppColors.textFieldTextColor,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textFieldTextColor,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 8, bottom: 8),
                            // hintText: "asdf1234",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.textFieldTextColor,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            setState(() {
                              oldEditPassword = true;
                            });

                            allUnFocus();
                            // passwordNode.requestFocus();
                            await Future.delayed(Duration(milliseconds: 500));
                            oldPasswordNode.requestFocus();
                            print("passwordNode");
                          },
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.deepRed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "New Password",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.searchBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: editPassword,
                          onChanged: (text) {
                            passwordController.text = text;
                          },
                          focusNode: passwordNode,
                          enableInteractiveSelection: editPassword,
                          cursorColor: AppColors.textFieldTextColor,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textFieldTextColor,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 8, bottom: 8),
                            // hintText: "asdf1234",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.textFieldTextColor,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            setState(() {
                              editPassword = true;
                            });

                            allUnFocus();
                            // passwordNode.requestFocus();
                            await Future.delayed(Duration(milliseconds: 500));
                            passwordNode.requestFocus();
                            print("passwordNode");
                          },
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.deepRed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, top: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Theme(
                          data: ThemeData(
                              unselectedWidgetColor: AppColors.ShadowRed,
                              backgroundColor: Colors.white),
                          child: Center(
                            child: Container(
                              //  color: Colors.white,
                              child: Checkbox(
                                tristate: false,
                                checkColor: AppColors.ShadowRed,
                                activeColor: AppColors.white,
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Accept all ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).textTheme.headline1.color,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Term of Use',
                              style: TextStyle(
                                color: AppColors.ShadowRed,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ' & ',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                  color: AppColors.ShadowRed,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: wp(80),
                  child: RoundBoarderButton(
                    text: 'SAVE',
                    padding: 8,
                    onPress: checkedValue
                        ? () async {
                            await controller?.getUpdateUserProfileMethod(
                              name: nameController.text.isEmpty ||
                                      nameController?.text == null
                                  ? controller?.profileModel?.data?.name ?? ""
                                  : nameController?.text ?? "",
                              phone: phoneController.text.isEmpty ||
                                      phoneController?.text == null
                                  ? controller?.profileModel?.data?.phone ?? ""
                                  : phoneController?.text ?? "",
                              password: passwordController.text,
                              oldPassword: oldPasswordController.text,
                              img: _image,
                            );
                            if (controller.updateProfileViewModel.status ==
                                true) {
                              FlutterToast.showSuccess(
                                  message: "profile updated", context: context);
                            }

                            nameController.clear();
                            emailController.clear();
                            phoneController.clear();
                            passwordController.clear();
                            oldPasswordController.clear();
                          }
                        : null,
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
