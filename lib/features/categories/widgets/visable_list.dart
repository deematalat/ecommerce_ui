import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisableListOfItem extends StatelessWidget {
  const VisableListOfItem({Key? key, required this.isVisable}) : super(key: key);
   final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: isVisable,
      child:ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child:Container(
              width:double.maxFinite,
              child:Text("Category"),
            ),
          );
        },

      ),
    );
  }
}
