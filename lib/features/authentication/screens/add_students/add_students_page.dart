import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterStudentPage extends StatefulWidget {
  @override
  _RegisterStudentPageState createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  File? _profileImage; // Profile picture file
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  // Controllers for form fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _gradeLevelController = TextEditingController();

  String _gender = 'Male'; // Default gender

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture Section
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: darkMode ? Colors.grey[700] : Colors.grey[300],
                      backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                      child: _profileImage == null
                          ? Icon(Icons.camera_alt, size: 50, color: darkMode ? Colors.white : Colors.black)
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Name Fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                          filled: true,
                          fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                          filled: true,
                          fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Nickname (Optional)
                TextFormField(
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    labelText: 'Nickname (Optional)',
                    labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                    filled: true,
                    fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Birthday
                TextFormField(
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                    filled: true,
                    fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _birthdayController.text = "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  readOnly: true,
                ),
                SizedBox(height: 16),

                // Gender Dropdown
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                    filled: true,
                    fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(),
                  ),
                  items: ['Male', 'Female', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                ),
                SizedBox(height: 16),

                // School Name
                TextFormField(
                  controller: _schoolNameController,
                  decoration: InputDecoration(
                    labelText: 'School Name',
                    labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                    filled: true,
                    fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a school name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Grade Level
                TextFormField(
                  controller: _gradeLevelController,
                  decoration: InputDecoration(
                    labelText: 'Grade Level',
                    labelStyle: TextStyle(color: darkMode ? Colors.white : Colors.black),
                    filled: true,
                    fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a grade level';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, perform submission logic here
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting form...')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
