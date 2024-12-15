import 'package:flutter/material.dart';
import 'package:travel_bucket_list/screens/auth/service/auth_service.dart';

import 'login_screen.dart'; // Make sure to import your LoginScreen

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with AuthService {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isObscurePass = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8), // Light gray background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Travel Trail',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Sign up to discover amazing travel destinations',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildTextField(
                      _usernameController, 'Enter Name', 'Name is required'),
                  const SizedBox(height: 16),
                  _buildTextField(
                      _emailController, 'Enter Email', 'Email is required',
                      inputType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  _buildPasswordField(_passwordController, 'Enter Password',
                      'Password is required'),
                  const SizedBox(height: 16),
                  _buildPasswordField(_confirmPasswordController,
                      'Confirm Password', 'Passwords do not match',
                      validator: (value) => value != _passwordController.text
                          ? 'Passwords do not match'
                          : null,
                      isConfirm: true),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          registerUser(
                              context: context,
                              name: _usernameController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const LoginScreen()),
                          // );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Sign Up',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    String validationError, {
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationError;
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller, String hintText, String validationError,
      {String? Function(String?)? validator, bool isConfirm = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isConfirm
            ? IconButton(
                icon: Icon(
                  _isObscureConfirm ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscureConfirm = !_isObscureConfirm;
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  _isObscurePass ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscurePass = !_isObscurePass;
                  });
                },
              ),
      ),
      obscureText: isConfirm ? _isObscureConfirm : _isObscurePass,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return validationError;
            } else if (value.length < 5) {
              return 'Password must be at least 5 characters';
            }
            return null;
          },
    );
  }
}
