import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/controllers/stores/web_menu_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class WebMenu extends StatelessWidget {
  const WebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebMenuStore _webMenuStore = Provider.of<WebMenuStore>(context);

    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _webMenuStore.menuItems.length,
              (index) => WebMenuItem(
                title: _webMenuStore.menuItems[index],
                isActive: index == _webMenuStore.selectedIndex ? true : false,
                onPressed: () {
                  _webMenuStore.updateIndex(index);
                },
              ),
            ),
          ),

        ],
      );
    });
  }
}

class WebMenuItem extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  const WebMenuItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isActive,
  }) : super(key: key);

  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    } else if (!widget.isActive && _isHover) {
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedContainer(
          duration: kDefaultDuration,
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2.9),
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                fontWeight:
                    widget.isActive ? FontWeight.bold : FontWeight.normal),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: _borderColor(), width: 3),
            ),
          )),
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
    );
  }
}
