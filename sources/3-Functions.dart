// void 는 아무것도 리턴하지 않는다.
void sayHello(String name) {
  print("Hello $name nice to meet you!");
  // return "Hello $name nice to meet you!"; // 여기서 리턴하면 에러
}

String sayHello2(String name) {
  return "Hello $name nice to meet you!";
}

// fat arrow syntax, 곧바로 return 한줄밖에 없는 경우
String sayHello3(String name) => "Hello $name nice to meet you!";

num plus(num a, num b) => a + b;

// positional parameter (호출하는 쪽에서 각각의 순서를 알아야 하므로 좋지 않음)
String sayHelloWithPositionalParams(
  String name,
  int age,
  String country,
) {
  return "Hello $name, you are $age, and you come from $country";
}

// dart는 named parameter도 지원한다.
// 순서를 기억하지 않아도 돼서 좋음.
// {} 사용하는데 그냥 추가하면 null 이 들어올 수도 있다고 컴파일 에러.

// 1) Add an explicit non-'null' default value
String sayHello4({
  String name = "anonymous",
  int age = 30,
  String country = "mars",
}) {
  return "Hello $name, you are $age, and you come from $country";
}

// 2) Use Required modifier to make mandatory parameter
String sayHello5({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

// optional positional parameter
// positional을 사용하면서도 country 에 디폴트 값을 주고 싶다면?
String sayHello6(String name, int age, [String? country = "Korea"]) =>
    'Hello $name, you ar $age and you come from $country';

// 간단한 데이터 타입들의 alias를 만들어준다.
typedef ListOfInts = List<int>;
ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed; // not List, Iterable
  return reversed.toList();
}

typedef UserInfo = Map<String, String>;

String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
}
// 이렇게도 쓸 수 있지만.. class 를 사용해야..

void main() {
  sayHello("soyoon");
  print(sayHello2("soyoon"));
  print(sayHello3("soyoon"));
  print(sayHello4(
    age: 20,
    country: 'Korea',
    name: 'soyoon',
  ));
  print(sayHello4(
    country: 'Korea',
  ));
  print(sayHello5(
    age: 35,
    name: "tube",
    country: 'Japan',
  ));
  print(sayHello6("soyoon", 30));

  // QQ Operator
  // null 일 수도 아닐 수도 있다.
  // if 를 안 쓰면
  // String capitalizeName(String? name) =>
  //     name != null ? name.toUpperCase() : 'ANON';

  String capitalizeName(String? name) => name?.toUpperCase() ?? 'ANON';

  // left ?? right (좌항이 null 이면 우항을, null 이 아니면 좌항을 리턴한다.)

  capitalizeName('soyoon');
  capitalizeName(null);

  String? name;
  name ??= 'nico'; // null 이 아니라면 할당한다.
  name ??= "another";
  print(
      name); // nico with warning : The left operand can't be null, so the right operand is never executed. (실행될 일이 없기 때문에..)

  print(reverseListOfNumbers([1, 2, 3]));
}
