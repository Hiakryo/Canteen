import 'package:flutter_app/Components/Views/tenant2.dart';
import 'package:flutter_app/Components/Views/tenants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample>
    with WidgetsBindingObserver {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    controller?.resumeCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                            onPressed: () => setState(() {
                                  controller?.toggleFlash();
                                }),
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                            onPressed: () => setState(() {
                                  controller?.flipCamera();
                                }),
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data)}');
                                } else {
                                  return Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {
                            controller?.pauseCamera();
                          },
                          child: Text('pause', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {
                            controller?.resumeCamera();
                          },
                          child: Text('resume', style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result.code == "sekolahA") {
          controller?.pauseCamera();
          result = null;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Tenants2Screen(
                      tenants: tenantA,
                    )),
          ).then((value) => setState(() {}));
        } else if (result.code == "sekolahB") {
          controller?.pauseCamera();
          result = null;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Tenants2Screen(
                      tenants: tenantB,
                    )),
          ).then((value) => setState(() {}));
        } else if (result.code == "sekolahC") {
          controller?.pauseCamera();
          result = null;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Tenants2Screen(
                      tenants: tenantC,
                    )),
          ).then((value) => setState(() {}));
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        controller?.resumeCamera();
      });
    } else if (state == AppLifecycleState.inactive) {
      setState(() {
        controller?.resumeCamera();
      });
    } else if (state == AppLifecycleState.paused) {
      setState(() {
        controller?.resumeCamera();
      });
    }
  }

  List<Tenant> tenantA = <Tenant>[
    Tenant.withItems("WARUNG BU SITI A", "descA", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        99999999,
        'Assets/promo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        100,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("WARUNG BU SUKIMAH A", "descB", 'Assets/promo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        90000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        10000,
        'Assets/promo.png',
      ),
      Item(
        "itemC",
        "descItemC",
        30000,
        'Assets/promo.png',
      ),
      Item(
        "itemD",
        "descItemD",
        70000,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("WARUNG PAK KARYO A", "descC", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        20000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        70000,
        'Assets/promo.png',
      ),
      Item(
        "itemA",
        "descItemA",
        40000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        50000,
        'Assets/promo.png',
      ),
    ]),
  ];

  List<Tenant> tenantB = <Tenant>[
    Tenant.withItems("WARUNG BU SITI B", "descA", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        99999999,
        'Assets/promo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        100,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("WARUNG BU SUKIMAH B", "descB", 'Assets/promo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        90000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        10000,
        'Assets/promo.png',
      ),
      Item(
        "itemC",
        "descItemC",
        30000,
        'Assets/promo.png',
      ),
      Item(
        "itemD",
        "descItemD",
        70000,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("WARUNG PAK KARYO B", "descC", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        20000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        70000,
        'Assets/promo.png',
      ),
      Item(
        "itemA",
        "descItemA",
        40000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        50000,
        'Assets/promo.png',
      ),
    ]),
  ];

  List<Tenant> tenantC = <Tenant>[
    Tenant.withItems("WARUNG BU SITI C", "descA", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        99999999,
        'Assets/promo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        100,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("WARUNG BU SUKIMAH C", "descB", 'Assets/promo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        90000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        10000,
        'Assets/promo.png',
      ),
      Item(
        "itemC",
        "descItemC",
        30000,
        'Assets/promo.png',
      ),
      Item(
        "itemD",
        "descItemD",
        70000,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("WARUNG PAK KARYO C", "descC", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        20000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        70000,
        'Assets/promo.png',
      ),
      Item(
        "itemA",
        "descItemA",
        40000,
        'Assets/logo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        50000,
        'Assets/promo.png',
      ),
    ]),
  ];
}
