import 'package:flutter/material.dart';
import 'package:unicon/utils/colors.dart';
import 'package:unicon/utils/themestyling.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Settings', style: ThemeStyling.settingTitleStyle,),
          ),        

          Container(
             margin: const EdgeInsets.all(15.0),
             padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8)
            ),
            child:  ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                trailing: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: blueColor,
            activeColor: blueColor.withOpacity(0.4),
          ),
              ),
          ),
    Container(
      margin: const EdgeInsets.only(left:15.0, right: 15, bottom: 15),
             padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8)
            ),
      child: const ListTile(
        leading: Icon(Icons.support),
        title: Text('Contact Support'),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    ),
 
    const Spacer(),

    const Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 25.0),
        child: Text('v1.0.0'),
      ),
    )

        ],
      ),
    );
  }
}