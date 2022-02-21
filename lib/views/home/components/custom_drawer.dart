import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/web_menu_store.dart';
import 'package:blog_snake/views/_shared/auth_buttons.dart';
import 'package:blog_snake/views/_shared/logo_snake_blog.dart';
import 'package:blog_snake/views/user_posts/user_posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final _webMenuStore = WebMenuStore();
    final _appStore = Provider.of<AppStore>(context);

    return Drawer(
      backgroundColor: kDarkBlackColor,
      child: SafeArea(
        child: ListView(
          children: [
            Observer(
              builder: (context) {
                return DrawerHeader(
                  child: Stack(
                    children: [
                      const Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: LogoSnakeBlog()),
                      if (!Responsive.isDesktop(context) &&
                          _appStore.isUserAuthenticated)
                        Positioned(
                          bottom: 0,
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Hello, ',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: _appStore.user!.firstName,
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: kDefaultPadding/2,
                              ),
                              const Text('-',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              const SizedBox(
                                width: kDefaultPadding/2,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>UserPostsView()));
                                },
                                child: const Text(
                                  'My Posts',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
            //Foi feito o uso de cascade para acessar a lista children de listview e adicionar os outros elementos
            ...List.generate(
              _webMenuStore.menuItems.length,
              (index) {
                final String menuItemName = _webMenuStore.menuItems[index];
                final int selectedIndex = _webMenuStore.selectedIndex;

                return DrawerItem(
                    menuItemName: menuItemName,
                    selectedIndex: selectedIndex,
                    itemIndex: index);
              },
            ),

            Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 2),
              child: Observer(builder: (context) {
                return _appStore.isUserAuthenticated
                    ? ElevatedButton(
                        onPressed: () {
                          _appStore.logoutUser();
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          RegisterButton(),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          LoginButton(),
                        ],
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
