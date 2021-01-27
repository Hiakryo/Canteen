import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Widgets/color.dart';
import 'package:flutter_app/Components/bottom_navigation_bar.dart';

class TenantsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TenantsScreenState();
  }
}

class Tenant {
  String name;
  String desc;
  List<Item> items;
  Tenant(this.name, this.desc) {
    this.items = new List<Item>();
  }
  Tenant.withItems(String name, String desc, List<Item> items) {
    this.name = name;
    this.desc = desc;
    this.items = items;
  }
}

class Item {
  String name;
  String desc;
  double price;
  Image image;
}

class TenantsScreenState extends State<TenantsScreen>
    with AutomaticKeepAliveClientMixin<TenantsScreen> {
  @override
  List<Tenant> tenants = <Tenant>[
    Tenant("TenantA", "descA"),
    Tenant("TenantB", "descB"),
    Tenant("TenantC", "descC"),
    Tenant("TenantD", "descD"),
  ];
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tenants.length,
            itemBuilder: (BuildContext context, int index) {
              // container tenant ke-index
              return tenantRow(index);
            }),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Widget tenantRow(int index) {
    return Card(
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child:
            // ListTile(
            //   title: Text('test1'),
            // ),
            Column(
      children: <Widget>[
        Container(
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0),
                bottomLeft: const Radius.circular(12.0),
                bottomRight: const Radius.circular(12.0),
              )),
          child: Column(
            children: <Widget>[
              Text('${tenants[index].name}'),
              Text('${tenants[index].desc}'),
            ],
          ),
        )
      ],
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
