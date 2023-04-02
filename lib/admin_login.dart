import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sac_nitp/data.dart';
import './utility/text_input.dart';
import 'utility/global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();
final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/sac_nitp.jpg"),
                      maxRadius: 65,
                      minRadius: 20,
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
                      onPressed: () async {
                        if (_username.text.isNotEmpty &&
                            _password.text.isNotEmpty) {
                          final UserCredential userCredential =
                              await _auth.signInWithEmailAndPassword(
                            email: _username.text,
                            password: _password.text,
                          );

                          // Check if the login was successful
                          if (userCredential.user != null) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyData(),
                              ),
                            );
                          } else {
                            // Show an error message
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid email or password'),
                              ),
                            );
                          }
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.teal),
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
