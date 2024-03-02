// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text(
//           'This is home',
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:student_management/screens/Announcement.dart';
import 'package:student_management/screens/ApplyLeave.dart';
import 'package:student_management/screens/Attendance.dart';
import 'package:student_management/screens/auth/TimeTable/TimeTable.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
            child: AppBarProfile(),
          ),
          body: ProfileTab(),
        ),
      ),
    );
  }
}

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0); // Adjust height as needed

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile_pic.jpg'), // Add your image path here
        ),
        SizedBox(height: 10),
        Text(
          'Janith',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(27.0),
        topRight: Radius.circular(27.0),
      ),
      child: Container(
        color: Colors.blueGrey, // Different color for the body part
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildGridItem(Icons.assignment, 'Attendance', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            }),
            _buildGridItem(Icons.calendar_today, 'Timetable', () {
              print('Navigator.push executed'); // Add this print statement
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimetablePage()),
              );
            }),
            _buildGridItem(Icons.create, 'Apply Leave', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApplyLeave()),
              );
            }),
            _buildGridItem(Icons.announcement, 'Announcement', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Announcement()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}

