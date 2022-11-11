import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> _todos = [
    {"id": 1, "task": "Task #1", "done": false},
  ];

  String _textField = "";
  @override
  Widget build(BuildContext context) {
    final listView = Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            onTap: () {
              setState(() {
                _todos[index]["done"] = !_todos[index]["done"];
              });
            },
            leading: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                activeColor: Colors.green,
                value: todo["done"],
                onChanged: (value) {
                  setState(() {
                    _todos[index]["done"] = value;
                  });
                },
              ),
            ),
            title: Text(
              "${todo["task"]}",
              style: const TextStyle(fontSize: 18),
            ),
            enableFeedback: true,
            trailing: IconButton(
              onPressed: () => setState(() {
                _todos.removeAt(index);
              }),
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 26,
              ),
            ),
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Todo App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 400,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: const Text(
                          "New task?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          onChanged: (value) => setState(() {
                            _textField = value.trim();
                          }),
                          decoration: const InputDecoration(
                            hintText: "Write here...",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_textField.isNotEmpty) {
                            setState(() {
                              _todos.add(
                                {
                                  "id": _todos.length,
                                  "task": _textField,
                                  "done": false,
                                },
                              );
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Add Todo",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: _todos.isNotEmpty
          ? listView
          : Center(
              child: MaterialButton(
                onPressed: () {},
                child: const Text("Add a Todo"),
              ),
            ),
    );
  }
}
