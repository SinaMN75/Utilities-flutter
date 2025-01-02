import 'package:u/utilities.dart';

enum DataType {
  DataList,
  DataMap,
}

/// @create at 2021/7/15 15:01
/// @create by kevin
/// @desc  参数类型配置
class TreeConfig {
  ///数据类型

  final DataType dataType;

  ///父级id key
  final String parentId;

  ///value key
  final String value;

  ///
  final String label;

  ///
  final String id;

  ///
  final String children;

  const TreeConfig({
    this.dataType = DataType.DataMap,
    this.parentId = 'parentId',
    this.value = 'value',
    this.label = 'label',
    this.id = 'id',
    this.children = 'children',
  });
}

/// @create at 2021/7/15 15:01
/// @create by kevin
/// @desc components
class FlutterTreePro extends StatefulWidget {
  /// source data type Map
  final Map<String, dynamic> treeData;

  ///  source data type List
  final List<Map<String, dynamic>> listData;

  ///  initial source data type Map
  final Map<String, dynamic> initialTreeData;

  ///  initial source data type List
  final List<Map<String, dynamic>> initialListData;

  final Function(List<Map<String, dynamic>>) onChecked;

  ///  Config
  final TreeConfig config;

  /// if expanded items
  final bool isExpanded;

  const FlutterTreePro({
    required this.onChecked,
    super.key,
    this.treeData = const <String, dynamic>{},
    this.initialTreeData = const <String, dynamic>{},
    this.config = const TreeConfig(),
    this.listData = const <Map<String, dynamic>>[],
    this.initialListData = const <Map<String, dynamic>>[],
    this.isExpanded = false,
  });

  @override
  _FlutterTreeProState createState() => _FlutterTreeProState();
}

class _FlutterTreeProState extends State<FlutterTreePro> {
  ///
  Map<String, dynamic> sourceTreeMap = {};

  ///
  bool checkedBox = false;

  ///
  int selectValue = 0;

  ///
  Map<int, String> checkedMap = {
    0: '',
    1: 'partChecked',
    2: 'checked',
  };

  /// @params
  /// @desc expand map tree to map
  Map treeMap = {};

  @override
  initState() {
    super.initState();
    // set default select
    if (widget.config.dataType == DataType.DataList) {
      var listToMap = DataUtil.transformListToMap(widget.listData, widget.config);
      sourceTreeMap = listToMap;
      factoryTreeData(sourceTreeMap);
      for (var element in widget.initialListData) {
        element['checked'] = 0;
      }
      for (var item in widget.initialListData) {
        for (var element in treeMap.values.toList()) {
          if (item['id'] == element['id']) {
            setCheckStatus(element);
            break;
          }
        }
        selectCheckedBox(item);
      }
    } else {
      sourceTreeMap = widget.treeData;
    }
  }

  /// @params
  /// @desc set current item checked
  setCheckStatus(item) {
    item['checked'] = 2;
    if (item['children'] != null) {
      item['children'].forEach((element) {
        setCheckStatus(element);
      });
    }
  }

  /// @params
  /// @desc expand tree data to map
  factoryTreeData(treeModel) {
    treeModel['open'] = widget.isExpanded;
    treeModel['checked'] = 0;
    treeMap.putIfAbsent(treeModel[widget.config.id], () => treeModel);
    (treeModel[widget.config.children] ?? []).forEach((element) {
      factoryTreeData(element);
    });
  }

  /// @params
  /// @desc render parent
  buildTreeParent() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onOpenNode(sourceTreeMap),
          child: Container(
            width: MediaQuery.of(navigatorKey.currentContext!).size.width,
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    (sourceTreeMap[widget.config.children] ?? []).isNotEmpty
                        ? Icon(
                            (sourceTreeMap['open'] ?? false) ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right,
                            size: 20,
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectCheckedBox(sourceTreeMap);
                      },
                      child: buildCheckBoxIcon(sourceTreeMap),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        '${sourceTreeMap[widget.config.label]}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                (sourceTreeMap['open'] ?? false)
                    ? Column(
                        children: buildTreeNode(sourceTreeMap),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// @params
  /// @desc render item
  buildTreeNode(Map<String, dynamic> data) {
    return (data[widget.config.children] ?? []).map<Widget>(
      (e) {
        return GestureDetector(
          onTap: () => onOpenNode(e),
          child: Container(
            width: MediaQuery.of(navigatorKey.currentContext!).size.width,
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    (e[widget.config.children] ?? []).isNotEmpty
                        ? Icon(
                            (e['open'] ?? false) ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right,
                            size: 20,
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectCheckedBox(e);
                      },
                      child: buildCheckBoxIcon(e),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        '${e[widget.config.label]}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                (e['open'] ?? false)
                    ? Column(
                        children: buildTreeNode(e),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    ).toList();
  }

  /// @params
  /// @desc render icon by checked type
  Icon buildCheckBoxIcon(Map<String, dynamic> e) {
    switch (e['checked'] ?? 0) {
      case 0:
        return Icon(
          Icons.check_box_outline_blank,
          color: Color(0XFFCCCCCC),
        );
      case 1:
        return Icon(
          Icons.indeterminate_check_box,
          color: Color(0X990000FF),
        );
      case 2:
        return Icon(
          Icons.check_box,
          color: Color(0X990000FF),
        );
      default:
        return Icon(Icons.remove);
    }
  }

  /// @params
  /// @desc expand item if has item has children
  onOpenNode(Map<String, dynamic> model) {
    if ((model[widget.config.children] ?? []).isEmpty) return;
    model['open'] = !model['open'];
    setState(() {
      sourceTreeMap = sourceTreeMap;
    });
  }

  /// @params
  /// @desc
  selectNode(Map<String, dynamic> dataModel) {
    setState(() {
      selectValue = dataModel['value']!;
    });
  }

  /// @params
  /// @desc 选中帅选框
  selectCheckedBox(Map<String, dynamic> dataModel) {
    int checked = dataModel['checked']!;
    if ((dataModel[widget.config.children] ?? []).isNotEmpty) {
      var stack = MStack();
      stack.push(dataModel);
      while (stack.top > 0) {
        Map<String, dynamic> node = stack.pop();
        for (var item in node[widget.config.children] ?? []) {
          stack.push(item);
        }
        if (checked == 2) {
          node['checked'] = 0;
        } else {
          node['checked'] = 2;
        }
      }
    } else {
      if (checked == 2) {
        dataModel['checked'] = 0;
      } else {
        dataModel['checked'] = 2;
      }
    }

    // 父节点
    if (dataModel[widget.config.parentId]! > 0) {
      updateParentNode(dataModel);
    }
    setState(() {
      sourceTreeMap = sourceTreeMap;
    });
    getCheckedItems();
  }

  /// @params
  /// @desc 获取选中的条目
  getCheckedItems() {
    var stack = MStack();
    var checkedList = [];
    stack.push(sourceTreeMap);
    while (stack.top > 0) {
      var node = stack.pop();
      for (var item in (node[widget.config.children] ?? [])) {
        stack.push(item);
      }
      if (node['checked'] == 2) {
        checkedList.add(node);
      }
    }

    // logger.v(checkedList.length);

    // List中多余的元素
    var list1 = [];
    for (var value2 in checkedList) {
      if (value2['children'] != null && value2['children'].isNotEmpty) {
        for (var value in checkedList) {
          if (value2['id'] == value['parentId']) {
            list1.add(value);
          }
        }
      }
    }

    // 移除List中多余的元素
    var set = Set.from(checkedList);
    var set2 = Set.from(list1);
    List<Map<String, dynamic>> filterList = List.from(set.difference(set2));
    widget.onChecked(filterList);
    // var submitList = filterList
    //     .map(
    //       (e) => {
    //         "subject": e['subject'],
    //         "exams": e['exams'],
    //         "parentId": e['parentId'],
    //         "knowledgeNo": e['knowledgeNo'],
    //         "knowledgeName": e['knowledgeName'],
    //         "examPaperData": e['examPaperData'],
    //         "id": e['id'],
    //         "level": e['level'],
    //       },
    //     )
    //     .toList();
    // logger.v(submitList.length);
    // logger.v(submitList);
  }

  /// @params
  /// @desc
  updateParentNode(Map<String, dynamic> dataModel) {
    var par = treeMap[dataModel[widget.config.parentId]];
    if (par == null) return;
    int checkLen = 0;
    bool partChecked = false;
    for (var item in (par[widget.config.children] ?? [])) {
      if (item['checked'] == 2) {
        checkLen++;
      } else if (item['checked'] == 1) {
        partChecked = true;
        break;
      }
    }

    // 如果子孩子全都是选择的， 父节点就全选
    if (checkLen == (par[widget.config.children] ?? []).length) {
      par['checked'] = 2;
    } else if (partChecked || (checkLen < (par[widget.config.children] ?? []).length && checkLen > 0)) {
      par['checked'] = 1;
    } else {
      par['checked'] = 0;
    }

    // 如果还有父节点 解析往上更新
    if (treeMap[par[widget.config.parentId]] != null || treeMap[par[widget.config.parentId]] == 0) {
      updateParentNode(par);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: buildTreeParent(),
      ),
    );
  }
}

class MStack {
  int top = 0;
  List items = [];

  push(item) {
    top++;
    items.add(item);
  }

  pop() {
    --top;
    return items.removeLast();
  }

  peek() {
    return items[top - 1];
  }
}

class DataUtil {
  /// @params
  /// @desc  List to map
  static Map<String, dynamic> transformListToMap(List dataList, TreeConfig config) {
    Map obj = {};
    int? rootId;
    for (var v in dataList) {
      // 根节点
      if (v[config.parentId] != 0) {
        if (obj[v[config.parentId]] != null) {
          if (obj[v[config.parentId]][config.children] != null) {
            obj[v[config.parentId]][config.children].add(v);
          } else {
            obj[v[config.parentId]][config.children] = [v];
          }
        } else {
          obj[v[config.parentId]] = {
            config.children: [v],
          };
        }
      } else {
        rootId = v[config.id];
      }
      if (obj[v[config.id]] != null) {
        v[config.children] = obj[v[config.id]][config.children];
      }
      obj[v[config.id]] = v;
    }
    return obj[rootId] ?? {};
  }

  /// @params
  /// @desc expand tree map
  Map<String, dynamic> expandMap(Map<String, dynamic> dataMap, TreeConfig config) {
    dataMap['open'] = false;
    dataMap['checked'] = 0;
    dataMap.putIfAbsent(dataMap[config.id], () => dataMap);
    (dataMap[config.children] ?? []).forEach((element) {
      expandMap(element, config);
    });
    return {"aaa": ""};
  }

  /// @params
  /// @desc 将树形结构数据平铺开
// factoryTreeData(treeModel ,Config config) {
//   treeModel['open'] = false;
//   treeModel['checked'] = 0;
//   treeMap.putIfAbsent(treeModel[config.id], () => treeModel);
//   (treeModel[config.children] ?? []).forEach((element) {
//     factoryTreeData(element);
//   });
// }
}
