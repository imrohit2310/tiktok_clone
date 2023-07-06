// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(
      AuthController(),
    );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: LoginScreen(),
    );
  }
}



// import 'package:flutter/material.dart';

// class DataFilteringApp extends StatefulWidget {
//   @override
//   _DataFilteringAppState createState() => _DataFilteringAppState();
// }

// class _DataFilteringAppState extends State<DataFilteringApp> {
//   List<String> data = ['Apple', 'Banana', 'Orange', 'Mango'];
//   List<String> filteredData = [];

//   bool isChecked = false;

//   @override
//   void initState() {
//     super.initState();
//     filteredData = List.from(data);
//   }

//   void filterData(bool? checked) {
//     setState(() {
//       isChecked = checked!;

//       if (checked) {
//         filteredData = data.where((item) => item.toLowerCase().contains('a')).toList();
//       } else {
//         filteredData = List.from(data);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Data Filtering Example'),
//         ),
//         body: Column(
//           children: [
//             CheckboxListTile(
//               title: Text('Filter data'),
//               value: isChecked,
//               onChanged: filterData,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredData.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(filteredData[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(DataFilteringApp());
// }
