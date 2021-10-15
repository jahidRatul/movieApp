import '../../../custom/grid_view/flutter_spanablegrid.dart';

class NineChildGridViewDelegate extends SpanableSliverGridDelegate {
  NineChildGridViewDelegate(
    this.crossAxisCount, {
    this.secondCrossAxisCount = 1,
    this.secondChildParIndex,
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
    if (index == 0) return 1;
    if (secondChildParIndex != null) {
      if ((index + 1) % (secondChildParIndex + 0) == 0) return crossAxisCount;
    }
    return 1;
  }

  @override
  double getMainAxisExtent(int index) {
    if (index == 0) return firstChildHeight;
    if (secondChildParIndex != null) {
      if ((index + 1) % (secondChildParIndex + 0) == 0)
        return secondChildHeight;
    }
    return firstChildHeight;
  }
}
