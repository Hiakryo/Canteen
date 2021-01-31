import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Views/tenants.dart';

class MenuScreen extends StatefulWidget {
  final Tenant tenant;
  MenuScreen({Key key, @required this.tenant}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MenuScreenState();
  }
}

class MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin<MenuScreen> {
  void increment(int index) {
    setState(() => {widget.tenant.items[index].quantity++});
  }

  Widget decrement(int index) {
    setState(() => {
        widget.tenant.items[index].quantity > 0
          ? widget.tenant.items[index].quantity--
          : null
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Tenant tenant = widget.tenant;
    List<Item> items = tenant.items;
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text(tenant.name)),
      body: SafeArea(
        child: Column(
          children: [
            tenant.image,
            Text(tenant.desc),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  // container item ke-index
                  Item item = items[index];
                  return Card(
                    child: Row(
                      children: [
                        item.image,
                        Expanded(
                          child: Column(
                            children: [
                              Text(item.name),
                              Text("${item.quantity}"),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      child: Text("-"),
                                      onPressed: () => decrement(index),
                                    ),
                                    ElevatedButton(
                                      child: Text("+"),
                                      onPressed: () => increment(index),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(tenant.desc),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
