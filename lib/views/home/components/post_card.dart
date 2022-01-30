import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:blog_snake/views/_shared/logo_snake_blog.dart';
import 'package:blog_snake/views/detail_post/detail_post_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'post_interaction_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final String datePublished =
        DateFormat('dd/mm/yyyy').format(post.datePublished!);

    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPostView(post: post,)));
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: kDefaultPadding/2,),
                    Text(
                      post.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: Responsive.isDesktop(context)? 32:24,
                          color: kDarkBlackColor,
                          height: 1.3,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      post.body,
                      maxLines: 4,
                      style: const TextStyle(height: 1.5),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPostView(post: post,)));

                            },
                            style: TextButton.styleFrom(
                                primary: kPrimaryColor, padding: EdgeInsets.zero),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding / 4),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: kPrimaryColor, width: 3))),
                              child: const Text(
                                'Read More',
                                style: TextStyle(
                                    color: kDarkBlackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            )),
                        const Spacer(),
                        PostInteractionButton(
                          iconPath: 'assets/icons/like_heart_icon.svg',
                          onPressed: () {},
                          tooltip: 'Like the post',
                        ),
                        PostInteractionButton(
                          iconPath: 'assets/icons/comment_icon.svg',
                          onPressed: () {},
                          tooltip: 'Comment the post',
                        ),
                        PostInteractionButton(
                          iconPath: 'assets/icons/share_icon.svg',
                          onPressed: () {},
                          tooltip: 'Share the post',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
