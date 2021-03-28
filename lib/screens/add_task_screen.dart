import 'package:flutter/material.dart';

String newTaskTitle;
TextEditingController textEditingController = TextEditingController();

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.text, this.buttonText, this.onPressed});
  final String text;
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 80, right: 80),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
                ),
                TextField(
                  controller: textEditingController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlueAccent),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {
                        if (newTaskTitle == '' || newTaskTitle == null) {
                        } else {
                          onPressed();
                        }

                        Navigator.pop(context);

                        newTaskTitle = '';
                      },
                      child: Text(buttonText)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
