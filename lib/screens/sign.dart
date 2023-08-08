import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/screens/reset.dart';
import 'package:unicon/utils/colors.dart';
import 'package:unicon/utils/themestyling.dart';
import 'package:unicon/widgets/dashboard.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Image.asset("images/logo.png"),
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Log into your account", style: ThemeStyling.signTitleStyle,),
          Container(
            margin: EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  
                  Text('Email',style: ThemeStyling.titleStyle,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined)
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Password', style: ThemeStyling.titleStyle,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline)
                    ),
                  ),

                  const SizedBox(height: 15),

                   Center(
                     child: RichText(
            text:  TextSpan(children: [
              TextSpan(
                  text: 'Forgot your password? ',
                  style: GoogleFonts.inter(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: blackColor
                )),
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResetPassword())),
                  text: 'Click here',
                  style: GoogleFonts.inter(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: blueColor
                )),
              
            ]),
          ),
                   ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(  
                        primary: blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )                
                      ),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboard()));
                      }, child: Text("Sign In", style: ThemeStyling.signButtonStyle,)),
                  ),
                ),
              ],
            ),
          )  
        ],
      ),
    );
  }
 
}

