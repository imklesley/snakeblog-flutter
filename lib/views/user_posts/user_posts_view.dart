import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/user_posts_store.dart';
import 'package:blog_snake/views/_shared/logo_snake_blog.dart';
import 'package:blog_snake/views/create_post/create_post_view.dart';
import 'package:blog_snake/views/detail_post/detail_post_view.dart';
import 'package:blog_snake/views/home/components/custom_app_bar.dart';
import 'package:blog_snake/views/home/components/post_card.dart';
import 'package:blog_snake/views/home/components/post_interaction_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class UserPostsView extends StatelessWidget {
  UserPostsView({Key? key}) : super(key: key);
  final UserPostStore _userPostStore = UserPostStore();

  @override
  Widget build(BuildContext context) {
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
            : GridView.count(
              crossAxisCount: 4,
              children: _userPostStore.posts
                  .map((post) => Card(
                child: Column(
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
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Container(
                              color: kDarkBlackColor,
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    LogoSnakeBlog(),
                                    Text(
                                      'There was an error loading the image, it may not exist.',
                                      style:
                                      TextStyle(color: kPrimaryColor, fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ))
                  .toList(),
            );
      }),
    );
  }
}
