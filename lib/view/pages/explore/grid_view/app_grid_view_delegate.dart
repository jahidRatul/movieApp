import '../../../custom/grid_view/flutter_spanablegrid.dart';

class AppGridViewDelegate extends SpanableSliverGridDelegate {
  AppGridViewDelegate(
    this.crossAxisCount, {
    this.secondCrossAxisCount = 1,
    this.secondChildParIndex ,
    this.crossAxisSpacing = 10.0,
    this.mainAxisSpacing = 10.0,
    this.firstChildHeight = 100,
    this.secondChildHeight = 160,
  }) : super(
          crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        );

  double mainAxisSpacing, crossAxisSpacing;
  double firstChildHeight, secondChildHeight;
  int crossAxisCount = 3;
  int secondCrossAxisCount;
  int secondChildParIndex;

  @override
  int getCrossAxisSpan(int index) {
    if (index < 3) return 1;
    if (index == 3) return crossAxisCount;
    //if (index == 10) return crossAxisCount;

    if (secondChildParIndex != null) {
      if ((index-10) % secondChildParIndex == 0)
        return crossAxisCount;
    }
    return 1;
  }

  @override
  double getMainAxisExtent(int index) {
    if (index < 3) return firstChildHeight;

    if (secondChildParIndex != null) {
     /* if (index % secondChildParIndex == 0)
        return secondChildHeight;*/
      if ((index-10) % secondChildParIndex == 0)
        return secondChildHeight;
    }
    return firstChildHeight;
  }
}
