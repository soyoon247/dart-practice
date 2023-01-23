void main() {
  // List<> nums = [1,2,3];
  var nums = [1, 2, 3, 4]; // 가능하면 var를 사용한다. // 쉼표로 마무리하면 vscode 에서 저절로 정렬된다.
  // nums.add("asdf"); // 타입이 달라 안된다.

  // collection if, collection for 을 지원한다.
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];

  print(numbers); // [1,2,3,4,5]

  // String interpolation(text에 변수를 추가하는 방법)
  var name = 'soyoon';
  var greeting = 'Hi, my name is $name, nice to meet you!';
  print(greeting);
  // 이건 변수가 이미 존재할 때
  // 계산을 할 떄는 달라진다.
  var age = 30;
  greeting += " and I'm ${age - 2}";
  // python에서 greeting = f"hi, my name is {name} and i'm {age + 2}"
  print(greeting);

  // collection for
  var oldFriends = ['mark', 'andy'];
  var newFriends = [
    'nico',
    'jerry',
    for (var friend in oldFriends) "love $friend"
  ];
  print(newFriends);

  // Map
  var player = {
    'name': 'soyoon',
    'xp': 19.99,
    'superpower': false,
  }; // 컴파일러가 타입을 유추해준다.
  // (Object = any in typescript)

  Map<int, bool> player2 = {1: true, 2: false};
  Map<List<int>, bool> player3 = {
    [1, 1]: true,
    [1, 2]: false
  };

  List<int> key = [1, 1];
  print(player3[key]);

  // api 응답으로 받은 데이터의 경우 Map 보다 class 를 추천.

  // Set
  var numbers2 = {1, 2, 3, 4};
  Set<int> numbers3 = {1, 2, 3, 4};
  numbers2.add(1);
  print(numbers2);
  // Set는 모든 요소가 유니크하다.(= tuple in python)

  // get value by key in Map with list key
  Map<List<int>, bool> testMap = {
    [1, 1]: true,
    [1, 2]: false
  };
  print(testMap[[1, 1]]); // null

  var listKey = [1, 1];
  print(testMap[listKey]); // null

  Map<List<int>, bool> testMap2 = {
    listKey: true,
    [1, 2]: false,
  };

  var shallowCopyListKey = listKey;
  var deepCopyListKey = [...listKey];

  print(testMap2[listKey]); // true
  print(testMap2[[1, 1]]); // null
  print(testMap2[shallowCopyListKey]); // true
  print(testMap2[deepCopyListKey]); // null

  print(listKey.hashCode); // 238828251
  print(shallowCopyListKey.hashCode); // 238828251
  print(deepCopyListKey.hashCode); // 681785049
}
