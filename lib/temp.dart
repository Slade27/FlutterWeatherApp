import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Temp extends StatelessWidget {
  final FaIcon icon;
  final String title;
  final String info;
  
  Temp(this.icon,this.title,this.info);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon,
        title: Text(
          title,
        ),
        trailing: Text(
            info
        ),
      ),
    );
  }
}

