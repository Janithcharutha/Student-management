//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import 'database.dart';
// import 'employee.dart';
//
// class TimetablePage extends StatefulWidget {
//   @override
//   _TimetablePageState createState() => _TimetablePageState();
// }
//
//
//
// class _TimetablePageState extends State<TimetablePage> with SingleTickerProviderStateMixin {
//   late TabController _tabController; // Making _tabController late-initialized
//
//
//   TextEditingController namecontroller=new TextEditingController();
//   TextEditingController agecontroller=new TextEditingController();
//   TextEditingController locationcontroller=new TextEditingController();
//
//
//   Stream? EmployeeStream;
//
//   getontheload()async{
//     EmployeeStream=await DatabaseMethods().getEmployeeDetails();
//     setState(() {
//
//     });
//   }
//
//
//   @override
//   void initState() {
//     getontheload();
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this); // 5 days (Monday to Friday)
//   }
//
//   Widget allEmployeeDetails(){
//     return StreamBuilder(
//         stream: EmployeeStream,
//         builder: (context, AsyncSnapshot snapshot){
//           return snapshot.hasData? ListView.builder(
//               itemCount: snapshot.data.docs.length,
//               itemBuilder: (context, index){
//                 DocumentSnapshot ds=snapshot.data.docs[index];
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 20.0),
//                   child: Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: Container(
//                       padding: EdgeInsets.all(20.0),
//                       width: MediaQuery.of(context).size.width,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//
//                             children: [
//                               Text("Subject code:"+ds ["Subject"],style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
//                               Spacer(),
//                               GestureDetector(
//                                   onTap: (){
//                                     namecontroller.text=ds["Subject"];
//                                     agecontroller.text=ds["Time"];
//                                     locationcontroller.text=ds["Location"];
//                                     EditEmployeeDetail(ds["Id"]);
//                                   },
//                                   child: Icon(Icons.edit,color: Colors.orange,)),
//                               SizedBox(width: 5.0,),
//                               GestureDetector(
//                                   onTap: ()async{
//                                     await  DatabaseMethods().deletEmployeeDetail(ds["Id"]);
//                                   },
//                                   child: Icon(CupertinoIcons.delete,color: Colors.orange,))
//                             ],
//
//                           ),
//                           Text("Time:"+ds ["Time"],style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
//                           Text("Location: "+ds ["Location"],style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
//
//                         ],
//                       ),),
//                   ),
//                 );
//               }): Container();
//         });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Timetable'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Monday'),
//             Tab(text: 'Tuesday'),
//             Tab(text: 'Wednesday'),
//             Tab(text: 'Thursday'),
//             Tab(text: 'Friday'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildDay('Monday'),
//           _buildDay('Tuesday'),
//           _buildDay('Wednesday'),
//           _buildDay('Thursday'),
//           _buildDay('Friday'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDay(String day) {
//     Widget body;
//     VoidCallback? onPressedFunction;
//
//     switch (day) {
//       case 'Monday':
//         onPressedFunction = () {
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Employee()));
//         };
//         break;
//       case 'Tuesday':
//         onPressedFunction = () {
//           // Add your function for Tuesday's FloatingActionButton here
//         };
//         break;
//       case 'Wednesday':
//         onPressedFunction = () {
//           // Add your function for Wednesday's FloatingActionButton here
//         };
//         break;
//       case 'Thursday':
//         onPressedFunction = () {
//           // Add your function for Thursday's FloatingActionButton here
//         };
//         break;
//       case 'Friday':
//         onPressedFunction = () {
//           // Add your function for Friday's FloatingActionButton here
//         };
//         break;
//       default:
//         onPressedFunction = null;
//     }
//
//     body = Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
//           child: Column(
//             children: [
//               Expanded(child: allEmployeeDetails()),
//             ],
//           ),
//         ),
//         if (onPressedFunction != null)
//           Positioned(
//             bottom: 20.0,
//             right: 20.0,
//             child: FloatingActionButton(
//               onPressed: onPressedFunction,
//               child: Icon(Icons.add),
//             ),
//           ),
//       ],
//     );
//
//     return body;
//   }
//
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//
//   Future EditEmployeeDetail(String id)=>showDialog(context: context, builder: (context)=>AlertDialog(
//     content: Container(
//       child:Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:[
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap:(){
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.cancel),),
//                 SizedBox(width: 60.0,),
//                 Text("Edit",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
//                 Text("Details",style: TextStyle(color: Colors.orange,fontSize: 24,fontWeight: FontWeight.bold),)
//
//               ],
//             ),
//             SizedBox(height: 20.0,),
//             Text("Subject Name",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold ),),
//             SizedBox(height: 10.0,),
//             Container(
//               padding: EdgeInsets.only(left: 10.0),
//               decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
//               child: TextField(
//                 controller: namecontroller,
//                 decoration: InputDecoration(border: InputBorder.none),
//               ),),
//             SizedBox(height: 10.0,),
//             Text("Time",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold ),),
//             SizedBox(height: 10.0,),
//             Container(
//               padding: EdgeInsets.only(left: 10.0),
//               decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
//               child: TextField(
//                 controller: agecontroller,
//                 decoration: InputDecoration(border: InputBorder.none),
//               ),),
//             SizedBox(height: 10.0,),
//             Text("Location",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold ),),
//             SizedBox(height: 10.0,),
//             Container(
//               padding: EdgeInsets.only(left: 10.0),
//               decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
//               child: TextField(
//                 controller: locationcontroller,
//                 decoration: InputDecoration(border: InputBorder.none),
//               ),),
//             SizedBox(height: 30.0,),
//             Center(child: ElevatedButton(onPressed: () async {
//               Map<String, dynamic>updateInfo={
//                 "Subject":namecontroller.text,
//                 "Time":agecontroller.text,
//                 "Id": id,
//                 "Location":locationcontroller.text,
//               };
//               await DatabaseMethods().UpdateEmployeeDetail(id,updateInfo).then((value){});
//               Navigator.pop(context);
//             }, child: Text("Update"))),
//           ]),
//     ),
//   ));
//
//
//
// }
//
// // void main() {
// //   runApp(MaterialApp(
// //     home: TimetablePage(),
// //   ));
// //
// // }
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database.dart';
import 'employee.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // Making _tabController late-initialized

  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  Stream? EmployeeStream;

  getontheload() async {
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
    _tabController =
        TabController(length: 5, vsync: this); // 5 days (Monday to Friday)
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      // Add logic here to handle tab selection
    });
  }

  void _handleMondayTabSelection() {
    setState(() {
      getontheload();
      // Add logic for Monday tab selection
    });
  }

  void _handleTuesdayTabSelection() {
    setState(() {
      // Add logic for Tuesday tab selection
    });
  }

  void _handleWednesdayTabSelection() {
    setState(() {
      // Add logic for Wednesday tab selection
    });
  }

  void _handleThursdayTabSelection() {
    setState(() {
      // Add logic for Thursday tab selection
    });
  }

  void _handleFridayTabSelection() {
    setState(() {
      // Add logic for Friday tab selection
    });
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: EmployeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Subject code:${ds["Subject"]}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    namecontroller.text = ds["Subject"];
                                    agecontroller.text = ds["Time"];
                                    locationcontroller.text =
                                    ds["Location"];
                                    EditEmployeeDetail(ds["Id"]);
                                  },
                                  child: Icon(Icons.edit,
                                      color: Colors.orange)),
                              SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await DatabaseMethods()
                                        .deletEmployeeDetail(ds["Id"]);
                                  },
                                  child: Icon(CupertinoIcons.delete,
                                      color: Colors.orange))
                            ],
                          ),
                          Text(
                            "Time:${ds["Time"]}",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Location: ${ds["Location"]}",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            // Call the respective handler based on the selected tab index
            switch (index) {
              case 0:
                _handleMondayTabSelection();
                break;
              case 1:
                _handleTuesdayTabSelection();
                break;
              case 2:
                _handleWednesdayTabSelection();
                break;
              case 3:
                _handleThursdayTabSelection();
                break;
              case 4:
                _handleFridayTabSelection();
                break;
            }
          },
          tabs: [
            Tab(
              text: 'Monday',
            ),
            Tab(
              text: 'Tuesday',
            ),
            Tab(
              text: 'Wednesday',
            ),
            Tab(
              text: 'Thursday',
            ),
            Tab(
              text: 'Friday',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDay('Monday'),
          _buildDay('Tuesday'),
          _buildDay('Wednesday'),
          _buildDay('Thursday'),
          _buildDay('Friday'),
        ],
      ),
    );
  }

  Widget _buildDay(String day) {
    Widget body;
    VoidCallback? onPressedFunction;

    switch (day) {
      case 'Monday':
        onPressedFunction = () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Employee()));
        };
        break;
      case 'Tuesday':
        onPressedFunction = () {
          // Add your function for Tuesday's FloatingActionButton here
        };
        break;
      case 'Wednesday':
        onPressedFunction = () {
          // Add your function for Wednesday's FloatingActionButton here
        };
        break;
      case 'Thursday':
        onPressedFunction = () {
          // Add your function for Thursday's FloatingActionButton here
        };
        break;
      case 'Friday':
        onPressedFunction = () {
          // Add your function for Friday's FloatingActionButton here
        };
        break;
      default:
        onPressedFunction = null;
    }

    body = Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            children: [
              Expanded(child: allEmployeeDetails()),
            ],
          ),
        ),
        if (onPressedFunction != null)
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: onPressedFunction,
              child: Icon(Icons.add),
            ),
          ),
      ],
    );

    return body;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future EditEmployeeDetail(String id) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Subject Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Time",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: agecontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Location",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: locationcontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> updateInfo = {
                          "Subject": namecontroller.text,
                          "Time": agecontroller.text,
                          "Id": id,
                          "Location": locationcontroller.text,
                        };
                        await DatabaseMethods()
                            .UpdateEmployeeDetail(id, updateInfo)
                            .then((value) {});
                        Navigator.pop(context);
                      },
                      child: Text("Update"))),
            ]),
      ),
    ),
  );
}
