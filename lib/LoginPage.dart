import 'dart:ui';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String gender = '';
  bool _isNameValid = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login Page",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_image2.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Center(
              child: Container(
                width: 300.0,
                height: 438,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(17),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Full Name',
                          prefixIcon: const Icon(Icons.person_sharp),
                          errorText: _isNameValid ? null : 'Name cannot be empty',
                        ),
                        onChanged: (text) {
                          setState(() {
                            fullName = text;
                            _isNameValid = true;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(17),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            email = text;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(17),
                      child: TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number  +91',
                          prefixIcon: Icon(Icons.phone_android_sharp),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (value.length != 10 ||
                              int.tryParse(value) == null) {
                            return 'Please enter a valid 10-digit mobile number';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            phoneNumber = text;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(17),
                      child: Text(
                        'Gender',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: const Text('Male'),
                            leading: Radio<String>(
                              value: 'Male',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Female'),
                            leading: Radio<String>(
                              value: 'Female',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('SUBMIT'),
                        onPressed: () {
                          if (_nameController.text.isEmpty) {
                            setState(() {
                              _isNameValid = false;
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(fullName: fullName, phoneNumber:phoneNumber)),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
