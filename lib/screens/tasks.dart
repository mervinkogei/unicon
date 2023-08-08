import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:unicon/utils/colors.dart';
import 'package:unicon/utils/themestyling.dart';

class Tasks extends StatefulWidget {
  Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
            Text('My Tasks', style: ThemeStyling.settingTitleStyle,),   
             const SizedBox(height: 10,),
             Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                         focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: whiteColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                      filled: true,
                      fillColor: greyColor,
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: whiteColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search'
                      ),
                    )),
                ),
                const SizedBox(width: 10),
                Container(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: whiteColor
                    ),
                  onPressed: () {},
                  icon: const Icon(                     
                    Icons.filter_list,
                    size: 24.0,
                    color: blackColor,
                  ),
                  label: Text('Filter', style: TextStyle(color: blackColor),),
                ),
                                )
              ],
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
                   title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Social media management training'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Due Date: 8/06/2023'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Progress: 2/8'),
                ),
                Row(
                  children: [
                    Image.asset('images/part_logo.png'),
                    Text('Turf Kenya Ltd')
                  ],
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
          ],
        ),
      ),
    );
  }
}