import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/controllers/stores/user_posts_store.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:blog_snake/views/_shared/logo_snake_blog.dart';
import 'package:blog_snake/views/create_post/create_post_view.dart';
import 'package:blog_snake/views/detail_post/detail_post_view.dart';
import 'package:blog_snake/views/home/components/custom_app_bar.dart';
import 'package:blog_snake/views/home/components/post_interaction_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserPostsView extends StatelessWidget {
  UserPostsView({Key? key}) : super(key: key);
  final UserPostStore _userPostStore = UserPostStore();

  @override
  Widget build(BuildContext context) {
    final HomeStore _homeStore = Provider.of<HomeStore>(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: CustomAppBar(),
      ),
      body: Observer(builder: (context) {
        return _userPostStore.posts.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You don\'t have any posts',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      child: const Text(
                        'Create a post',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CreatePostView()));
                      },
                    ),
                  ],
                ),
              )
            : Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: kMaxWidth),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(kDefaultPadding),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isDesktop(context)
                            ? 3
                            : Responsive.isTablet(context)
                                ? 2
                                : 1,
                        crossAxisSpacing: kDefaultPadding,
                        mainAxisSpacing: kDefaultPadding,
                      ),
                      itemCount: _userPostStore.posts.length,
                      itemBuilder: (context, index) {
                        PostModel post = _userPostStore.posts[index];

                        final String datePublished = DateFormat('dd/MM/yyyy')
                            .format(post.datePublished!);

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        DetailPostView(post: post)));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(kDefaultPadding / 2))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1.78,
                                    child: Image.network(
                                      post.image!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Container(
                                          color: kDarkBlackColor,
                                          child: FittedBox(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                LogoSnakeBlog(),
                                                Text(
                                                  'There was an error loading the image, it may not exist.',
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 18),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            post.tag.toUpperCase(),
                                            style: const TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'Last Update: ' + datePublished,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(fontSize: 12),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: kDefaultPadding / 3,
                                      ),
                                      Text(
                                        post.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize:
                                                Responsive.isDesktop(context)
                                                    ? 24
                                                    : 16,
                                            color: kDarkBlackColor,
                                            height: 1.3,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailPostView(
                                                              post: post,
                                                            )));
                                              },
                                              style: TextButton.styleFrom(
                                                  primary: kPrimaryColor,
                                                  padding: EdgeInsets.zero),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    bottom:
                                                        kDefaultPadding / 4),
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                kPrimaryColor,
                                                            width: 3))),
                                                child: const Text(
                                                  'Read More',
                                                  style: TextStyle(
                                                      color: kDarkBlackColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              )),
                                          const Spacer(),
                                          PostInteractionButton(
                                            iconPath:
                                                'assets/icons/like_heart_icon.svg',
                                            onPressed: () {},
                                            tooltip: 'Like the post',
                                          ),
                                          PostInteractionButton(
                                            iconPath:
                                                'assets/icons/comment_icon.svg',
                                            onPressed: () {},
                                            tooltip: 'Comment the post',
                                          ),
                                          PostInteractionButton(
                                            iconPath:
                                                'assets/icons/share_icon.svg',
                                            onPressed: () {},
                                            tooltip: 'Share the post',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              );
      }),
    );
  }
}
