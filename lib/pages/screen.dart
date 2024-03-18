import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.title,
    required this.anh,
    required this.hoa,
    required this.li,
    required this.sinh,
    required this.toan,
    required this.van,
  });

  final String title;
  final double toan;
  final double van;
  final double anh;
  final double li;
  final double hoa;
  final double sinh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Diem toan: '),
                  Text(toan.toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Diem van: '),
                  Text(van.toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Diem anh: '),
                  Text(anh.toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Diem li: '),
                  Text(li.toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Diem hoa: '),
                  Text(hoa.toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Diem sinh: '),
                  Text(sinh.toStringAsFixed(2)),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ));
  }
}
