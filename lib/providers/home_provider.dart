
import 'package:flutter/cupertino.dart';

import '../data/repository/todo_api_repo.dart';

class HomeProvider with ChangeNotifier {
  late TodoApiRepository? apiRepository;
  HomeProvider({required this.apiRepository});
}