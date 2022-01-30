import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:blog_snake/views/detail_post/detail_post_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'side_card.dart';

class LastPostCard extends StatelessWidget {
  const LastPostCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);

    return SideCard(
      titleSection: 'Last Post\'s',
      bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _homeStore.posts.isNotEmpty
              ? _homeStore.posts
                  .sublist(0, 3)
                  .map((post) => LastPostItem(post: post))
                  .toList()
              : []),
    );
  }
}

class LastPostItem extends StatelessWidget {
  const LastPostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPostView(
                          post: post,
                        )));
          },
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    post.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                flex: 4,
                child: Text(
                  post.title,
                  maxLines: 2,
                  style: const TextStyle(
                      height: 1.5,
                      color: kDarkBlackColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
