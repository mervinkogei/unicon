import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/screens/sign.dart';
import 'package:unicon/utils/themestyling.dart';

import '../utils/colors.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("Reset your password", style: ThemeStyling.signTitleStyle,),
            Container(
              margin: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('Reset Code',style: ThemeStyling.titleStyle,),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor,
                        focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: whiteColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: whiteColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                        hintText: 'Reset Code',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('New Password',style: ThemeStyling.titleStyle,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor,
                        focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: whiteColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: whiteColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                        hintText: 'New Password',
                        prefixIcon: const Icon(Icons.lock_outline)
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Confirm Password', style: ThemeStyling.titleStyle,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: whiteColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                        filled: true,
                        fillColor: greyColor,
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: whiteColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                        hintText: 'Confirm Password',
                        prefixIcon: const Icon(Icons.lock_outline)
                      ),
                    ),
      
                    const SizedBox(height: 15),
      
                     Center(
                       child: RichText(
              text:  TextSpan(children: [
                TextSpan(
                    text: 'Have an account? ',
                    style: GoogleFonts.inter(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: blackColor
                  )),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Sign())),
                    text: 'Sign In',
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
                        onPressed: (){}, child: Text("Reset Password", style: ThemeStyling.signButtonStyle,)),
                    ),
                  ),
                ],
              ),
            )  
          ],
        ),
      ),
    );
  }
}