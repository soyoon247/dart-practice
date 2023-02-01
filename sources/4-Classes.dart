class Player1 {
  late String name; // use late!
  late int xp;

  void sayHello() {
    print("Hi my name is $name"); // 메소드 내에 같은 변수가 있는 게 아닌 이상 this 를 쓰지 말라고 권고
  }
}

class Player2 {
  String name; // use late!
  int xp, age; // 한 줄에 선언 가능
  String team;

  // int age;

  // Player(this.name, this.xp, this.team, this.age); // positional argument 많아지면 헷갈림
  // named constructor parameter
  Player2(
      {required this.name, // 기본값을 주거나, required 를 사용한다.
      required this.xp,
      required this.team,
      required this.age});

  // named constructor 는 다르다
  // 사용자로부터 선택적으로 값을 받고, 어떤 값은 기본값으로 사용하도록 하는 생성자
  // 클래스를 초기화하는 새로운 메소드, 생성자임.. 콜론을 사용한다
  Player2.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 0;

  Player2.createRedPlayer(String name, int age) // positional 은 모두 required
      : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = 0;

  void sayHello() {
    print("Hi my name is $name"); // 메소드 내에 같은 변수가 있는 게 아닌 이상 this 를 쓰지 말라고 권고
  }
}

class Player3 {
  final String name;
  int xp;
  String team;

  // fromJson 이라는 named constructor 를 만든다.
  Player3.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson["name"],
        xp = playerJson["xp"],
        team = playerJson["team"];

  void sayHello() {
    print("Hi my name is $name"); // 메소드 내에 같은 변수가 있는 게 아닌 이상 this 를 쓰지 말라고 권고
  }
}

enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Player4 {
  String name;
  XPLevel xp;
  Team team;

  Player4(this.name, this.xp, this.team);
}

abstract class Human2 {
  void
      walk(); // {} 도 안 쓴다. 메소드의 이름과 반환 타입만 정의. 상속받는 모든 클래스가 가지고 있어야 하는 메소드를 알려준다.
}

class Player5 extends Human2 {
  // walk 가 없으면 에러
  // implement walk method
  void walk() {
    print('im walking');
  }
}

class Coach extends Human2 {
  void walk() {
    print('the coach is walking');
  }
}

class Human {
  final String name;

  Human(this.name);

  // Human({required this.name}); named argument 로 쓰면 아래서는 super(name: name) 으로 넣어주면 된다.

  void sayHello() {
    print('Hi my name is $name');
  }
}

enum Team2 { blue, red }

class Player6 extends Human {
  final Team2 team;

  // named argument constructor
  Player6({
    required this.team,
    required String name,
  }) : super(name);

// }) : super(name: name);

  @override
  void sayHello() {
    // TODO: implement sayHello
    super.sayHello();
    print('and I play for ${team.name}'); // team 만 쓰면 Team2.blue 라고 나온다.
  }
}

void main() {
  var player = Player1();
  player.name = "nico";
  print(player.name); // 아무도 바꾸지 못하게 하려면? final 을 추가한다.
  player.sayHello();

  // Constructors
  var player2 = Player2(
    name: "nico",
    xp: 1500,
    team: "red",
    age: 12,
  ); // 이렇게 하고 싶다!
  // player2.name = "soyoon"; //  안되고 xp는 된다.
  player2.xp = 2000;
  // player2.sayHello();

  var bluePlayer = Player2.createBluePlayer(
    name: 'tube',
    age: 21,
  );

  var redPlayer = Player2.createRedPlayer("nico", 23);

  var apiData = [
    {"name": "nico", "team": "red", "xp": 0},
    {"name": "soyoon", "team": "blue", "xp": 0},
    {"name": "tube", "team": "blue", "xp": 0},
  ];

  apiData.forEach((playerJson) {
    var player = Player3.fromJson(playerJson);
    player.sayHello();
  });

  // var tube = Player2(name: "nico", xp: 1200, team: "red", age: 30);
  // tube.name = 'las';
  // tube.xp = 204444;
  // tube.team = "blue";

  // cascade operator 를 사용하면

  var tube = Player2(name: "nico", xp: 1200, team: "red", age: 30)
    ..name = 'las' // ..은 앞의 생성자를 통해 만들어진 객체 tube를 가리킨다.
    ..xp = 204444
    ..team = "blue";
  //

  var potato = tube
    ..name = "potato" // 이렇게 해도 바로 앞에 있는 객체를 사용..
    ..sayHello();

  // Enum은 실수를 줄여준다. 오타.. redddd, felx.... flutter 에서 많이 사용된다.
  // Color.red 이런 식의 enum 을 많이 사용하게 될 것.
  var player4 = Player4("soyoon", XPLevel.medium, Team.red)
    ..team = Team.blue
    ..xp = XPLevel.pro;

  // abstract class : 객체를 생성하지 않는다.

  var player6 = Player6(team: Team2.blue, name: "nicocococococo");
  player6.sayHello();

  var player7 = Player7(team: Team3.red);
  player7.runQuick();
}

class Strong {
  final double strengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("runnnnnnnnnn!");
  }
}

enum Team3 { blue, red }

// mixin은 생성자가 없는 클래스, 클래스에 프로퍼티들을 추가할 때 사용. with 를 사용한다.
// 다른 클래스의 프로퍼티와 메소드를 긁어오는 것. 상속받을 필요가 없음.
class Player7 with Strong, QuickRunner {
  final Team3 team;

  Player7({
    required this.team,
  });
}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}
