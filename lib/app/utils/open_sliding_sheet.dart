// import 'package:flutter/material.dart';

// void openSlidingSheet(BuildContext context, Widget page) async {
//   await showSlidingBottomSheet(
//     context,
//     resizeToAvoidBottomInset: false,
//     builder: (context) {
//       return SlidingSheetDialog(
//         elevation: 8,
//         cornerRadius: 30,
//         snapSpec: const SnapSpec(
//           snap: true,
//           snappings: [0.4, 0.9],
//           positioning: SnapPositioning.relativeToAvailableSpace,
//         ),
//         builder: (context, state) {
//           return Material(
//             color: AppColors.backgroundWhite,
//             child: page,
//           );
//         },
//       );
//     },
//   );
// }
