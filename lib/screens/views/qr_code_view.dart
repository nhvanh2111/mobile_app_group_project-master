import 'package:flutter/material.dart';
import 'package:mobile_app_group_project/config.dart';
import 'package:mobile_app_group_project/screens/models/user.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({Key? key}) : super(key: key);

  @override
  _QRCodeViewState createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  @override
  Widget build(BuildContext context) {
    int userId = Provider.of<UserProvider>(context).id;
    var qrData = "------------/$userId";
    return Scaffold(
      appBar: AppBar(
        // title: Text('Insert Image Demo'),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset("assets/icons/Back Icon.svg"),
        // ),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: defaultPadding * 2),
            Text(
              'Phu Quoc Gift',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Gordita',
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: defaultPadding),
            Text(
              'Scan the code to enter the website',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gordita',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: defaultPadding * 2),
            Container(
              height: 300,
              width: 300,
              child: QrImage(
                data: qrData,
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
            SizedBox(height: defaultPadding),
            Text(
              qrData,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Gordita',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.copy),
                      color: kPrimaryColor,
                      iconSize: 35,
                    ),
                    Text(
                      'Copy',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontFamily: 'Gordita',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: defaultPadding * 4),
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.download),
                      color: kPrimaryColor,
                      iconSize: 35,
                    ),
                    Text(
                      'Download',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontFamily: 'Gordita',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
