import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/constants.dart';
import 'package:task_manager/provider/task_provider.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final  taskProv = Provider.of<TaskProvider>(context,listen: true);
   
    return Container(
            padding:  EdgeInsets.fromLTRB(
                15, 15, 15,MediaQuery.of(context).viewInsets.bottom + 15),
            decoration: const BoxDecoration(
                color: myWhiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                        color: myBlackColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter title",
                    contentPadding: EdgeInsets.all(15),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(fontSize: 10),
                  ),
                  keyboardType: TextInputType.emailAddress,
                 
                  onChanged: (value) {
                    taskProv.processingTask.title = value;
                    taskProv.updateProcessingTask(taskProv.processingTask);
                   

                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Mark as completed',
                        style: myTitleTextStyle,
                      ),
                     const Spacer(),
                      Checkbox(
                          value: taskProv.processingTask. isCompleted ?? false,
                          onChanged: (value) {
                           taskProv.processingTask.isCompleted = value;
                           taskProv.updateProcessingTask(taskProv.processingTask);
                          })
                    ],
                  ),
                ),
               
                GestureDetector(
                  onTap:(taskProv.processingTask.title?.isEmpty ?? true) ? null : () {             
                    taskProv.addTask();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: (taskProv.processingTask.title?.isEmpty ?? true) ? Colors.grey.withOpacity(0.6) : myPrimaryColor,
                        
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      'Add Task',
                      style: myTitleTextStyle.apply(
                        color: myWhiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
