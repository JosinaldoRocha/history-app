// import 'package:flutter/material.dart';
// import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
// import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

// class DamageImagesWidget extends StatelessWidget {
//   const DamageImagesWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: ListView(
//         padding: const EdgeInsets.all(20),
//         children: [
//           BoxText.bodyBold('Fotos da avaria'),
//           const Space.x8(),
//           GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 5.0,
//               mainAxisSpacing: 5.0,
//             ),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 1,
//             itemBuilder: (context, index) => Image.asset(ImagesConstants.carro),
//           ),
//         ],
//       ),
//     );
//   }
// }
