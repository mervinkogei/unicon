import 'package:flutter/material.dart';
import 'package:unicon/utils/themestyling.dart';

class Updates extends StatefulWidget {
  Updates({Key? key}) : super(key: key);

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left:15.0, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
              Text('Updates', style: ThemeStyling.settingTitleStyle,),   
               const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}