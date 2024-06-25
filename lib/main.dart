import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _agreeToTerms = false;
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String firstname = firstNameController.text.trim();
      String lastname = lastNameController.text.trim();
      String username = usernameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      String referedby = referralController.text.trim();
      String devicetype = 'Android'; 
      String registervia = 'Android';
      String countryTid = 'NFYUS';

      final url = Uri.parse('https://testenvr2104.cardify.co/api/user/auth/register.php');
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'referedby': referedby,
        'devicetype': devicetype,
        'registervia': registervia,
        'country_tid': countryTid,
      };

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['status']) {
            // Handle successful registration
            print('Registration successful: $data');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration Complete'),
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            // Handle registration failure
            print('Registration failed: ${data['text']}');
          }
        } else {
          // Handle HTTP error
          print('HTTP error ${response.statusCode}: ${response.reasonPhrase}');
        }
      } catch (e) {
        // Handle other errors like network issues
        print('Error during registration: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color txt = Color.fromRGBO(152, 152, 152, 1);
    Color button = Color.fromRGBO(21, 96, 189, 1);
    Color sign = Color.fromRGBO(255, 255, 255, 1);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 80),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign Up', style: TextStyle(fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
              SizedBox(height: 10),
              Text('Finish Creating Your Cardify Account', style: TextStyle(color: txt, fontSize: 17, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
              SizedBox(height: 40),
              Text('First and Last Name', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10),
              _buildTextField(firstNameController, 'First Name', Icons.person, txt),
              SizedBox(height: 25),
              _buildTextField(lastNameController, 'Last Name', Icons.person, txt),
              SizedBox(height: 25),
              Text('Username', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10),
              _buildTextField(usernameController, 'Username', Icons.person_outline, txt),
              SizedBox(height: 25),
              Text('Email Address', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10),
              _buildTextField(emailController, 'Email Address', Icons.mail_outline, txt),
              SizedBox(height: 25),
              Text('Phone Number', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10),
              _buildTextField(phoneController, 'Phone Number', Icons.phone, txt),
              SizedBox(height: 25),
              Text('Referral (optional)', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10),
              _buildTextField(referralController, "Referral's username", Icons.person, txt),
              SizedBox(height: 25),
              Text('Password', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10),
              _buildPasswordField(passwordController, txt),
              SizedBox(height: 20),
              Theme(
                data: Theme.of(context).copyWith(
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _agreeToTerms = !_agreeToTerms;
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to Cardify Africa\'s ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Terms of Service ',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
             GestureDetector(
  onTap: _register,
  child: Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: _agreeToTerms ? button : Colors.blue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        'Register',
        style: TextStyle(color: sign),
      ),
    ),
  ),
),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an Account?'),
                  SizedBox(width: 5),
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, Color txt) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: txt, fontWeight: FontWeight.w700),
          prefixIcon: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(icon, color: Colors.grey),
          ),
          hintStyle: TextStyle(fontFamily: 'Inter', color: txt, fontWeight: FontWeight.w700, fontSize: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: txt, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green, width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, Color txt) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.lock_outline, color: Colors.grey),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
               


                _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          hintStyle: TextStyle(fontFamily: 'Inter'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: txt, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green, width: 2.0),
          ),
        ),
      ),
    );
  }
}
