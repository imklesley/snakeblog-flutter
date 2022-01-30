import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'side_card.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);

    TextEditingController _searchFieldController = TextEditingController();

    return SideCard(
      titleSection: 'Search',
      bodyWidget: TextField(
        controller: _searchFieldController,
        decoration: InputDecoration(
          hintText: 'Search for a blog post ... ',
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon: IconButton(
            onPressed: () {
              _homeStore.searchPosts(_searchFieldController.text);
            },
            icon: const Icon(Icons.search),
          ),
          border: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(kDefaultPadding / 2)),
            borderSide: BorderSide(
              color: Color(0xFFCCCCCC),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(kDefaultPadding / 2)),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
        onSubmitted: (query) async {
          await _homeStore.searchPosts(query);
        },
        onChanged: (String query) async {
          if (query.length > 3) {
            await _homeStore.searchPosts(query);
          }
          if(query.isEmpty){
            await _homeStore.searchPosts('');

          }
        },
      ),
    );
  }
}
