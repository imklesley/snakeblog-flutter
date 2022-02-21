import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/views/auth/login_view.dart';
import 'package:blog_snake/views/create_post/create_post_view.dart';
import 'package:blog_snake/views/home/components/post_card.dart';
import 'package:blog_snake/views/home/components/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PostsFeed extends StatelessWidget {
  const PostsFeed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);
    final _appStore = Provider.of<AppStore>(context);

    return Column(
      children: [
        if (Responsive.isMobile(context))
          SizedBox(
            width: double.infinity,
            height: kDefaultPadding * 2,
            child: ElevatedButton(
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
                child: const Text('Create a new blog post')),
          ),
        if (Responsive.isMobile(context))
          const SizedBox(
            height: kDefaultPadding,
          ),
        if (Responsive.isMobile(context)) const SearchCard(),
        if (Responsive.isMobile(context))
          const SizedBox(
            height: kDefaultPadding,
          ),
        Observer(builder: (context) {
          return _homeStore.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ),
                )
              : _homeStore.posts.isNotEmpty
                  ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _homeStore.posts.length + 1,
              itemBuilder: (context, index) {
                if (index < _homeStore.posts.length) {
                  return PostCard(post: _homeStore.posts[index]);
                } else if (index >= _homeStore.posts.length &&
                    _homeStore.nextPageUrl != null) {
                  _homeStore.getNextPage();

                  if (_homeStore.isLoadingMorePosts) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            kPrimaryColor),
                      ),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              })
                  : SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding / 1.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'There is no post for this search!',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    _homeStore.getAllPosts();
                                  },
                                  child: const Text('Go back to main screen'))
                            ],
                          ),
                        ),
                      ));
        })
      ],
    );
  }
}
