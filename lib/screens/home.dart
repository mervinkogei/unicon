import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:unicon/utils/colors.dart';
import 'package:unicon/utils/themestyling.dart';
import 'package:unicon/widgets/appBar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? value = 0;
  int? selectedIndex = 0;
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
          Text('Partners', style: ThemeStyling.settingTitleStyle,),   
           const SizedBox(height: 15,),
            ToggleSwitch(
              activeBgColor: [orangeColor],
              // inactiveBgColor: appBarColor,
              activeBorders: [],
              radiusStyle: true,
              customTextStyles: [TextStyle(color: blackColor)],
              minWidth: 80,
            initialLabelIndex: selectedIndex,
            totalSwitches: 4,
            labels: const ['All', 'On Track', 'At Risk', 'Off Track'],
            onToggle: (index) {
              print('switched to: $index');
              setState(() {
                  selectedIndex =index;
              });
            },
          ),

         Expanded(
           child: SingleChildScrollView(
             child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                 margin: const EdgeInsets.only(left:0.0, right: 0, top: 15),
                 padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffB1B1B1)),
                  borderRadius: BorderRadius.circular(8)
                ),
                 child:  ListTile(
                   leading: Image.asset('images/part_logo.png'),
                   title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Turf Kenya Ltd'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('1 Pending KPI'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 3.0, bottom: 5),
                      child: Text('70%'),
                    ),
                    Text('Off Track',style: TextStyle(color: Colors.red),)
                  ],
                ),
                LinearProgressBar(
                  minHeight: 5,
                 maxSteps: 6,
                 progressType: LinearProgressBar.progressTypeLinear,
                 currentStep: 4,
                 progressColor: Colors.green,
                 backgroundColor: Colors.grey,
               )
              ],
                   ),
                 ),
               );
                  }),
                  const SizedBox(height: 20,)
                ],
              ),
           ),
         ),
    

          


        ]),
      ),
    );
  }
}