import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Views/menu.dart';
import 'package:flutter_app/Components/button.dart';
import 'package:flutter_app/Components/Views/menu.dart';

class TenantsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TenantsScreenState();
  }
}

class Tenant {
  String name;
  String desc;
  Image image;
  List<Item> items;

  static double imageHeight = 100;
  static double imageWidth = imageHeight * 1.5;

  Tenant(this.name, this.desc, this.image) {
    this.items = new List<Item>();
  }

  Tenant.withItems(this.name, this.desc, String imageSource, this.items) {
    this.image =
        Image.asset(imageSource, height: imageHeight, width: imageWidth);
  }

  Widget getTenantItemImages() {
    List<Widget> result = new List<Widget>();
    for (Item item in this.items) {
      result.add(Card(child: item.image));
    }
    return new SingleChildScrollView(
      child: Row(children: result),
      scrollDirection: Axis.horizontal,
    );
  }

  void reset() {
    for (Item item in this.items) {
      item.init();
    }
  }
}

class Item {
  String name;
  String desc;
  double price;
  Image image;
  int quantity;

  static double imageHeight = 100;
  static double imageWidth = imageHeight * 1.8;

  Item(this.name, this.desc, this.price, String imageSource) {
    this.quantity = 0;
    this.image =
        Image.asset(imageSource, height: imageHeight, width: imageWidth);
  }

  void init() {
    this.quantity = 0;
  }
}

double imageItemSize = 100;

class TenantsScreenState extends State<TenantsScreen>
    with AutomaticKeepAliveClientMixin<TenantsScreen> {
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
                itemCount: tenants.length,
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
                            tenant: tenants[index],
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

  List<Tenant> tenants = <Tenant>[
    Tenant.withItems("tenantA", "descA", 'Assets/logo.png', <Item>[
      Item(
        "itemA",
        "descItemA",
        3330000,
        'Assets/promo.png',
      ),
      Item(
        "itemB",
        "descItemB",
        100,
        'Assets/logo.png',
      ),
    ]),
    Tenant.withItems("tenantB", "descB", 'Assets/promo.png', <Item>[
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
    Tenant.withItems("tenantC", "descC", 'Assets/logo.png', <Item>[
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
            child: TenantItemView(tenants[index]),
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
