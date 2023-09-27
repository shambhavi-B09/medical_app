import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = true;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive reminders and notifications'),
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),

          const Divider(),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch to a darker color scheme'),
            value: _isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                _isDarkModeEnabled = value;
                if (_isDarkModeEnabled) {
                  // set dark mode
                  _setDarkMode();
                } else {
                  // set light mode
                  _setLightMode();
                }
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            onTap: () {
              // navigate to about page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Terms and Conditions'),
            onTap: () {
              // navigate to terms and conditions page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // navigate to privacy policy page
            },
          ),
        ],
      ),
    );
  }

  void _setDarkMode() {
    // set dark mode
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    // change app theme
    final themeData = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white), // modify headline6 to be white
      ),
    );

    // set the theme data
    _setTheme(themeData);
  }

  void _setLightMode() {
    // set light mode
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // change app theme
    final themeData = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
    // set the theme data
    _setTheme(themeData);
  }

  void _setTheme(ThemeData themeData) {
    // set the theme data using the Theme widget
    final MaterialApp app = MaterialApp(
      theme: themeData,
      home: const Scaffold(),
    );
    runApp(app);
  }
}
