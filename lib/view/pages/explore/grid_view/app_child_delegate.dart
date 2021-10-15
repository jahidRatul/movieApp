import 'package:flutter/material.dart';

class AppChildDelegate extends SliverChildDelegate {
 // int childCount;
  int secondChildParIndex;
  List<Widget> children;
  Widget secondChild;

  AppChildDelegate(
   // this.childCount,
      {
    this.children,
    this.secondChild,
    this.secondChildParIndex,
  });

  @override
  Widget build(BuildContext context, int index) {
    if ((children?.length ?? 0) < index+1) return null;
   /* if (secondChildParIndex != null) {
      if (index % secondChildParIndex == 0) return secondChild;
    }*/
    return children[index];
  }

  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) => true;

  @override
  int get estimatedChildCount => children?.length ?? 0;
}
