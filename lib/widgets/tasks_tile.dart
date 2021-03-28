import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final ValueKey key;
  final String id;
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  final Function deleteTaskCallBack;
  final Function onLongPress;
  TaskTile(
      {
        this.key,
        this.id,
      this.isChecked,
      this.taskTitle,
      this.checkboxCallBack,
      this.deleteTaskCallBack,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return 
    Dismissible(
      key: Key(id),
      onDismissed: deleteTaskCallBack,
      background: Container(
        color: Colors.green,
        child: ListTile(
          leading: Icon(Icons.edit, color: Colors.white, size: 36.0),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: ListTile(
          trailing: Icon(Icons.delete_forever, color: Colors.black, size: 36.0),
        ),
      ),
      child: ListTile(
        key: key,
        // onLongPress: onLongPress,

        // subtitle: Text(id),
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked ?? false,
          onChanged: checkboxCallBack,
        ),
      ),
    );
  }
}
