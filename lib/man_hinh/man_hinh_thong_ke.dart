import 'package:flutter/material.dart';
import 'man_hinh_dong_ho.dart'; 
import '../models/phien_pomodoro.dart'; 

class ManHinhThongKe extends StatelessWidget {
  final List<PhienPomodoro> danhSachPhien;

  const ManHinhThongKe({super.key, required this.danhSachPhien});

  @override
  Widget build(BuildContext context) {

    final DateTime homNay = DateTime.now();

    final List<PhienPomodoro> phienHomNay =
        danhSachPhien.where((phien) {
      return phien.thoiGianHoanThanh.year == homNay.year &&
          phien.thoiGianHoanThanh.month == homNay.month &&
          phien.thoiGianHoanThanh.day == homNay.day;
    }).toList();

    int soPhienHomNay = phienHomNay.length;

    int tongPhutHomNay =
        phienHomNay.fold(0, (sum, phien) => sum + phien.thoiLuongPhut);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thống kê'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Số phiên hôm nay: $soPhienHomNay',
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            Text(
              'Tổng thời gian: $tongPhutHomNay phút',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}