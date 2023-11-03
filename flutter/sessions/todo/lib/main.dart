import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/entities/todo.dart';

void main() {
  runApp(const MyApp());
}

List<ToDoEntity> todos = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController _pageController;
  int barIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: barIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void changePage(int index) {
    setState(() {
      _pageController.jumpToPage(index);
      barIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          TodoViewScreen(),
          TodoView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: barIndex,
        onTap: (index) => changePage(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
        ],
      ),
    );
  }
}

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/svg/add-note.svg",
                height: 250,
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
                maxLength: 20,
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                ),
                maxLength: 200,
                maxLines: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => addTodo(),
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTodo() {
    todos.add(
      ToDoEntity(title: "Ahmed", description: "Mohamed"),
    );
  }
}

class TodoViewScreen extends StatefulWidget {
  const TodoViewScreen({super.key});

  @override
  State<TodoViewScreen> createState() => _TodoViewScreenState();
}

class _TodoViewScreenState extends State<TodoViewScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final entity = todos[index];
        return ListTile(
          title: Text(entity.title),
          subtitle: Text(entity.description),
          onTap: () {},
        );
      },
    );
  }
}
