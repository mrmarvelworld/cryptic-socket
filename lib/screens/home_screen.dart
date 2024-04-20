import 'package:crypto_realtime/widgets/crypto_pair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List pairs = [
      'btcusdt',
      'ethusdt',
      'bnbusdt',
      'solusdt',
      'dogeusdt',
      'enausdt',
      'xrpusdt',
      'nearusdt',
      'linkusdt',
      'bchusdt',
      'maticusdt',
      'ltcusdt',
      'filusdt'
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          greetings(),
          SizedBox(height: 10),
          BalanceCard(),
          SizedBox(height: 10),
          Fav(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return CryptoPair(
                pair: pairs[index],
              );
            },
            itemCount: pairs.length,
          ))
        ],
      )),
    );
  }
}

class Fav extends StatelessWidget {
  const Fav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Text(
            'Fav Assets',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Edit List',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Portfolio Balance',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w200),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$12,756.34',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_right_sharp,
                        color: Colors.white70,
                      ),
                      Text(
                        '1.52%',
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(children: <Widget>[
                        Icon(
                          CupertinoIcons.bitcoin,
                          color: Colors.grey.shade700,
                        ),
                        Text(
                          'sell crypto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey.shade300),
                        )
                      ]),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.sort_outlined,
                          color: Colors.grey.shade700,
                        ),
                        Text(
                          'buy crypto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey.shade300),
                        )
                      ]),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Icon(
                          CupertinoIcons.doc_chart,
                          color: Colors.grey.shade700,
                        ),
                        Text(
                          'Analytics',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey.shade300),
                        )
                      ]),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Icon(
                          CupertinoIcons.gift,
                          color: Colors.grey.shade700,
                        ),
                        Text(
                          'Gift',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey.shade300),
                        )
                      ]),
                    )
                  ]),
            )
          ]),
    );
  }
}

class greetings extends StatelessWidget {
  const greetings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Hi Marvel',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        color: Colors.grey.shade700)),
                Text(
                  'Welcome to CryticSocket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_active,
                  size: 30,
                ))
          ]),
    );
  }
}
