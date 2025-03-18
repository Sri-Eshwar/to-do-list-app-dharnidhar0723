import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todoList = []; // Changed value type for checkbox
  TextEditingController taskController = TextEditingController();

  void addList() {
    if (taskController.text.trim().isEmpty) return;

    setState(() {
      todoList.add({
        "value": taskController.text,
        "completed": false, // Default to false when adding
      });
      taskController.clear();
    });
  }

  void deleteItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void toggleComplete(int index) {
    setState(() {
      todoList[index]["completed"] = !todoList[index]["completed"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blue[900],
                    child: ListTile(
                      leading: Checkbox(
                        value: todoList[index]["completed"],
                        onChanged: (value) {
                          toggleComplete(index);
                        },
                        activeColor: Colors.green,
                      ),
                      title: Text(
                        todoList[index]["value"],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: todoList[index]["completed"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteItem(index),
                        icon: const Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: TextFormField(
                      controller: taskController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fillColor: Colors.blue[300],
                        filled: true,
                        labelText: 'Create Task...',
                        labelStyle: TextStyle(
                          color: Colors.indigo[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 27,
                    child: ElevatedButton(
                      onPressed: addList,
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreen(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.indigo),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Map<String, dynamic>> mainTasks = [];
//   TextEditingController mainTaskController = TextEditingController();
//   TextEditingController subTaskController = TextEditingController();

//   void addMainTask() {
//     if (mainTaskController.text.trim().isEmpty) return;
//     setState(() {
//       mainTasks.add({
//         "title": mainTaskController.text,
//         "subtasks": [],
//         "expanded": false,
//       });
//       mainTaskController.clear();
//     });
//   }

//   void addSubTask(int index) {
//     if (subTaskController.text.trim().isEmpty) return;
//     setState(() {
//       mainTasks[index]["subtasks"].add({
//         "task": subTaskController.text,
//         "completed": false,
//       });
//       subTaskController.clear();
//     });
//   }

//   void deleteMainTask(int index) {
//     setState(() {
//       mainTasks.removeAt(index);
//     });
//   }

//   void deleteSubTask(int mainIndex, int subIndex) {
//     setState(() {
//       mainTasks[mainIndex]["subtasks"].removeAt(subIndex);
//     });
//   }

//   void toggleSubTask(int mainIndex, int subIndex) {
//     setState(() {
//       mainTasks[mainIndex]["subtasks"][subIndex]["completed"] =
//           !mainTasks[mainIndex]["subtasks"][subIndex]["completed"];
//     });
//   }

//   void toggleExpand(int index) {
//     setState(() {
//       mainTasks[index]["expanded"] = !mainTasks[index]["expanded"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Todo Application",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         centerTitle: true,
//         toolbarHeight: 75,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   flex: 70,
//                   child: TextField(
//                     controller: mainTaskController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       labelText: 'Create Main Task...',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Expanded(
//                   flex: 27,
//                   child: ElevatedButton(
//                     onPressed: addMainTask,
//                     child: const Text("Add"),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: mainTasks.length,
//                 itemBuilder: (context, mainIndex) {
//                   return Column(
//                     children: [
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         color: Colors.blue[900],
//                         child: ListTile(
//                           title: Text(
//                             mainTasks[mainIndex]["title"],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           trailing: Wrap(
//                             spacing: 10,
//                             children: [
//                               IconButton(
//                                 onPressed: () => toggleExpand(mainIndex),
//                                 icon: Icon(
//                                   mainTasks[mainIndex]["expanded"]
//                                       ? Icons.expand_less
//                                       : Icons.expand_more,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () => deleteMainTask(mainIndex),
//                                 icon: const Icon(Icons.delete, color: Colors.red),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       if (mainTasks[mainIndex]["expanded"])
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: [
//                               for (int subIndex = 0;
//                                   subIndex < mainTasks[mainIndex]["subtasks"].length;
//                                   subIndex++)
//                                 Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   color: Colors.indigo,
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Checkbox(
//                                         value: mainTasks[mainIndex]["subtasks"][subIndex]["completed"],
//                                         onChanged: (value) {
//                                           toggleSubTask(mainIndex, subIndex);
//                                         },
//                                         activeColor: Colors.green,
//                                       ),
//                                       Text(
//                                         mainTasks[mainIndex]["subtasks"][subIndex]["task"],
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           decoration: mainTasks[mainIndex]["subtasks"][subIndex]["completed"]
//                                               ? TextDecoration.lineThrough
//                                               : TextDecoration.none,
//                                         ),
//                                       ),
//                                       IconButton(
//                                         onPressed: () => deleteSubTask(mainIndex, subIndex),
//                                         icon: const Icon(Icons.delete, color: Colors.red),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: TextField(
//                                         controller: subTaskController,
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(15),
//                                           ),
//                                           labelText: 'Add Sub-task...',
//                                         ),
//                                       ),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () => addSubTask(mainIndex),
//                                       child: const Text("Add"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
