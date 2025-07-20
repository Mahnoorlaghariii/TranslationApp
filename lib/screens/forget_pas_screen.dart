import 'package:flutter/material.dart';
import 'package:language_translator_app/providers/auth__provider.dart';
import 'package:provider/provider.dart';

class ForgetPasScreen extends StatefulWidget {
  @override
  State<ForgetPasScreen> createState() => _ForgetPasScreen();
}

class _ForgetPasScreen extends State<ForgetPasScreen> {
   final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context, listen: false );
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
              Image.asset("assets/forgot.png", height: 50, width: 50,),
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
           

              SizedBox(height: 80),
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email', border: border),
              ),
              SizedBox(height: 12),
            
              SizedBox(height: 10),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if(email.text.isNotEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Link sent to ${email.text}")));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter email"))); 
                    }
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
                        "Next",
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
