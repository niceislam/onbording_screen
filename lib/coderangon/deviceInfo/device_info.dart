import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key});

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Device Info", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          FutureBuilder(
            future: deviceInfo.androidInfo,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                AndroidDeviceInfo info = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      Text("${info.brand}"),
                      Text("${info.version}"),
                      Text("${info.model}"),
                      Text("${info.id}"),
                      Text("${info.version.sdkInt}"),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
