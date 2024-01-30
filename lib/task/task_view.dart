
import 'package:flutter/material.dart';
import 'package:task_manager/widgets/task_card.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key,required this.tasks, required this.seletedTab});
  final List tasks;
  final int seletedTab;

  @override
  Widget build(BuildContext context) {
    if(tasks.isEmpty && seletedTab == 0){
      return const Center(child: Text('No Task is added yet!'),);
    }
    if(tasks.isEmpty && seletedTab == 1){
      return const Center(child: Text('No pending task found!'),);
    }
    if(tasks.isEmpty && seletedTab == 2){
      return const Center(child: Text('No task is completed yet!'),);
    }
    return ListView.builder(
           physics:const  BouncingScrollPhysics(),
           padding: const EdgeInsets.only(bottom: 100),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: tasks[index]);
            },
          );
  }
}
