import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../core/export.dart';

class SmModifyScreen extends StatefulWidget {
  const SmModifyScreen({super.key});
  @override
  _SmModifyScreenScreenState createState() => _SmModifyScreenScreenState();
}

class _SmModifyScreenScreenState extends State<SmModifyScreen> {
  final _nameController = TextEditingController();
  late Color _defaultColorButton = Colors.blueAccent;
  void changeColor(Color color) {
    setState(() => _defaultColorButton = color);
  }
  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _defaultColorButton,
              onColorChanged: (Color color) {
                setState(() {
                  _defaultColorButton = color; // Update selected color
                });
              },
              showLabel: true, // Show the hex code of the color
              pickerAreaHeightPercent: 0.8, // Height of the color picker area
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Select'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.sp), // Adjust this height
        child: AppBar(
          flexibleSpace: Container(
            decoration: _gradientBox,
          ),
          title: const Center(
            child: Text(
              'Modify your app',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // If you want to hide the back arrow
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 100.h, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                _nameTextField,
                _chageColorButton,
                _agreeText,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _nameTextField {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.sp),
      child: TextFormField(
        controller: _nameController,
        cursorColor: Colors.black,
        cursorHeight: 25,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.person_add_rounded),
          ),
          prefixIconColor: Colors.grey,
          labelText: 'Name the person you care',
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Set the border color for the enabled state
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Set the border color for the focused state
              width: 1.5,
            ),
          ),
        ),
        // style: const TextStyle(
        //   fontWeight: FontWeight.w500,
        //   color: Colors.black,
        // ),
      ),
    );
  }

  Decoration get _gradientBox {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff1E2E3D), Color(0xff152534), Color(0xff0C1C2E)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  Widget get _chageColorButton {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.sp ),
      child: Row(
        children: [
          Container(
            width: 220.w,
            decoration: BoxDecoration(
              color: _defaultColorButton, // Set the background color to green
              borderRadius:
              BorderRadius.circular(8.0), // Add border radius if needed
            ),
            child: TextButton(
              onPressed: _openColorPicker,
              child: Text(
                'The color you want',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color:
                  Colors.white, // Set text color to white for better contrast
                ),
              ),
            ),
          ),
          SizedBox(width: 30.sp,),
          Container(
            width: 60.sp,
            height: 50.sp,
            decoration: BoxDecoration(
              color: _defaultColorButton,
              borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black, width: 2.0),
            ),
          )
        ],
      )
    );
  }

  Widget get _agreeText {
    return Container(
      decoration: BoxDecoration(
         //  border: Border.all(color: Colors.redAccent,
         // ),
        borderRadius: BorderRadius.circular(12.sp),
        gradient: const LinearGradient(
        colors: [Colors.red, Colors.orange, Colors.yellow], // Gradient colors
        begin: Alignment.centerRight, // Start from the right (yellow)
        end: Alignment.centerLeft,    // End at the left (red)
      ),
      ),
      child: Padding(
        padding:  EdgeInsets.all(8.sp),
        child: Column(
          children: [
            Text(
              'Once you chose , you can not chose again',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Icon(
              Icons.dangerous,
              color: Colors.white,
              size: 35.sp,
            )
          ],
        ),
      ),
    );
  }
}
