// import 'package:currency_converter/Services/currency-API.dart';
// import 'package:flutter/material.dart';

// class DividerButtonPage extends StatelessWidget {
//   final CurrencyAPI currencyAPI = CurrencyAPI();
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//           vertical: 20.0), // تحديد الحواف لضمان عدم الحصول على حجم غير محدود
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Expanded(
//             child: Divider(
//               thickness: 2,
//               color: Colors.grey,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             child: ElevatedButton(
//               onPressed: () {
//                 // وظيفة الزر
//               },
//               style: ElevatedButton.styleFrom(
//                 shape: CircleBorder(),
//                 padding: EdgeInsets.all(16),
//                 backgroundColor: Colors.orange, // لون الخلفية
//               ),
//               child: Icon(Icons.swap_horiz, color: Colors.white), // أيقونة الزر
//             ),
//           ),
//           Expanded(
//             child: Divider(
//               thickness: 2,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
