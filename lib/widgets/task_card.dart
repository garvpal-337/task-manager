
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/constants.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/provider/task_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final taskProv = Provider.of<TaskProvider>(context);
    bool isCompleted = task.isCompleted ?? false;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        padding:const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
       color: myPrimaryColor.withOpacity(0.2)
        ),
        child: Column(
          children: [
        
            Row(children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted? myGreenColor : myRedColor
                ),
                child:   Icon( isCompleted ?  Icons.check : Icons.close,color: myWhiteColor,) ,
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(task.title.toString(),style: myTitleTextStyle,),
                  const SizedBox(height: 4,),
                  Text(isCompleted  ? "Completed" : "Pending")
                ],),
              ),
           
             Checkbox(value: task.isCompleted ?? false,
            
            fillColor: MaterialStatePropertyAll((task.isCompleted ?? false) ? myGreenColor: myRedColor),
             onChanged: (value){
           taskProv.updateTaskStatus(context,task);
             })
              
            ],),
          ],
        ),
    );
  }
}