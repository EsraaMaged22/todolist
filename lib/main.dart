import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List ToDo = [
    {"name": "Communication Systems Quiz", "time": "10:00AM"},
    {"name": "OS Project", "time": "11:00AM"},
    {"name": "Buy Some Stuff", "time": "1:00PM"},
    {"name": "Go to the Gym", "time": "2:00PM"},
    {"name": "Flutter Task", "time": "4:00PM"},
    {"name": "Flutter Task 2", "time": "10:00AM"}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4368FF), // Set the hex color value here
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    height: 80,
                  ),
                  Text(
                    'TodoList',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: ToDo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        height: 20,
                        child: Text(
                          "${ToDo[index]['name']}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Container(
                        height: 30,
                        child: ListTile(
                          title: Text(
                            "${ToDo[index]['time']}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline_outlined),
                        color: Colors.white,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                content: Text(
                                  'Are you sure you want to delete this item?',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      print("Cancel");
                                    },
                                    child: Text("Cancel",style: TextStyle(color: Colors.black54),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Yes",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}