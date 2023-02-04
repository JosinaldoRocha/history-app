// import 'package:config_api/config_api.dart';
// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:wsg_log_app/app/modules/stock/views/widgets/stock_datails/damage_images_widget.dart';

// class DamageListWidget extends StatelessWidget {
//   const DamageListWidget({
//     Key? key,
//     required this.item,
//   }) : super(key: key);
//   final List<AvariaModel> item;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemCount: item[0].images.length,
//         itemBuilder: (context, index) => Column(
//           children: [
//             const Space.x2(),
//             SizedBox(
//               height: 50,
//               width: 50,
//               child: CircleAvatar(
//                 backgroundColor: Colors.grey[200],
//                 child: IconButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) => const DamageImagesWidget(),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.photo_camera,
//                   ),
//                 ),
//               ),
//             ),
//             const Space.x1(),
//             Text('Avaria ${index + 1}')
//           ],
//         ),
//       ),
//     );
//   }
// }
