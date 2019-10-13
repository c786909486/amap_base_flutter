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

class DrawRectangleScreen extends StatefulWidget {
  DrawRectangleScreen();

  factory DrawRectangleScreen.forDesignTime() => DrawRectangleScreen();

  @override
  _DrawRectangleScreenState createState() => _DrawRectangleScreenState();
}

class _DrawRectangleScreenState extends State<DrawRectangleScreen> {
  AMapController _controller;
  List<LatLng> latLngs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制矩形'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:Stack(
        children: <Widget>[
          AMapView(
            onAMapViewCreated: (controller){
              _controller = controller;
              _controller.mapClickedEvent.listen((latLng) async {
                if(latLngs.length<4){
                  latLngs.add(latLng);
                  await _controller.addCircle(CirclePolyOptions(center: latLng,radius: 100));
                  await _controller.addMarker(MarkerOptions(position: latLng,displayLevel: 16));
                  if(latLngs.length==4){
                    await _controller.addRectangle(RectangleOptions(
                        latLngs: latLngs
                    ));
                  }
                }
                print("latLngs长度：${latLngs.length}");
              });
              _controller.setZoomLevel(16);
            },
            amapOptions: AMapOptions(),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              color: Colors.white,
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.refresh),
                onPressed: (){
                  latLngs.clear();
                  _controller.clearMap();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
