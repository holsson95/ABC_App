import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/components/side_menu.dart';
import 'package:flutter_application_1/features/authentication/screens/add_students/add_students_page.dart';
import 'package:flutter_application_1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final String userName;
  
  DashboardPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: darkMode ? Color.fromARGB(255, 18, 18, 18) : Colors.white,
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(() => RegisterStudentPage()),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black), 
                labelText: 'Search by Name...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search, color: darkMode ? Colors.white : Colors.black),
                filled: true,
                fillColor: darkMode ? Colors.grey[900] : Colors.white, 
              ),
            ),
          ),
          //Profile List
          Expanded(
            child: ListView.builder(
              itemCount: 4, //change when I can grab from dataset
              itemBuilder: (context, index) {
                return ProfileCard(
                  imageUrl: 'https://placekitten.com/200/200', 
                  title: "Name", 
                  caption1: "School Name", 
                  caption2: "Grade Level",
                  backgroundColor: darkMode ? Colors.grey[900]! : Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// Reusable ProfileCard widget
class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String caption1;
  final String caption2;
  final Color backgroundColor;

  const ProfileCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.caption1,
    required this.caption2,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: backgroundColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                caption1,
                style: TextStyle(
                  color: darkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              Text(
                caption2,
                style: TextStyle(
                  color: darkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}