import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class TaskProvider extends ChangeNotifier{
  
  TaskModel processingTask = TaskModel();
  
  // this is a list off all the tasks 
  List<TaskModel> _items = [];
  List<TaskModel> get items{
    return [..._items];
  }
  
  // it will update the task on add_task_form.dart
  void updateProcessingTask(TaskModel task){
    processingTask = task;
    notifyListeners();
  }

  // it will handle the tabs on home...
  int selectedTab = 0;
  void updateTab(int index){
    selectedTab = index;
    notifyListeners();
  }
  
  // it will add task to the _items...
  void addTask(){
    processingTask.isCompleted = processingTask.isCompleted ?? false;
    processingTask.id = DateTime.now().microsecondsSinceEpoch.toString();
    _items.add(processingTask);
    processingTask = TaskModel();
    notifyListeners();
  }
 
 // it will update the status of the task which is already added...
  void updateTaskStatus(context,TaskModel task){
    for(var item in _items){
      if(item.id == task.id){
        item.isCompleted = !item.isCompleted!;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.hardEdge,
          duration: const Duration(seconds: 1),
          content: Text('${item.title} is marked as ${(item.isCompleted ?? false) ? "completed" : "pending"}.')));
      }
      notifyListeners();
    }
  }
}