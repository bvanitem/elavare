import 'package:elavare/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatefulWidget {
  final AuthViewModel viewModel;

  const LandingScreen({required this.viewModel, super.key});
  @override
  State<LandingScreen> createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _firstName = TextEditingController(text: '');
  final TextEditingController _lastName = TextEditingController(text: '');
  String? errorMessage;
  bool? userExists;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Landing')),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Username / Email
                    TextField(
                      enabled: (userExists == null),
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'Username or Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    //Continue button (Check if user exists)
                    Container(
                      child: (userExists == null) ? continueButton() : null,
                    ),

                    //Login container
                    Container(
                      child: (userExists != null && userExists == true)
                          ? loginWidget()
                          : null,
                    ),
                    //register container
                    Container(
                      child: (userExists != null && userExists == false)
                          ? registerWidget()
                          : null,
                    ),
                    Container(
                      child: (userExists != null)
                          ? IconButton(
                              icon: Icon(Icons.rotate_left),
                              onPressed: () async {
                                setState(() {
                                  userExists = null;
                                });
                              },
                            )
                          : null,
                    ),

                    const SizedBox(height: 16),

                    // Register link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () => context.go('/register'),
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton continueButton() {
    return ElevatedButton(
      onPressed: () async {
        final result = await widget.viewModel.checkUserExists(_email.text);
        setState(() {
          userExists = result;
        });
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Text('Continue'),
      ),
    );
  }

  Column loginWidget() {
    return Column(
      children: [
        TextField(
          obscureText: true,
          controller: _password,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 24),

        // Login button
        ElevatedButton(
          onPressed: () async => {
            if (await widget.viewModel.login(_email.text, _password.text))
              {context.go('/home')}
            else
              {
                // widget.viewModel.showError(),
              },
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  Column registerWidget() {
    return Column(
      children: [
        TextField(
          obscureText: true,
          controller: _password,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _firstName,
          decoration: InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _lastName,
          decoration: InputDecoration(
            labelText: 'Last Name',
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 24),

        // Login button
        ElevatedButton(
          onPressed: () async => {
            if (await widget.viewModel.registerUser(
              _email.text,
              _password.text,
              _firstName.text,
              _lastName.text,
            ))
              {context.go('/home')}
            else
              {
                // widget.viewModel.showError(),
              },
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text('Register'),
          ),
        ),
      ],
    );
  }
}
