import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class CryptoPair extends StatefulWidget {
  final String pair;
  const CryptoPair({required this.pair, Key? key}) : super(key: key);

  @override
  State<CryptoPair> createState() => _CryptoPairState();
}

class _CryptoPairState extends State<CryptoPair> {
  late WebSocketChannel channel;
  String previousPrice = '0';
  String price = '0';
  String symbol = '';

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect(
        'wss://stream.binance.com:9443/ws/${widget.pair.toLowerCase()}@trade');
    streamListener();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void streamListener() {
    channel.stream.listen((event) {
      Map<String, dynamic> getData = jsonDecode(event);
      // print(getData);
      String newPrice = getData['p'].toString();
      setState(() {
        previousPrice = price;
        price = newPrice;
        symbol = getData['s'].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color priceColor = Colors.black;
    if (double.parse(previousPrice) < double.parse(price)) {
      priceColor = Colors.green;
    } else if (double.parse(previousPrice) > double.parse(price)) {
      priceColor = Colors.red;
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            symbol,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            '\$ ${double.parse(price).toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: priceColor,
            ),
          ),
        ],
      ),
    );
  }
}
