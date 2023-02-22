
import 'package:flutter/foundation.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

class HomeViewModel extends ChangeNotifier {

  bool isLoading = false;
  List<Post> items = [];

  void apiPostList() async {

    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();

  }

  void apiPostDelete(Post post) async {

    isLoading = true;

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(),  Network.paramsEmpty());

    if (response != null) {
        apiPostList();
      }
    isLoading = false;

  }


}
