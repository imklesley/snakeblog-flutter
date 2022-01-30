import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'create_post_store.g.dart';

class CreatePostStore = CreatePostStoreBase with _$CreatePostStore;

abstract class CreatePostStoreBase with Store {
  @observable
  File? file;

  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController bodyController = TextEditingController();

  @observable
  TextEditingController tagController = TextEditingController();


  @observable
  bool isHover = false;

  @action
  void setFile(File newFile) {
    file = newFile;
  }


  @observable
  bool isLoading = false;






}