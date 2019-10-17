import 'package:amap_base/amap_base.dart';
import 'package:amap_base_example/utils/misc.dart';
import 'package:amap_base_example/utils/view.dart';
import 'package:flutter/material.dart';


const polylineList = const [
  LatLng(39.999391, 116.135972),
  LatLng(39.898323, 116.057694),
  LatLng(39.900430, 116.265061),
  LatLng(39.955192, 116.140092),
];

class DrawCircleScreen extends StatefulWidget {
  DrawCircleScreen();

  factory DrawCircleScreen.forDesignTime() => DrawCircleScreen();

  @override
  _DrawCircleScreenState createState() => _DrawCircleScreenState();
}

class _DrawCircleScreenState extends State<DrawCircleScreen> {
  AMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制圆'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: AMapView(
        onAMapViewCreated: (controller) async {
          _controller = controller;
          _controller.mapClickedEvent.listen((latLng) async {
//            Scaffold.of(context)
//                .showSnackBar(SnackBar(content: Text(latLng.toString())));
            await _controller.addCircle(CirclePolyOptions(center: latLng,radius: 400));
//            await _controller.changeLatLng(latLng);
          });
          _controller.setZoomLevel(13);
          loading(
            context,
//
          controller.addCircle(CirclePolyOptions(
              center: await controller.getCenterLatlng(),
              radius:400,
            fillColor: Colors.blue
          ))
          ).catchError((e) => showError(context, e.toString()));
        },
        amapOptions: AMapOptions(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
