import 'package:flutter/material.dart';
import '../widget/task_list.dart';
import 'add_task_screen.dart';
import 'package:todo/Model/task.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: "Go to Gym")
  ];

  void addTask(String newTask) {
    setState(() {
      tasks.add(Task(name: newTask));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => AddTaskScreen(
            addTaskCallback: (String newTaskTitle) {
              setState(() {
                addTask(newTaskTitle);
              });
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60, left: 30, right: 30, bottom: 30),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Today",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${tasks.length} Tasks",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TasksList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
