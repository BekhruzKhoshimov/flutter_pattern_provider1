
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_pattern_provider/viewmodel/update_viewModel.dart';
import 'package:provider/provider.dart';
import '../viewmodel/create_viewModel.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdateViewModel viewModel = UpdateViewModel();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CreateViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Update"),
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
                        label: Text("ID"),
                      ),
                    ),
                  ),
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
                    onPressed: (){},
                    minWidth: double.infinity,
                    color: Colors.blue,
                    child: Text("Update", style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 10,),
                  Text("Response:", style: TextStyle(fontSize: 18, color: Colors.red),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("ID: ", style: const TextStyle(fontSize: 18),),
                      SizedBox(height: 10,),
                      Text("User ID: ", style: const TextStyle(fontSize: 18),),
                      SizedBox(height: 10,),
                      Text("Title: ", style: const TextStyle(fontSize: 18),),
                      SizedBox(height: 10,),
                      Text("Body: ", style: const TextStyle(fontSize: 18),),
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

