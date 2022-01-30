import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/controllers/stores/web_menu_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.menuItemName,
    required this.selectedIndex,
    required this.itemIndex,
  }) : super(key: key);

  final String menuItemName;
  final int selectedIndex;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);
    final _webMenuStore = Provider.of<WebMenuStore>(context);

    return ListTile(
      title: Text(
        menuItemName,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      selected: itemIndex == _webMenuStore.selectedIndex,
      selectedColor: Colors.white,
      selectedTileColor: kPrimaryColor,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 15,
      ),
      onTap: () {
        _webMenuStore.updateIndex(itemIndex);
        _homeStore.toggleDrawer();
      },
    );
  }
}
