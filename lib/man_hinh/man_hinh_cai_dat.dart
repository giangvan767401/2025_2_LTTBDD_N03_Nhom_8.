import 'package:flutter/material.dart';

class ManHinhCaiDat extends StatefulWidget {
  const ManHinhCaiDat({super.key});

  @override
  State<ManHinhCaiDat> createState() => _ManHinhCaiDatState();
}

class _ManHinhCaiDatState extends State<ManHinhCaiDat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt Pomodoro'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Màn hình cài đặt Pomodoro\n(Đang phát triển...)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
