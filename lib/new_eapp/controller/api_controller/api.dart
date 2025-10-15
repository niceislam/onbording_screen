// import 'package:flutter/material.dart';
//
// // 1. Define the Custom App Bar
// class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final double height;
//   final Color backgroundColor;
//
//   RoundedAppBar({
//     Key? key,
//     required this.title,
//     this.height = kToolbarHeight + 20,
//     this.backgroundColor = Colors.deepPurple,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//
//     return Container(
//       height: statusBarHeight + height,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(25.0),
//           bottomRight: Radius.circular(25.0),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(top: statusBarHeight),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             // Example Back Button
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
//             ),
//
//             // Title
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//
//             // Example Action Button
//             IconButton(
//               icon: const Icon(Icons.favorite_border, color: Colors.white),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }
//
//
// // 3. How to use it in your Scaffold
// class CustomAppBarScreen extends StatelessWidget {
//   const CustomAppBarScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Use your custom widget right here!
//       appBar: RoundedAppBar(
//         title: 'Rounded Search',
//         backgroundColor: const Color(0xFFFF4081), // Your preferred pink/red!
//       ),
//       body: const Center(
//         child: Text('Your beautiful content goes here!'),
//       ),
//     );
//   }
// }