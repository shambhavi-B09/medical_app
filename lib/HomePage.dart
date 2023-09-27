import 'package:flutter/material.dart';
import 'SettingsPage.dart';
import 'Temperature.dart';

class HomePage extends StatelessWidget {
  final String fullName;
  final String phoneNumber;

  const HomePage({Key? key, required this.fullName ,required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    fullName,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Text(
                    '+91-''$phoneNumber',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_circle_rounded),
              title: const Text('Doctors'),
              onTap: () {
                // TODO: Navigate to the Doctors screen.
              },
            ),
            ListTile(
              leading: const Icon(Icons.hotel_rounded),
              title: const Text('Pathology'),
              onTap: () {
                // TODO: Navigate to the Pathology screen.
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services_outlined),
              title: const Text('Medical Stores'),
              onTap: () {
                // TODO: Navigate to the Medical Stores screen.
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_copy),
              title: const Text('Result'),
              onTap: () {
                // TODO: Navigate to the Result screen.
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Welcome ,\n',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: '$fullName ',
                      style: const TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 60,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 50,
                  child: Container(
                    width: 150.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue[600],
                    ),
                    child: Stack(
                      children: const [
                        Center(
                          child: Text(
                            'Consultation',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 110.0,
                          left: 10.0,
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                            size: 30.0,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 10.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 50,
                  child: Container(
                    width: 150.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.lightGreen,
                    ),
                    child: const Center(
                      child: Text(
                        'BP',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top:40.0),
              child: const Text(
                  'My Health',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,fontFamily:'Poppins'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}