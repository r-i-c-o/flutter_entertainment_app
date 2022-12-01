import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';

import 'package:tarot/models/spread_info.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';

import 'package:tarot/screens/spread_info.dart';
import 'package:tarot/widgets/subscription_radios.dart';

class PayWall extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/paywall';
  final VoidCallback? onClose;
  final Function? onSuccessPurchase;
  final SpreadInfo? spreadInfo;
  final String fromScreen;

  const PayWall(
      {Key? key,
      this.onClose,
      this.spreadInfo,
      required this.fromScreen,
      this.onSuccessPurchase})
      : super(key: key);
  @override
  _PayWallState createState() =>
      _PayWallState();

  @override
  PlanetOffset? get planetOne => paywall_1;

  @override
  PlanetOffset? get planetTwo => paywall_2;

  @override
  String? get screenRouteName => routeName;
}

class _PayWallState extends State<PayWall> {
  final navHelper = provideNavHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  void onClose() {
    navHelper.onBackPressed();
  }

  @override
  void onSuccessPurchase() {
    if (widget.onSuccessPurchase != null) {
      Navigator.of(context).pop();
      widget.onSuccessPurchase!();
    } else
      widget.spreadInfo != null
          ? _navigateToSpread(widget.spreadInfo!)
          : widget.onClose ?? onClose();
  }

  void _navigateToSpread(SpreadInfo info) {
    Navigator.of(context).pushAndRemoveUntil(
      PlanetMaterialPageRoute(
        widget: SpreadInfoScreen(
          spread: info.spread,
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Restore purchases',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: widget.onClose ?? onClose,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Let's try",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "PREMIUM",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 50.0,
                      spreadRadius: -10.0,
                    )
                  ],
                ),
                child: Image.asset('assets/images/paywall_pic.png'),
              ),
            ),
          ),
          /*SubscriptionRadios(
            onBuy: buy,
            onChanged: setSubscription,
            subscriptionIndex: subscriptionIndex,
          ),*/
        ],
      ),
    );
  }
}
