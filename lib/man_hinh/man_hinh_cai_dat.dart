import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManHinhCaiDat extends StatefulWidget {
  const ManHinhCaiDat({super.key});

  @override
  State<ManHinhCaiDat> createState() => _ManHinhCaiDatState();
}

class _ManHinhCaiDatState extends State<ManHinhCaiDat> {
  final _tapTrungController = TextEditingController();
  final _nghiNganController = TextEditingController();
  final _nghiDaiController = TextEditingController();
  final _chuKyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taiCaiDat();
  }

  Future<void> _taiCaiDat() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _tapTrungController.text = (prefs.getInt('thoiGianTapTrungPhut') ?? 25)
          .toString();
      _nghiNganController.text = (prefs.getInt('thoiGianNghiNganPhut') ?? 5)
          .toString();
      _nghiDaiController.text = (prefs.getInt('thoiGianNghiDaiPhut') ?? 15)
          .toString();
      _chuKyController.text = (prefs.getInt('chuKyNghiDai') ?? 4).toString();
    });
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt Pomodoro'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cấu hình thời gian (Phút)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Thời gian tập trung',
              _tapTrungController,
              Icons.center_focus_strong,
            ),
            _buildTextField(
              'Thời gian nghỉ ngắn',
              _nghiNganController,
              Icons.local_cafe,
            ),
            _buildTextField(
              'Thời gian nghỉ dài',
              _nghiDaiController,
              Icons.weekend,
            ),
            const Divider(height: 32),
            const Text(
              'Chu kỳ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Số phiên để nghỉ dài',
              _chuKyController,
              Icons.loop,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chưa có chức năng lưu')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blueGrey[900],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Lưu cài đặt',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
