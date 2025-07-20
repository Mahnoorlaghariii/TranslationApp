import 'package:flutter/material.dart';
import 'package:language_translator_app/screens/login.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(12));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 161, 246),
      body: Container(
        padding: EdgeInsets.only(top: 5),
        width: 700,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 201, 235),
          borderRadius: BorderRadius.circular(30),
        ),

        margin: EdgeInsets.only(top: 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Let's get you in",
                style: TextStyle(color: Colors.grey[700]),
              ),

              SizedBox(height: 15),
              GradientButton(
                image: "assets/fblogo.png",
                text: "Sign In With Facebook",
                onPressed: () {},
              ),
              SizedBox(height: 8),
              GradientButton(
                image: "assets/googlelogo.png",
                text: "Sign In With Google",
                onPressed: () {},
              ),

              SizedBox(height: 20),
              DividerWithText(),

              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(hintText: 'Email', border: border),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: border,
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
                SizedBox(height: 10),
                TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Re-Password',
                  border: border,
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),

              SizedBox(height: 15),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                  }, 
                  style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    backgroundColor: const Color.fromARGB(255, 37, 4, 95),
                    padding: EdgeInsets.symmetric(vertical: 20,  ),  
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 30),
                      
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 107, 60, 116)
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                    child: Text("Sign In"),
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

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const SocialButton({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.abc),
      label: Text(label),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("OR"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String image;

  const GradientButton({
    required this.image,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFFd1c4e9), Color(0xFFede7f6)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 136, 93, 211).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: 20),
              Image.asset(image, height: 30, width: 30),
              SizedBox(width: 30),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
