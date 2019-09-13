import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_scoped_model_list/model/list_model.dart';
import 'package:flutter_scoped_model_list/list_page.dart';

///用于显示选中的列表项目和提供跳转到ListPage的入口
class ShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("show"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScopedModelDescendant<ListModel>(builder: (context, child, model) {
              String seleted = model.selected;
              return Text(seleted);
            }),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 36),
                textColor: Colors.white,
                child: Text('前往列表'),
                color: Colors.lightBlue,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ListPage();
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
