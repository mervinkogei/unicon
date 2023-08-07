import 'package:flutter/material.dart';
import 'package:unicon/utils/themestyling.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar(context),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 72,
                  width: 72,
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(10),
                      child: Image.asset('images/user.png'),
                    ),
                ),
                const SizedBox(height: 15,),
                  Text("Jane Doe", style: ThemeStyling.profiletitleStyle,),
                  const SizedBox(height: 5,),
                  Text("janedoe@tactive.consulting", style: ThemeStyling.profileEmailStyle,),
                  const SizedBox(height: 15,),
              ],
            ),
          ),

          // Column(
          //   children: [
          //     ListView.builder(
          //       shrinkWrap: true,
          //     itemCount: 5,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (BuildContext context, int index) {
          //       return ListTile(
          //           leading: const Icon(Icons.list),
          //           trailing: const Text(
          //             "GFG",
          //             style: TextStyle(color: Colors.green, fontSize: 15),
          //           ),
          //           title: Text("List item $index"));
          //     }),
          //   ],
          // ),
    

          Container(
             margin: const EdgeInsets.all(15.0),
             padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8)
            ),
            child: const ListTile(
                leading: Icon(Icons.emergency_outlined),
                title: Text('Change Password'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
          ),
    Container(
      margin: const EdgeInsets.only(left:15.0, right: 15, bottom: 15),
             padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8)
            ),
      child: const ListTile(
        leading: Icon(Icons.check_circle_outline),
        title: Text('Update Account Details'),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    ),
    Container(
      margin: const EdgeInsets.only(left:15.0, right: 15),
             padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8)
            ),
      child: const ListTile(
        leading: Icon(Icons.logout),
        title: Text('Log Out'),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    ),
    const Spacer(),

    const Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Text('v1.0.0'),
    )

        ],
      ),
    );
  }
}