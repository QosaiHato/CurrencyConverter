import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,required this.onChanged,required this.controller});
  void Function(String)? onChanged;
   TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 56,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            onChanged: onChanged,
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 239, 239, 239),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              )
              // ListView.builder(
              //     itemCount: currencyData!['data'].length,
              //     itemBuilder: (context, index) {
              //       String currency = currencyData!['data'].keys.elementAt(index);
              //       double rate = currencyData!['data'][currency]['value'];
              //       return ListTile(
              //         title: Text('$currency: $rate'),
              //       );
              //     },
              //   ),
              )
        ]));
  }
}
