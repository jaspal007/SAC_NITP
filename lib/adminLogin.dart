import 'package:flutter/material.dart';
import 'package:sac_nitp/home.dart';
import 'package:sac_nitp/info.dart';
import 'package:sac_nitp/sample.dart';
import './utility/text_input.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _obscureText = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.all(10),
          height: height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/profile.jpg"),
                      maxRadius: 50,
                      minRadius: 30,
                    ),
                    Text(
                      'Admin Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldInput(
                      textEditingController: _username,
                      labelText: 'AdminName',
                      textInputType: TextInputType.emailAddress,
                    ),
                    Stack(
                      children: [
                        TextFieldInput(
                          textEditingController: _password,
                          labelText: 'PassWord',
                          isPass: _obscureText,
                          textInputType: TextInputType.number,
                        ),
                        Positioned(
                          right: 10,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: (_obscureText)
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    (_username == 'admin' && _password == 123456)
                        ? const MyHome()
                        : null;
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
