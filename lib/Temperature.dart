import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConvertor());
}

class TemperatureConvertor extends StatelessWidget {
  const TemperatureConvertor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Temperature Convertor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double inTemp = 0.0, outTemp = 0.0;
  String outputTemp = "";

  String dropdownvalueIn = 'Celsius';
  String dropdownvalueOut = 'Celsius';

  var items = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SizedBox(
          width: deviceWidth * 0.9,
          height: deviceHeight * 0.5,
          child: Card(
            elevation: 30,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            // color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 5),
                            width: deviceWidth * 0.45,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  labelText: dropdownvalueIn,
                                  labelStyle:
                                      const TextStyle(color: Color(0xff000000)),
                                  hintText: "Temperature",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ))),
                              onChanged: (value) {
                                setState(() {
                                  try {
                                    inTemp = double.parse(value);
                                  } catch (e) {}
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "INPUT",
                            style: TextStyle(fontSize: deviceWidth * 0.03),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 20),
                            child: DropdownButton(
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalueIn = newValue!;
                                });
                              },
                              value: dropdownvalueIn,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: deviceWidth * 0.45,
                            height: 65,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: Text(
                              outputTemp,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceWidth * 0.04),
                            )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "OUTPUT",
                            style: TextStyle(fontSize: deviceWidth * 0.03),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, right: 1),
                            child: DropdownButton(
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalueOut = newValue!;
                                });
                              },
                              value: dropdownvalueOut,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(200, 50),
                        shadowColor: Colors.black12,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () {
                        if (dropdownvalueIn == "Celsius" &&
                            dropdownvalueOut == "Fahrenheit") {
                          outTemp = inTemp * (9 / 5) + 32;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  F";
                        }
                        if (dropdownvalueIn == "Celsius" &&
                            dropdownvalueOut == "Celsius") {
                          outTemp = inTemp;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  C";
                        }
                        if (dropdownvalueIn == "Celsius" &&
                            dropdownvalueOut == "Kelvin") {
                          outTemp = inTemp + 273.15;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  K";
                        }
                        if (dropdownvalueIn == "Fahrenheit" &&
                            dropdownvalueOut == "Celsius") {
                          outTemp = (inTemp - 32) * (5 / 9);
                          outputTemp = "${outTemp.toStringAsFixed(3)}  C";
                        }
                        if (dropdownvalueIn == "Fahrenheit" &&
                            dropdownvalueOut == "Fahrenheit") {
                          outTemp = inTemp;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  F";
                        }
                        if (dropdownvalueIn == "Fahrenheit" &&
                            dropdownvalueOut == "Kelvin") {
                          outTemp = (inTemp - 32) * (5 / 9) + 273.15;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  K";
                        }
                        if (dropdownvalueIn == "Kelvin" &&
                            dropdownvalueOut == "Kelvin") {
                          outTemp = inTemp;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  K";
                        }
                        if (dropdownvalueIn == "Kelvin" &&
                            dropdownvalueOut == "Celsius") {
                          outTemp = inTemp - 273.15;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  C";
                        }
                        if (dropdownvalueIn == "Kelvin" &&
                            dropdownvalueOut == "Fahrenheit") {
                          outTemp = (inTemp - 273.15) * (9 / 5) + 32;
                          outputTemp = "${outTemp.toStringAsFixed(3)}  F";
                        }
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.downloading_outlined,
                        size: 25,
                      ),
                      label: Text(
                        "Convert",
                        style: TextStyle(
                            fontSize: deviceWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
