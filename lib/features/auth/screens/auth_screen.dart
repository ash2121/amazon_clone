import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // initially we want to show signup option
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? Colors.white
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                "Create account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _nameController,
                      hinttext: "Name",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hinttext: "Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hinttext: "Password",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'Sign Up', onTap: () {})
                  ]),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? Colors.white
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                "Sign-In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _nameController,
                      hinttext: "Name",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hinttext: "Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hinttext: "Password",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'Sign In', onTap: () {})
                  ]),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
