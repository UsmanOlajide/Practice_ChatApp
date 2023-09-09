import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool _login = true;

  var enteredEmail = '';
  var enteredPassword = '';

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final valid = _formKey.currentState!.validate();
    if (valid) {
      _formKey.currentState!.save();
      print(enteredEmail);
      print(enteredPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('DONE');
    return Scaffold(
      appBar: AppBar(
        title: const Text('VELA'),
      ),
      // body: Center(
      //   child: Text('WELCOME TO VELA CHAT APP', style: Theme.of(context).textTheme.bodyLarge,),
      // ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'V',
                  style: TextStyle(fontSize: 100),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || !value.trim().contains('@')) {
                      return 'please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    label: const Text('Email'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    enteredEmail = value!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return 'please enter a valid password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: const Text('Password'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    enteredPassword = value!;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_login ? 'Log In' : 'Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _login = !_login;
                    });
                  },
                  child: Text(
                      _login ? 'No account yet ? Sign Up' : 'Log In instead'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
