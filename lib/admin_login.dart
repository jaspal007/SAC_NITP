import 'package:flutter/material.dart';
import 'package:sac_nitp/home.dart';
import 'package:sac_nitp/info.dart';
import 'package:sac_nitp/admin.dart';
import 'package:sac_nitp/resources/auth_methods.dart';
import 'package:sac_nitp/utils.dart';
import './utility/text_input.dart';
import 'global_variable.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';

globals.GlobalVariable _variable = globals.GlobalVariable();

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _obscureText = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _username.text,
      password: _password.text,
    );
    if (res == "success") {
Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const admin(),
        ),      
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    final height =
        mainScreen - MediaQuery.of(context).padding.bottom - keyboard;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.all(10),
          height: height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: TextFieldInput(
                      textEditingController: _username,
                      labelText: 'AdminName',
                      textInputType: TextInputType.emailAddress,
                    ),
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
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        loginUser();
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                      ),
                      child: const Text('Login'),
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
}
