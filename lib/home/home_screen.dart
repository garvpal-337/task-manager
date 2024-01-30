import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/constants.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/provider/task_provider.dart';
import 'package:task_manager/task/add_task_form.dart';
import 'package:task_manager/task/task_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  List myTabs = [
    "All",
    "Pending",
    "Completed"
  ];
@override
  void initState() {
     _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final taskProv = Provider.of<TaskProvider>(context);
    List<TaskModel> tasks = taskProv.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        elevation: 0,
        titleTextStyle: myAppBarTextStyle,
        backgroundColor: Colors.white,
      ),
      
      body: DefaultTabController(
      
        length: 3, 
      child:  Column(
       children: [

        
         TabBar(
          padding: const EdgeInsets.all(15),
           controller: _tabController,
  indicator: BoxDecoration(
    color: myPrimaryColor, // Color for the selected tab
    borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
  ),
  unselectedLabelColor: myPrimaryColor,
  labelColor: myWhiteColor,
  onTap: (value) {
    taskProv.updateTab(value);
  },
  tabs: myTabs.map((tabText) {
         final isSelected = taskProv.selectedTab == myTabs.indexOf(tabText);
         return Container(
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            tabText,
            style: myTitleTextStyle.copyWith(
              color: isSelected
                  ? myWhiteColor 
                  : myPrimaryColor,
            ),
          ),
        );
       }).toList(),),
        Expanded(child: TabBarView(
          controller: _tabController,
          children: [
          TaskView(tasks: tasks,seletedTab: taskProv.selectedTab,),
          TaskView(tasks: tasks.where((element) => element.isCompleted == false).toList(),seletedTab: taskProv.selectedTab,),
          TaskView(tasks: tasks.where((element) => element.isCompleted == true).toList(),seletedTab: taskProv.selectedTab,),
          
        ]))
       ],

       
     ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: myTranspsarent,
            builder: (context) {
              return const AddTaskForm();
            },
          );
          
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
