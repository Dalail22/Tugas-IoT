import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

// Halaman Dashboard
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Smart Home Control"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, Dalail",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  "Room Temperature",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("20° Medium"),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: Text("Check"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Smart Home Control",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  DeviceCard(
                    "Smart AC",
                    "Temperature 25°",
                    Icons.ac_unit,
                    () {},
                  ),
                  DeviceCard("Smart TV", "Mitsubishi 294", Icons.tv, () {}),
                  DeviceCard("Smart Lamp", "Philips 203", Icons.lightbulb, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SmartLampControlPage(),
                      ),
                    );
                  }),
                  DeviceCard("Smart Door", "Lawang 234", Icons.lock, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  DeviceCard(this.title, this.subtitle, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// Halaman Kontrol Smart Lamp
class SmartLampControlPage extends StatefulWidget {
  @override
  _SmartLampControlPageState createState() => _SmartLampControlPageState();
}

class _SmartLampControlPageState extends State<SmartLampControlPage> {
  bool isLampOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("Smart Lamp"), backgroundColor: Colors.teal),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              size: 80,
              color: isLampOn ? Colors.amber : Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              isLampOn ? "Status: Menyala" : "Status: Mati",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text("Smart Lamp"),
              value: isLampOn,
              onChanged: (value) {
                setState(() {
                  isLampOn = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
