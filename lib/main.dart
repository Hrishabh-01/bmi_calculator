import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor = Colors.deepPurple.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                'BMI Calculator',
                style: TextStyle(color: Colors.white),
              )),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                      controller: wtController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Enter weight in Kg'),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                          prefixIcon: Icon(Icons.line_weight))),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text('Enter your height in feet'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        prefixIcon: Icon(Icons.height)),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inchController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text('Enter your height in inch'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        prefixIcon: Icon(Icons.height)),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inchController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);
                          var tInch = (ift * 12) + iinch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;

                          var bmi = iwt / (tM * tM);
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You're Overweight!!";
                            bgColor = Colors.deepOrange.shade200;
                          } else if (bmi < 18) {
                            msg = "You're Underweight";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You're Healthy";
                            bgColor = Colors.green.shade200;
                          }
                          result =
                          "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          setState(() {});
                        } else {
                          setState(() {
                            result = "Please fill all the required line";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
