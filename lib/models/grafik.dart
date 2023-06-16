import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Grafik extends StatefulWidget {
  const Grafik({Key? key}) : super(key: key);

  @override
  State<Grafik> createState() => _GrafikState();
}

class _GrafikState extends State<Grafik> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("Ocak", 10),
      Sales("Şubat", 30),
      Sales("Mart", 50),
      Sales("Nisan", 7),
      Sales("Mayıs", 2),
      Sales("Haziran", 5),
      Sales("Temmuz", 20),
      Sales("Ağustos", 50),
      Sales("Eylül", 5),
      Sales("Ekim", 40),
      Sales("Kasım", 5),
      Sales("Aralık", 35),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Alışveriş Sütun Grafiği",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.transparent,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return Opacity(
                  opacity: _animation.value,
                  child: SizedBox(
                    height: 400,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        ColumnSeries<Sales, String>(
                          dataSource: data,
                          xValueMapper: (Sales sales, _) => sales.month,
                          yValueMapper: (Sales sales, _) => sales.sold,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                          ),
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Text(
              "Alışveriş Pasta Grafiği",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.transparent,
            ),
            SizedBox(
              height: 400,
              child: SfCircularChart(
                series: <CircularSeries>[
                  PieSeries<Sales, String>(
                    dataSource: data,
                    xValueMapper: (Sales sales, _) => sales.month,
                    yValueMapper: (Sales sales, _) => sales.sold,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sales {
  final String month;
  final int sold;

  Sales(this.month, this.sold);
}
