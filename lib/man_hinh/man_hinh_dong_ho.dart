import 'package:flutter/material.dart';

class ManHinhDongHo extends StatefulWidget {
  const ManHinhDongHo({super.key});

  @override
  State<ManHinhDongHo> createState() => _ManHinhDongHoState();
}

class _ManHinhDongHoState extends State<ManHinhDongHo> {
  int giayConLai = 25 * 60; // 1500 giây = 25 phút
  bool dangChay = false;
  bool laPhienTapTrung = true;

  String layChuoiThoiGian() {
    int tongGiay = giayConLai;
    int gio = tongGiay ~/ 3600;
    int phut = (tongGiay % 3600) ~/ 60;
    int giay = tongGiay % 60;
    return '${gio.toString().padLeft(2, '0')}:${phut.toString().padLeft(2, '0')}:${giay.toString().padLeft(2, '0')}';
  }

  List<Color> layMauGradient() {
    if (dangChay) {
      return laPhienTapTrung
          ? [Colors.red[900]!, Colors.red[600]!]
          : [Colors.green[900]!, Colors.green[600]!];
    }
    return [Colors.blueGrey[900]!, Colors.blueGrey[700]!];
  }

  String layTrangThai() {
    if (dangChay) {
      return laPhienTapTrung ? 'Đang tập trung' : 'Đang nghỉ ngơi';
    }
    return 'Sẵn sàng bắt đầu';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: layMauGradient(),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon trạng thái nhỏ
                Icon(
                  laPhienTapTrung
                      ? Icons.center_focus_strong_rounded
                      : Icons.coffee_rounded,
                  size: 50,
                  color: Colors.white.withOpacity(0.85),
                ),
                const SizedBox(height: 16),

                // Vòng tròn thời gian với bóng nhẹ
                SizedBox(
                  width: 320,
                  height: 320,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Bóng nền nhẹ cho chiều sâu
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.35),
                              blurRadius: 25,
                              offset: const Offset(8, 8),
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.12),
                              blurRadius: 25,
                              offset: const Offset(-8, -8),
                            ),
                          ],
                        ),
                      ),
                      CircularProgressIndicator(
                        value: 0.0,
                        strokeWidth: 28,
                        backgroundColor: Colors.white.withOpacity(0.18),
                        color: Colors.white,
                      ),
                      Text(
                        layChuoiThoiGian(),
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 3,
                          shadows: [
                            Shadow(
                              blurRadius: 12,
                              color: Colors.black54,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Trạng thái với fade nhẹ
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 600),
                  child: Text(
                    layTrangThai(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white.withOpacity(0.92),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Nút điều khiển to hơn, bóng theo màu
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          dangChay = !dangChay;
                        });
                      },
                      icon: Icon(
                        dangChay
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 40,
                      ),
                      label: Text(
                        dangChay ? 'Tạm dừng' : 'Bắt đầu',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 22,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: dangChay
                            ? Colors.red[700]
                            : Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        elevation: 10,
                        shadowColor: dangChay
                            ? Colors.red.withOpacity(0.5)
                            : Colors.green.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 32),
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          giayConLai = 25 * 60;
                          dangChay = false;
                          laPhienTapTrung = true;
                        });
                      },
                      icon: const Icon(Icons.refresh_rounded, size: 36),
                      label: const Text(
                        'Đặt lại',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 22,
                        ),
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Đồng hồ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Thống kê',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Thông tin nhóm',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Sau này xử lý chuyển màn
        },
      ),
    );
  }
}
