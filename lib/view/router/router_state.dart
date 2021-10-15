class RouterState {
  static Map<int, List<String>> _state = new Map();
  static Map<int, Map<String, dynamic>> _argument =
      new Map<int, Map<String, dynamic>>();

  static pushArgument(int nestedId, String routeName, dynamic argument) {
    _argument[nestedId] = {"$routeName": argument};
  }

  static getArgument(int nestedId, String routeName) {
    try {
      return _argument[nestedId][routeName] ?? null;
    } catch (e) {
      return null;
    }
  }

  static push(int nestedId, String routeName) {
    if (_state[nestedId] == null) {
      _state[nestedId] = List<String>();
    }
    print("RouterState push :-${routeName} ");
    _state[nestedId].add(routeName);
  }

  static String getCurrentState(int nestedId) {
    return _state[nestedId]?.last;
  }

  static List<String> getRouteList(int nestedId) {
    return _state[nestedId] ?? new List<String>();
  }

  static pop(int nestedId) {
    if (_state[nestedId] == null) return;
    if (_state[nestedId]?.length == 0) return;
    _state[nestedId]?.removeLast();
  }
}
