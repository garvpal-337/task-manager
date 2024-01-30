import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/home/home_screen.dart';
import 'package:task_manager/provider/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider(),)
        // Provider(create: (context) => TaskProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
