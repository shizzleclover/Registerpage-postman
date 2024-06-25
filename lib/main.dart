import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _agreeToTerms = false;
  bool _obscureText = true;  

  @override
  Widget build(BuildContext context) {
    Color txt = Color.fromRGBO(152, 152, 152, 1);
    Color button = Color.fromRGBO(21, 96, 189, 1);
    Color sign = Color.fromRGBO(255, 255, 255, 1);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign Up', style: TextStyle(fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Text(
              'Finish Creating Your Cardify Account',
              style: TextStyle(color: txt, fontSize: 17, fontFamily: 'Inter', fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 40),
            Text('First and Last Name', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First and Last Name', labelStyle: TextStyle(color: txt, fontWeight: FontWeight.w700),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset('Assets/user.svg',
                     width: 24.0,
                        height: 24.0,
                        color: Colors.grey,),
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
            ),
            SizedBox(height: 25),
            Text('Username', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',labelStyle: TextStyle(color: txt, fontWeight: FontWeight.w700),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset('Assets/internet.svg',
                     width: 24.0,
                        height: 24.0,
                        color: Colors.grey,),
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
            ),
            SizedBox(height: 25),
            Text('Email Address', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',labelStyle: TextStyle(color: txt, fontWeight: FontWeight.w700),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset('Assets/mail.svg',
                     width: 24.0,
                        height: 24.0,
                        color: Colors.grey,),
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
            ),
            SizedBox(height: 25),
            Text('Password', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
            SizedBox(height: 10),
            //Referal text field
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
               
                decoration: InputDecoration(
                  labelText: 'Referral(Optional)',labelStyle: TextStyle(color: txt, fontWeight: FontWeight.w700),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset( 'Assets/user.svg',
                     width: 24.0,
                        height: 24.0,
                        color: Colors.grey,),
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
            ),
            SizedBox(height: 25),
            //Password
            Text('Password', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, color: Colors.black)),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset('Assets/lock.svg',
                     width: 24.0,
                        height: 24.0,
                         ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        _obscureText ? 'Assets/eye.svg' : 'Assets/eye_off.svg',
                        width: 24.0,
                        height: 24.0,
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
            ),
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
                        _agreeToTerms = value!;
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
              onTap: _agreeToTerms
                  ? () {
                      // Handle form submission
                    }
                  : null,
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an Account?', style: TextStyle()),
                SizedBox(width: 5,),
                Text('Login', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
