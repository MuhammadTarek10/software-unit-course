import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeView(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final primary = const Color.fromRGBO(28, 40, 51, 0.8);
  int heightValue = 150;
  int weightValue = 50;
  int ageValue = 20;
  List<bool> gender = [false, true];

  void chooseGender(index) {
    setState(() {
      gender[index] = !gender[index];
      gender[(index + 1) % gender.length] = false;
    });
  }

  void hightChanged(value) {
    setState(() {
      heightValue = value.round();
    });
  }

  void incrementWeight() {
    setState(() {
      weightValue++;
    });
  }

  void decrementWeight() {
    setState(() {
      weightValue--;
    });
  }

  void incrementAge() {
    setState(() {
      ageValue++;
    });
  }

  void decrementAge() {
    setState(() {
      ageValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => chooseGender(0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(8),
                      border: gender[0] == true
                          ? Border.all(color: Colors.orangeAccent)
                          : Border.all(),
                    ),
                    child: Image.asset(
                      "assets/images/male.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () => chooseGender(1),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(8),
                      border: gender[1] == true
                          ? Border.all(color: Colors.orangeAccent)
                          : Border.all(),
                    ),
                    child: Image.asset(
                      "assets/images/female.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        heightValue.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        min: 120,
                        max: 220,
                        activeColor: Colors.orangeAccent,
                        inactiveColor: Colors.grey,
                        value: heightValue.toDouble(),
                        onChanged: hightChanged,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Weight",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        weightValue.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: decrementWeight,
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.orangeAccent),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: incrementWeight,
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.orangeAccent),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Age",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        ageValue.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: decrementAge,
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.orangeAccent),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: incrementAge,
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.orangeAccent),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIView(
                          gender: gender,
                          height: heightValue,
                          weight: weightValue,
                          age: ageValue,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text(
                      "Calculate BMI",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BMIView extends StatefulWidget {
  const BMIView({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  final int age;
  final int weight;
  final int height;
  final List<bool> gender;

  @override
  State<BMIView> createState() => _BMIViewState();
}

class _BMIViewState extends State<BMIView> {
  String status = "";
  String comment = "";
  int bmi = 0;

  @override
  void initState() {
    super.initState();
    bmi = getResult();
  }

  int getResult() {
    double bmi = (widget.weight / (widget.height * widget.height)) * 10000;
    if (bmi < 18.5) {
      comment = "You are under weight";
      status = "UNDERWEIGHT";
    } else if (bmi >= 18.5 && bmi < 25) {
      comment = "You are at a healthy weight.";
      status = "NORMAL";
    } else if (bmi > 25 && bmi <= 29.99) {
      comment = "You are at overweight.";
      status = "OVERWEIGHT";
    } else {
      comment = "You are obese.";
      status = "OBESE";
    }

    return bmi.round();
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color.fromRGBO(28, 40, 51, 0.8);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Your Score",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(status, style: const TextStyle(fontSize: 20)),
            Text(
              bmi.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Column(
              children: [
                Text(
                  "Normal BMI Range is:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "18.5 - 25kg/m",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(comment, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
