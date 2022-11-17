
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_state/data/model/todo_model.dart';
import 'package:flutter_state/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
    // static Widget get view => ChangeNotifierProvider<HomeProvider>(
  //       create: (_) => HomeProvider(),
  //       child: const HomeView(),
  //     );
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<HomeProvider>
         (builder:(context, homeProvider, _) {
        return FutureBuilder<List<Todo?>?>(
          initialData:List<Todo>.empty(),
          future: homeProvider.apiRepository!.getToDoList(),
          builder:(context, snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting) {
              return const Center(
                child:CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData||snapshot.hasError) {
              return Center(
                child: Text(
                'Yoy have not data or have error'
                ),
              );
            }
            return SafeArea(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder:(context, index) {
                  final todo=snapshot.data![index];
                  return Card(
                    child: CheckboxListTile(
                      value:todo!.completed,
                       onChanged:(value) {
                         
                       },
                       tileColor: Colors.cyanAccent,
                       title: Text(todo.todo??'todo'),
                       ),
                       
                  );
                },
                ),
            );
          },
          );
      },),
    );
  }
}