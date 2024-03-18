import 'dart:html';

import 'package:calculator2/components/app_textfield.dart';
import 'package:calculator2/components/elevated_button.dart';
import 'package:calculator2/pages/screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController toancontroller = TextEditingController();
  TextEditingController vancontroller = TextEditingController();
  TextEditingController anhcontroller = TextEditingController();
  TextEditingController licontroller = TextEditingController();
  TextEditingController hoacontroller = TextEditingController();
  TextEditingController sinhcontroller = TextEditingController();

  String results = '';
  String get validate {
    String monhoc = '';
    try {
      monhoc = 'toan';
      double.parse(toancontroller.text.trim());
      monhoc = 'van';
      double.parse(toancontroller.text.trim());
      monhoc = 'anh';
      double.parse(toancontroller.text.trim());
      monhoc = 'li';
      double.parse(toancontroller.text.trim());
      monhoc = 'hoa';
      double.parse(toancontroller.text.trim());
      monhoc = 'sinh';
      double.parse(toancontroller.text.trim());
    } on FormatException {
      return ' The mark must be number!';
    }
    return 'isChecked';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8)
            .copyWith(top: 40, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nhap diem',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 40),

            // NHAP DIEM TOAN
            AppTextField(
              controller: toancontroller,
              hintText: 'Nhap diem toan',
              labelText: 'Diem toan',
              textInputAction: TextInputAction.next,
            ),
            // nhap diem van
            const SizedBox(height: 16),
            AppTextField(
              controller: vancontroller,
              hintText: 'Nhap diem van',
              labelText: 'Diem van',
              textInputAction: TextInputAction.next,
            ),
            // nhap diem anh
            const SizedBox(height: 16),
            AppTextField(
              controller: anhcontroller,
              hintText: 'Nhap diem anh',
              labelText: 'Diem anh',
              textInputAction: TextInputAction.next,
            ),
            //  nhap diem li
            const SizedBox(height: 16),
            AppTextField(
              controller: licontroller,
              hintText: 'Nhap diem li',
              labelText: 'Diem li',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            //  nhap diem hoa
            AppTextField(
              controller: hoacontroller,
              hintText: 'Nhap diem hoa',
              labelText: 'Diem hoa',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            //  nhap diem sinh
            AppTextField(
              controller: sinhcontroller,
              hintText: 'Nhap diem sinh',
              labelText: 'Diem sinh',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            AppElevatedButton(
              onPressed: () {
                results = '';
                if (validate != 'isChecked') {
                  final snackBar = SnackBar(content: Text(validate));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  double toan = double.parse(toancontroller.text.trim());
                  double van = double.parse(vancontroller.text.trim());
                  double anh = double.parse(anhcontroller.text.trim());
                  double li = double.parse(licontroller.text.trim());
                  double hoa = double.parse(hoacontroller.text.trim());
                  double sinh = double.parse(sinhcontroller.text.trim());

                  results = ((toan + van + anh + li + hoa + sinh) / 6)
                      .toStringAsFixed(2);
                }
                setState(() {});
              },
              text: 'GO',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('results: ',
                style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                Text(
                  results,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                if (validate != 'isChecked') {
                  final snackBar = SnackBar(content: Text(validate));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                Route route = MaterialPageRoute(
                  builder: (context) => Screen(
                      title: 'Information',
                      toan: double.parse(toancontroller.text.trim()),
                      van: double.parse(vancontroller.text.trim()),
                      anh: double.parse(anhcontroller.text.trim()),
                      li: double.parse(licontroller.text.trim()),
                      hoa: double.parse(hoacontroller.text.trim()),
                      sinh: double.parse(anhcontroller.text.trim()),
                      ),
                );
                Navigator.push(context, route);
              },
              child: Text('Details'),
            )
          ],
        ),
      ),
    );
  }
}
