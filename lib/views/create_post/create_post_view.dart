import 'dart:io';

import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/config/responsive.dart';
import 'package:blog_snake/controllers/stores/create_post_store.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:blog_snake/views/auth/components/auth_field.dart';
import 'package:blog_snake/views/auth/login_view.dart';
import 'package:blog_snake/views/home/components/custom_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);
    final _createPostStore = CreatePostStore();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            constraints: const BoxConstraints(maxWidth: kMaxWidth),
            child: Observer(
              builder: (context) {
                return _createPostStore.isLoading
                    ? const CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(kPrimaryColor),
                )
                    : Column(
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
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    if (_createPostStore.file == null)
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? filePicker =
                              await FilePicker.platform.pickFiles();

                              if (filePicker != null) {
                                _createPostStore.setFile(
                                    File(filePicker.files.single.path!));
                              }
                            },
                            child: const Text('Add the post picture')),
                      )
                    else
                      InkWell(
                        onTap: () async {
                          FilePickerResult? filePicker =
                          await FilePicker.platform.pickFiles();

                          if (filePicker != null) {
                            _createPostStore.setFile(
                                File(filePicker.files.single.path!));
                          }
                        },
                        onHover: (isHovering) {
                          _createPostStore.isHover = isHovering;
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(kDefaultPadding)),
                              child: Image.file(
                                _createPostStore.file!,
                                height: Responsive.isMobile(context)
                                    ? 300
                                    : 500,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (_createPostStore.isHover)
                              Container(
                                height: Responsive.isMobile(context)
                                    ? 300
                                    : 500,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(kDefaultPadding),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Change Picture',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AuthField(
                        controller: _createPostStore.titleController,
                        labelText: 'Enter a title',
                        labelStyle: const TextStyle(
                            color: kDarkBlackColor, fontSize: 18),
                        iconAndTextColor: kDarkBlackColor,
                        colorEnabledBorder: kDarkBlackColor,
                        obscureText: false,
                        validatorFunction: (String? title) {
                          if (title!.isEmpty) {
                            return 'You have to add an title to your blog post';
                          }
                          return null;
                        },
                        autoFocus: false,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AuthField(
                        keyboardType: TextInputType.text,
                        controller: _createPostStore.tagController,
                        labelText: 'Enter a tag for your post',
                        labelStyle: const TextStyle(
                            color: kDarkBlackColor, fontSize: 18),
                        iconAndTextColor: kDarkBlackColor,
                        colorEnabledBorder: kDarkBlackColor,
                        obscureText: false,
                        validatorFunction: (String? tag) {
                          if (tag!.isEmpty) {
                            return 'You have to add an tag to your blog post';
                          }
                          return null;
                        },
                        autoFocus: false,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AuthField(
                        keyboardType: TextInputType.multiline,
                        controller: _createPostStore.bodyController,
                        labelText: 'Enter a body',
                        labelStyle: const TextStyle(
                            color: kDarkBlackColor, fontSize: 18),
                        iconAndTextColor: kDarkBlackColor,
                        colorEnabledBorder: kDarkBlackColor,
                        obscureText: false,
                        validatorFunction: (String? title) {
                          if (title!.isEmpty) {
                            return 'You have to add an title to your blog post';
                          } else if (title.length < 30) {
                            return 'Your blog post body must have 300 characters';
                          }
                          return null;
                        },
                        autoFocus: false,
                        maxLines: 15,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onSurface: Colors.grey),
                        onPressed: () async {
                          PostModel newPost = PostModel(
                              image: _createPostStore.file!.path,
                              title:
                              _createPostStore.titleController.text,
                              body: _createPostStore.bodyController.text,
                              tag: _createPostStore.tagController.text);

                          try {
                            await _homeStore.createNewPost(newPost);

                            SnackBar snackBar = const SnackBar(
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                                content: Text(
                                  'Post was successfully created!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.pop(context);

                          } on DioError catch (e) {
                            if (e.response!.statusCode == 401) {
                              SnackBar snackBar = const SnackBar(
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                  content: Text(
                                    'Your session has expired. Login Again!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginView()));
                            } else {
                              SnackBar snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 3),
                                  content: Text(
                                    e.response!.data['detail'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                  ));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }


                          }
                        },
                        child: const Text('Create Blog Post'),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
