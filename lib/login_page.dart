import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswordScreen(),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _statusMessage = '';
  bool _isPasswordSet = false;

  @override
  void initState() {
    super.initState();
    _checkIfPasswordIsSet();
  }

  Future<void> _checkIfPasswordIsSet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedPassword = prefs.getString('user_password');
    if (savedPassword != null) {
      setState(() {
        _isPasswordSet = true;
      });
    }
  }

  Future<void> _savePassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_password', password);
  }

  Future<bool> _matchPassword(String enteredPassword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedPassword = prefs.getString('user_password');
    return savedPassword != null && savedPassword == enteredPassword;
  }

  void _handlePasswordInput() async {
    final enteredPassword = _passwordController.text;

    if (_isPasswordSet) {
      final isMatch = await _matchPassword(enteredPassword);
      setState(() {
        _statusMessage = isMatch ? 'Password matches successfully!' : 'Incorrect password. Please try again.';
      });
    } else {
      await _savePassword(enteredPassword);
      setState(() {
        _statusMessage = 'Password set successfully! Restart the app to log in.';
        _isPasswordSet = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Management'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handlePasswordInput,
              child: Text(_isPasswordSet ? 'Verify Password' : 'Set Password'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
