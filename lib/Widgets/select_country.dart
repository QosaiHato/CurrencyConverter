import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatefulWidget {
  SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String? countryName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(1),
          minimumSize: Size(70, 60),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        showCountryPicker(
          context: context,
          exclude: <String>['KN', 'MF'],
          favorite: <String>['SE'],
          showPhoneCode: true,
          onSelect: (Country country) {
            setState(() {
              countryName = country.flagEmoji; // تحديث قيمة countryName هنا
            });
            print(countryName);
            print('Select country: ${country.displayName}');
          },
          moveAlongWithKeyboard: false,
          countryListTheme: CountryListThemeData(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
            searchTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        width: 100,
        height: 100,
        child: Center(
          child: Row(
            children: [
              Text(
                countryName ?? "Select Country", // عرض النص المحدث هنا
                style: TextStyle(color: Colors.black,fontSize: 50),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}
