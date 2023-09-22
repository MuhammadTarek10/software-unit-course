import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/entities/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

List<TodoItem> todos = [];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int barIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: barIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void changePage(int index) {
    setState(() {
      barIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO App"),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          ToDoView(),
          AddView(),
        ],
        onPageChanged: (value) => changePage(value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: barIndex,
        onTap: (value) => changePage(value),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/todo-list.png",
              height: 30,
              color: Colors.black,
            ),
            label: "List",
            activeIcon: Image.asset(
              "assets/icons/todo-list.png",
              height: 30,
              color: Colors.deepPurple,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
        ],
      ),
    );
  }
}

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              selected: true,
              selectedTileColor: Colors.deepPurpleAccent.withOpacity(0.1),
              title: Text(
                todo.title,
                style: TextStyle(
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                    color: Colors.black),
              ),
              subtitle: Text(
                todo.description,
                style: TextStyle(
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  color: Colors.grey,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    todo.toggleDone();
                  });
                },
                icon: Icon(
                  todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    todos.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
              )),
        );
      },
    );
  }
}

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/add-note.svg",
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                maxLength: 20,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLength: 500,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addTodo,
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTodo() {
    final title = titleController.text;
    final description = descriptionController.text;
    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title and description cannot be empty"),
        ),
      );
    } else {
      todos.add(
        TodoItem(
          title: title,
          description: description,
        ),
      );
      titleController.clear();
      descriptionController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
