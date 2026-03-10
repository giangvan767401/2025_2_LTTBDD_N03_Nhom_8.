import 'package:flutter/material.dart';

class ManHinhDongHo extends StatefulWidget {
  const ManHinhDongHo({super.key});

  @override
  State<ManHinhDongHo> createState() => _ManHinhDongHoState();
}

class _ManHinhDongHoState extends State<ManHinhDongHo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đồng hồ Pomodoro'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Màn hình đồng hồ Pomodoro'),
      ),
    );
  }
}