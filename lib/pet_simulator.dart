class Pet {
  String name;
  int hunger;
  int happines;
  int friendship;
  int exp;

  Pet(this.name)
    : hunger = 5, //semakin banyak semakin lapar
      happines = 5, //semakin banyak semakin happy
      friendship = 0, //level friendship
      exp = 0;

  void _gainExp(int amount) {
    exp += amount;
    if (exp > 10) {
      exp -= 10;
      friendship++;
      print(
        '💖 level persahabatanmu dengan $name meningkat menjadi $friendship!',
      );
    }
  }

  void feed() {
    if (hunger > 0) hunger--;
    happines += 1;
    if (happines > 100) happines = 100;
    print('$name sudah makan dan kelihatan senang!');
    _gainExp(3);
  }

  void play() {
    if (happines < 100) happines += 2;
    hunger += 1;
    if (hunger > 100) hunger = 100;
    print('$name bermain dengan senang tetapi sepertinay $name lapar ...');
    _gainExp(4);
  }

  void sleep() {
    hunger += 1;
    happines += 1;
    if (happines > 10) happines = 10;
    if (hunger > 10) hunger = 10;
    print('$name tidur dengan nyenyak tetapi mungkin ia sedikit lapar');
    _gainExp(2);
  }

  void showStatus() {
    print('\n==== status $name ====');
    print('Level Persahabatan: $friendship | exp: $exp');
    print('Kenyang: ${10 - hunger}/100');
    print('Kebahagiaan: $happines/100');
    if (hunger >= 9) print('$name sangat lapar!');
    if (happines <= 2) print('$name kelihatan sedih ...');
    print('========================');
  }

  bool isAlive() {
    if (hunger >= 10) {
      print('$name terlalu lapar dan pingsan!');
      return false;
    } else {
      return true;
    }
  }
}
