import 'package:flutter/material.dart';
import 'package:flutter_exam4/get_data.dart';

import 'model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ToDo List Exam',
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            var data = snapshot.data as List<UserModel>;

            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => Card(
                      child: ListTile(
                        title: Text(
                          data[index].title,
                          maxLines: 1,
                        ),
                        leading: CircleAvatar(
                          backgroundColor:
                              data[index].completed ? Colors.green : Colors.red,
                          child: Text(data[index].id.toString()),
                        ),
                        // check_circle
                        trailing: Icon(data[index].completed
                            ? Icons.verified
                            : Icons.replay),
                      ),
                    ));
          }
        },
      ),
    );
  }
}
