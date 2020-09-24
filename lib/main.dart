import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/services/todo_service.dart';
import 'package:todo/core/utils/clipping_class.dart';
import 'package:todo/ui/todos/todos_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodosView(),
        // home: Scaffold(
        //   body: Stack(
        //     children: <Widget>[
        //       Positioned(
        //         bottom: 0,
        //         child: ClipPath(
        //           clipper: ClippingClass(),
        //           child: Container(
        //             color: Colors.red,
        //             height: 100,
        //             width: 400,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
