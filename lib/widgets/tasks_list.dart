import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'tasks_tile.dart';
import '../models/task_data.dart';
import '../screens/add_task_screen.dart';

class TaskList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        List _tasks = taskData.tasks;
        return ReorderableListView(
          onReorder: taskData.onReorder,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: List.generate(_tasks.length, (index) {
            return TaskTile(
              key: Key(index.toString()),
              id: (_tasks[index].id.toString() +
                  _tasks[index].name +
                  _tasks[index].id.toString()),
              taskTitle: _tasks[index].name,
              isChecked: _tasks[index].isDone,
              checkboxCallBack: (bool checkboxState) {
                taskData.toggleTaskDone(_tasks[index]);
              },
              deleteTaskCallBack: (DismissDirection dismissDirection) {
                if (dismissDirection == DismissDirection.endToStart) {
                  taskData.deleteTask(_tasks[index]);
                } else if (dismissDirection == DismissDirection.startToEnd) {
                  textEditingController.text = _tasks[index].name;
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AddTaskScreen(
                      text: 'Edit Task',
                      buttonText: 'Update',
                      onPressed: () =>
                          taskData.updateTask(newTaskTitle, _tasks[index]),
                    ),
                  ).whenComplete(() => textEditingController.text = '');
                }
              },
            );
          }),
        );

        // ListView.builder(
        //   // reverse: true,
        //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //   itemCount: taskData.taskCount,
        //   itemBuilder: (context, index) {
        //     List _tasks = taskData.tasks.reversed.toList();

        //     return TaskTile(
        //       onLongPress: () {
        //         textEditingController.text = _tasks[index].name;
        //         showModalBottomSheet(
        //           context: context,
        //           builder: (context) => AddTaskScreen(
        //             text: 'Edit Task',
        //             buttonText: 'Update',
        //             onPressed: () {
        //               taskData.updateTask(newTaskTitle, _tasks[index]);
        //             },
        //           ),
        //         ).then((value) => textEditingController.text = '');
        //       },
        //       id: (_tasks[index].id.toString() +
        //           _tasks[index].name +
        //           _tasks[index].id.toString()),
        //       taskTitle: _tasks[index].name,
        //       isChecked: _tasks[index].isDone,
        //       checkboxCallBack: (bool checkboxState) {
        //         taskData.toggleTaskDone(_tasks[index]);
        //       },
        //       deleteTaskCallBack: (DismissDirection dismissDirection) {
        //         if (dismissDirection == DismissDirection.endToStart) {
        //           taskData.deleteTask(_tasks[index]);
        //         } else if (dismissDirection == DismissDirection.startToEnd) {
        //           textEditingController.text = _tasks[index].name;
        //           showModalBottomSheet(
        //             context: context,
        //             builder: (context) => AddTaskScreen(
        //               text: 'Edit Task',
        //               buttonText: 'Update',
        //               onPressed: () =>
        //                   taskData.updateTask(newTaskTitle, _tasks[index]),
        //             ),
        //           ).whenComplete(() => textEditingController.text = '');
        //         }
        //       },
        //     );
        //   },
        // );
      },
    );
  }
}
