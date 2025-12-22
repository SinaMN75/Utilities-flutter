import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:u/utils/extensions/iterable_extension.dart";

enum USideMenuMode { compact, open, close }

class USideMenuItem {
  final Widget icon;
  final String title;
  final Function(int index) onTap;
  final List<USideMenuItem>? children;

  USideMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.children,
  });
}

class USideMenu extends StatefulWidget {
  const USideMenu({required this.items, super.key});

  final List<USideMenuItem> items;

  @override
  State<USideMenu> createState() => _USideMenuState();
}

class _USideMenuState extends State<USideMenu> {
  RxDouble width = 280.0.obs;
  final Rx<USideMenuMode> mode = USideMenuMode.open.obs;
  late List<USideMenuItem> items;

  @override
  void initState() {
    items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Obx(
    () => SizedBox(
      width: width.value,
      child: Column(
        children: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const SizedBox(height: 100),
          Column(
            children: _items(mode: mode.value, items: items),
          ),
          const SizedBox(height: 100),
        ],
      ),
    ),
  );

  List<Widget> _items({
    required final USideMenuMode mode,
    required final List<USideMenuItem> items,
  }) {
    if (mode == USideMenuMode.compact) {
      return items
          .mapIndexed(
            (int index, USideMenuItem i) => IconButton(
              onPressed: () => i.onTap(index),
              icon: i.icon,
            ),
          )
          .toList();
    }
    if (mode == USideMenuMode.open) {
      return items
          .mapIndexed(
            (int index, USideMenuItem i) => ListTile(
              leading: i.icon,
              title: Text(i.title),
              onTap: () => i.onTap(index),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          )
          .toList();
    }

    return <Widget>[const Text("")];
  }
}
