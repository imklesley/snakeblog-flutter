import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/views/_shared/auth_buttons.dart';
import 'package:blog_snake/views/_shared/logo_snake_blog.dart';
import 'package:blog_snake/views/_shared/social_buttons.dart';
import 'package:blog_snake/views/home/components/web_menu.dart';
import 'package:blog_snake/views/user_posts/user_posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);
    final _appStore = Provider.of<AppStore>(context);

    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              // TODO: Resolver essa gambiarra aqui... fica dando warning de que não há necessidade de observer quando o elemento não está sendo visto na tela -- Isso só acontece quando vai pra tela mobile
              child: !Responsive.isMobile(context)
                  ? Observer(builder: (context) {
                      return Row(
                        children: [
                          if (!Responsive.isDesktop(context))
                            IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _homeStore.toggleDrawer();
                              },
                            ),
                          if (Responsive.isMobile(context)) const Spacer(),
                          const LogoSnakeBlog(),
                          if (!Responsive.isMobile(context)) const Spacer(),
                          if (Responsive.isDesktop(context)) const WebMenu(),
                          const Spacer(),
                          if (!Responsive.isMobile(context))
                            const SocialButtons(),
                          if (!Responsive.isMobile(context) &&
                              !_appStore.isUserAuthenticated)
                            Row(
                              children: const [
                                SizedBox(
                                  width: kDefaultPadding / 1.5,
                                ),
                                LoginButton(),
                                SizedBox(
                                  width: kDefaultPadding / 1.5,
                                ),
                                RegisterButton(),
                              ],
                            ),
                          if (!Responsive.isMobile(context) &&
                              _appStore.isUserAuthenticated)
                            Row(
                              children: [
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
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
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
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
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _appStore.logoutUser();
                                    },
                                    child: const Text(
                                      'Logout',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ))
                              ],
                            )
                        ],
                      );
                    })
                  : Row(
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _homeStore.toggleDrawer();
                            },
                          ),
                        if (Responsive.isMobile(context)) const Spacer(),
                        const LogoSnakeBlog(),
                        if (!Responsive.isMobile(context)) const Spacer(),
                        if (Responsive.isDesktop(context)) const WebMenu(),
                        const Spacer(),
                        if (!Responsive.isMobile(context)) const SocialButtons(),
                        if (!Responsive.isMobile(context) &&
                            !_appStore.isUserAuthenticated)
                          Row(
                            children: const [
                              SizedBox(
                                width: kDefaultPadding / 1.5,
                              ),
                              LoginButton(),
                              SizedBox(
                                width: kDefaultPadding / 1.5,
                              ),
                              RegisterButton(),
                            ],
                          ),
                        if (!Responsive.isMobile(context) &&
                            _appStore.isUserAuthenticated)
                          Row(
                            children: [
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
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
                              )
                            ],
                          )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
