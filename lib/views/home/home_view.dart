import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/views/auth/login_view.dart';
import 'package:blog_snake/views/create_post/create_post_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/config/constants.dart';
import '/config/responsive.dart';
import '/controllers/stores/home_store.dart';
import 'components/categories_card.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';
import 'components/last_post_card.dart';
import 'components/posts_feed.dart';
import 'components/search_card.dart';
import 'components/top_banner.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);
    final _appStore = Provider.of<AppStore>(context);

    return SafeArea(
        child: Scaffold(
      key: _homeStore.scaffoldKey,
      drawer: !Responsive.isDesktop(context) ? CustomDrawer() : null,
      floatingActionButton: Tooltip(
        message: 'Create a new blog post',
        child: Responsive.isMobile(context)
            ? FloatingActionButton(
                onPressed: () {
                  if (_appStore.isUserAuthenticated) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreatePostView()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginView()),
                    );
                  }
                },
                child: const Icon(Icons.add),
              )
            : null,
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBanner(),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: PostsFeed(),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(
                      width: 20,
                    ),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: kDefaultPadding * 2,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const CreatePostView()),
                                  );
                                },
                                child: const Text('Create a new blog post')),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const SearchCard(),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const CategoriesCard(),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const LastPostCard()
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //Pra fazer o footer não ficar visível, somente quando chegar ao fim do scroll
            if (_homeStore.posts.isEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height,
              ),
            Container(
              color: kDarkBlackColor,
              width: double.infinity,
              height: 200,
              child: const Center(
                child: Text(
                  'Footer',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
