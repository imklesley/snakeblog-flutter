import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:blog_snake/views/auth/login_view.dart';
import 'package:blog_snake/views/home/components/custom_app_bar.dart';
import 'package:blog_snake/views/home/components/custom_drawer.dart';
import 'package:blog_snake/views/update_post/update_post_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DetailPostView extends StatelessWidget {
  DetailPostView({Key? key, required this.post}) : super(key: key);

  PostModel post;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final _appStore = Provider.of<AppStore>(context);
    final _homeStore = Provider.of<HomeStore>(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(88),
          child: CustomAppBar(),
        ),
        body: Observer(
          builder: (context) {
            return _homeStore.isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        constraints: const BoxConstraints(maxWidth: kMaxWidth),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                    style: TextButton.styleFrom(
                                        primary: kDarkBlackColor),
                                    label: const Text('Back to home'),
                                    icon: const Icon(Icons.arrow_back),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                (_appStore.isUserAuthenticated &&
                                        _appStore.user!.email ==
                                            post.author!.email)
                                    ? Container(
                                        child: !Responsive.isMobile(context)
                                            ? Row(
                                                children: [
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Colors.blueAccent,
                                                      ),
                                                      onPressed: () async {
                                                         var resultUpdate = await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    UpdatePostView(
                                                                        post:
                                                                            post)));

                                                         if(resultUpdate != null){
                                                           _homeStore.posts[_homeStore.posts.indexOf(post)] = resultUpdate;
                                                         }


                                                      },
                                                      child: const Text(
                                                          'Update Post')),
                                                  const SizedBox(
                                                    width: kDefaultPadding,
                                                  ),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.red,
                                                      ),
                                                      onPressed: () async {
                                                        try {
                                                          String successMsg =
                                                              await _homeStore
                                                                  .deletePost(
                                                                      post);
                                                          SnackBar snackBar =
                                                              SnackBar(
                                                            content: Text(
                                                              successMsg,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            backgroundColor:
                                                                Colors.green,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 2),
                                                          );

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);

                                                          Navigator.pop(
                                                              context);
                                                        } on DioError catch (e) {
                                                          if (e.response!
                                                                  .statusCode ==
                                                              401) {
                                                            SnackBar snackBar =
                                                                const SnackBar(
                                                              content: Text(
                                                                'Your credentials are expired! Login again and finished the operation!',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.red,
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          5),
                                                            );

                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            LoginView()));

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);
                                                          } else {
                                                            SnackBar snackBar =
                                                                SnackBar(
                                                              content: Text(
                                                                e.response!
                                                                        .data[
                                                                    'detail'],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.red,
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);
                                                          }
                                                        }
                                                      },
                                                      child: const Text(
                                                          'Delete Post')),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary:
                                                              Colors.blueAccent,
                                                        ),
                                                        onPressed: () async {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      UpdatePostView(
                                                                          post:
                                                                              post)));
                                                        },
                                                        child: const Text(
                                                            'Update Post')),
                                                  ),
                                                  const SizedBox(
                                                    height: kDefaultPadding / 2,
                                                  ),
                                                  SizedBox(
                                                    width: 100,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: Colors.red,
                                                        ),
                                                        onPressed: () async {
                                                          try {
                                                            String successMsg =
                                                                await _homeStore
                                                                    .deletePost(
                                                                        post);
                                                            SnackBar snackBar =
                                                                SnackBar(
                                                              content: Text(
                                                                successMsg,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.green,
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);

                                                            Navigator.pop(
                                                                context);
                                                          } on DioError catch (e) {
                                                            if (e.response!
                                                                    .statusCode ==
                                                                401) {
                                                              SnackBar
                                                                  snackBar =
                                                                  const SnackBar(
                                                                content: Text(
                                                                  'Your credentials are expired! Login again and finished the operation!',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                backgroundColor:
                                                                    Colors.red,
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            5),
                                                              );

                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              LoginView()));

                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            } else {
                                                              SnackBar
                                                                  snackBar =
                                                                  SnackBar(
                                                                content: Text(
                                                                  e.response!
                                                                          .data[
                                                                      'detail'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                backgroundColor:
                                                                    Colors.red,
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            2),
                                                              );

                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            }
                                                          }
                                                        },
                                                        child: const Text(
                                                            'Delete Post')),
                                                  ),
                                                ],
                                              ),
                                      )
                                    : Container()
                              ],
                            ),
                            const SizedBox(
                              height: kDefaultPadding * 2,
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(kDefaultPadding)),
                              child: Image.network(
                                post.image!,
                                height:
                                    !Responsive.isMobile(context) ? 500 : 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                post.title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: kDarkBlackColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              post.body,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 17, letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
