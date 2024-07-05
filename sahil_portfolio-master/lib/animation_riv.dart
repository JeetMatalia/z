// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_rive/flutter_rive.dart';

// class EyeCatchyAnimation extends StatefulWidget {
//   @override
//   _EyeCatchyAnimationState createState() => _EyeCatchyAnimationState();
// }

// class _EyeCatchyAnimationState extends State<EyeCatchyAnimation> {
//   late Artboard _artboard;

//   @override
//   void initState() {
//     super.initState();
//     _loadRiveFile();
//   }

//   Future<void> _loadRiveFile() async {
//     try {
//       final bytes = await rootBundle.load(
//           'assets/your_animation.riv'); // Replace with the actual file path
//       final file = RiveFile.import(bytes);
//       setState(() {
//         _artboard = file.mainArtboard;
//       });
//     } catch (e) {
//       print('Error loading Rive file: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Eye-Catchy Animation'),
//       ),
//       body: _artboard != null
//           ? Rive(
//               artboard: _artboard,
//               fit: BoxFit.contain,
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
