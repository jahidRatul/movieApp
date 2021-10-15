import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class HelpTextField extends StatefulWidget {
  final String nameField;
  final String hintField;
  final int maxLine;
  final TextEditingController controller;
  final TextEditingController feedbackMsgController;
  final String initialValue;
  final Function validator;

  HelpTextField(
      {this.nameField,
      this.hintField,
      this.controller,
      this.initialValue,
      this.validator,
      this.feedbackMsgController,
      this.maxLine = 1});

  @override
  _HelpTextFieldState createState() => _HelpTextFieldState();
}

class _HelpTextFieldState extends State<HelpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 25.0),
            child: Text(
              widget.nameField,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline1.color,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 5,
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
                  initialValue: widget.initialValue,
                  controller: widget.feedbackMsgController,
                  onChanged: (text) {
                    widget.controller.text = text;
                    print(widget.controller.text);
                  },
                  validator: widget.validator,
                  cursorColor: AppColors.textFieldTextColor,
                  maxLines: widget.maxLine,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textFieldTextColor,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 8, bottom: 8),
                    hintText: widget.hintField,
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: AppColors.textFieldTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
