import 'package:flutter/material.dart';
import 'package:flutter_pattern_provider/viewmodel/home_viewmodel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'model/post_model.dart';

Widget itemOfPost(Post post, HomeViewModel viewModel) {
  return Slidable(
    startActionPane: ActionPane (
      motion: const ScrollMotion(),
      dismissible: Dismissible(onDismissed: (direction) {}, key: const Key(""), child: const SizedBox(),),
      children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        ),

      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            viewModel.apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title!.toUpperCase(), style: const TextStyle()),
          const SizedBox(height: 5,),
          Text(post.body!, style: const TextStyle(color: Colors.black54),)
        ],
      ),
    ),
  );
}