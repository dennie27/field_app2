import 'package:flutter/material.dart';

class TPendingTask extends StatefulWidget {
  const TPendingTask({Key? key}) : super(key: key);

  @override
  TPendingTaskState createState() => TPendingTaskState();
}

class TPendingTaskState extends State<TPendingTask> {
  bool isDescending = false;
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<String> items = [
    'Dennis',
    'Juma',
    'Babby',
    'Sweetie',
    'Debora',
    /*{"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},*/
  ];

  // This list holds the data for the list view
  //List data = [];
  @override
  initState() {
    // at the beginning, all users are shown
    //data = items;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = items;
    } else {
      /* results = items
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();*/
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      // data = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () =>
                        setState(() => isDescending = !isDescending),
                    icon: Icon(
                      isDescending ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    splashColor: Colors.lightGreen,
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    Icons.filter_list_alt,
                  ),
                  iconSize: 20,
                  color: Colors.yellow,
                  splashColor: Colors.lightGreen,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: items.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final sortedItems = items
                        ..sort((item1, item2) => isDescending
                            ? item2.compareTo(item1)
                            : item1.compareTo(item2));
                      final item = sortedItems[index];
                      return InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey.shade800,
                              radius: 35,
                              child: Text(item),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Container(
                                width: 350,
                                height: 90,
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item),
                                        Text("Task :$index"),
                                        Text("Priority:"),
                                        Text("Over due:"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}
