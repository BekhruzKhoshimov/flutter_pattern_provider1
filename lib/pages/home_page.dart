
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../item_of_post.dart';
import '../model/post_model.dart';
import '../viewmodel/home_viewmodel.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.apiPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("setState"),
      ),
      body: ChangeNotifierProvider (
        create: (context) => viewModel,
        child: Consumer<HomeViewModel> (
          builder: (context, value, child) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (context, index) {
                    return itemOfPost(viewModel.items[index], viewModel);
                  },
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
