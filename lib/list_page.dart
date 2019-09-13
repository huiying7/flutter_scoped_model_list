import 'package:flutter/material.dart';
import 'package:flutter_scoped_model_list/model/list_model.dart';
import 'package:scoped_model/scoped_model.dart';

///用于加载显示列表
class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  ///进行列表的加载工作
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///ScopedModel作为根布局,提供model
    ListModel model = ScopedModel.of<ListModel>(context);
    if (!model.isInit) {
      ///加载列表
      model.loadList();
    }
  }

  buildLoad() {
    return Center(
      child: Text("正在加载中..."),
    );
  }

  buildList(list) {
    return ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]),
            onTap: () {
              ListModel model = ScopedModel.of<ListModel>(context);
              model.select(list[index]);

              ///返回到上一级页面
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),

      ///ScopedModelDescendant作为子布局,响应model
      body: ScopedModelDescendant<ListModel>(builder: (context, child, model) {
        if (!model.isInit) {
          ///显示loading界面
          return buildLoad();
        } else {
          var list = model.list;
          return buildList(list);
        }
      }),
    );
  }
}
