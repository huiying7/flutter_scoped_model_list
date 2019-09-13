import 'package:scoped_model/scoped_model.dart';
import 'dart:collection';

class ListModel extends Model {
  ///列表初始化标志
  bool _init = false;

  ///列表数据
  List<String> _list = [];

  ///选中的列表项
  String _selected = '未选中';

  bool get isInit => _init;

  UnmodifiableListView<String> get list => UnmodifiableListView(_list);

  String get selected => _selected;

  ///选中列表项目
  void select(String selected) {
    _selected = selected;

    ///通知UI更新
    notifyListeners();
  }

  ///加载列表
  void loadList() async {
    ///模拟网络请求
    await Future.delayed(Duration(microseconds: 3000));
    _list = [
      '1. Scoped Model',
      '2. Scoped Model',
      '3. Scoped Model',
      '4. Scoped Model',
      '5. Scoped Model',
      '6. Scoped Model',
      '7. Scoped Model',
      '8. Scoped Model',
      '9. Scoped Model',
      '10. Scoped Model',
    ];

    _init = true;
    //通知UI更新
    notifyListeners();
  }
}
