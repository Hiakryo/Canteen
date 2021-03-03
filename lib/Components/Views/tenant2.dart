import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Views/menu.dart';
import 'package:flutter_app/Components/button.dart';
import 'package:flutter_app/Components/Views/menu.dart';
import 'package:flutter_app/Components/Views/tenants.dart';

class Tenants2Screen extends StatefulWidget {
  final List<Tenant> tenants;
  Tenants2Screen({Key key, @required this.tenants}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return Tenants2ScreenState();
  }
}

double imageItemSize = 100;

class Tenants2ScreenState extends State<Tenants2Screen>
    with AutomaticKeepAliveClientMixin<Tenants2Screen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Text(
                  "Tenants List",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: widget.tenants.length,
                itemBuilder: (BuildContext context, int index) {
                  // container tenant ke-index
                  return GestureDetector(
                    child: tenantRow(index),
                    onTap: () => {
                      // Navigator.pushNamed(context, "second", arguments: {"name" :
                      //   "Bijendra", "rollNo": 65210});
                      // },

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(
                            tenant: widget.tenants[index],
                          ),
                        ),
                      ),
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tenantRow(int index) {
    return Card(
      // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      // child :
      // ListTile(
      //   title: Text('test1'),
      // ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0),
                bottomLeft: const Radius.circular(12.0),
                bottomRight: const Radius.circular(12.0),
              ),
            ),
            child: TenantItemView(widget.tenants[index]),
          ),
        ],
      ),
    );
  }

  Widget TenantItemView(Tenant tenant) {
    print(tenant.getTenantItemImages());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 0),
            child: Text(
              '${tenant.name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: tenant.getTenantItemImages(),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
