import 'package:flutter/material.dart';
import 'package:flutter_scoped_model_list/model/list_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_scoped_model_list/show_page.dart';

void main() {
  ///在UI上,使用ScopedModel作为根布局,提供Model,用ScopedModel包裹MyApp布局
  ListModel listModel = ListModel();
  runApp(ScopedModel(model: listModel, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShowPage(),
    );
  }
}

