// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_pattern_provider/viewmodel/create_viewModel.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CreateViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Create"),
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: viewModel.userIdController,
                      decoration: InputDecoration(
                        label: Text("User ID"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: viewModel.titleController,
                      decoration: InputDecoration(
                        label: Text("Title"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: viewModel.bodyController,
                      decoration: InputDecoration(
                        label: Text("Body"),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: viewModel.doCreate,
                    minWidth: double.infinity,
                    color: Colors.blue,
                    child: const Text("Create", style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Response:", style: TextStyle(fontSize: 18, color: Colors.red),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text("ID: ${viewModel.response.id}", style: const TextStyle(fontSize: 18),),
                      const SizedBox(height: 10,),
                      Text("User ID: ${viewModel.response.userId}", style: const TextStyle(fontSize: 18),),
                      const SizedBox(height: 10,),
                      Text("Title: ${viewModel.response.title}", style: const TextStyle(fontSize: 18),),
                      const SizedBox(height: 10,),
                      Text("Body: ${viewModel.response.body}", style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
