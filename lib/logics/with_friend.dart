class WithFrndLogic {
  int isWin(int x, List<int> y) {
    if (y[0] == x && y[1] == x && y[2] == x) {
      return x;
    } else if (y[3] == x && y[4] == x && y[5] == x) {
      return x;
    } else if (y[6] == x && y[7] == x && y[8] == x) {
      return x;
    } else if (y[0] == x && y[4] == x && y[8] == x) {
      return x;
    } else if (y[6] == x && y[4] == x && y[2] == x) {
      return x;
    } else if (y[0] == x && y[3] == x && y[6] == x) {
      return x;
    } else if (y[1] == x && y[4] == x && y[7] == x) {
      return x;
    } else if (y[2] == x && y[5] == x && y[8] == x) {
      return x;
    }

    return 0;
  }
}
