# dart-practice
[강의 링크](https://nomadcoders.co/dart-for-beginners)
![image](https://user-images.githubusercontent.com/78311649/212245535-77d063fc-7b69-4f54-aa22-cd0f1d05536e.png)

## 0. INTRODUCTION

### Why dart?
1. 거의 모든 곳에 작동가능하도록 컴파일할 수 있다.
  - dart 는 2개의 컴파일러가 있다.
    - dart web : dart -> js
    - dart native : dart -> cpu 아키텍쳐 (ARM32, ARM64, X86_64 등등)  
    - 사물인터넷까지 가능

2. 어떻게 컴파일 ? JIT, AOT 모두 가능
  - AOT(ahead-of-time) : 컴파일을 먼저 하고, 결과인 바이너리를 배포한다.  
    - ex) C++ 로 코딩한다 -> 끝나고 아키텍처를 지정해 줘야 함. windows 로 배포하고 싶으면 windows 바이너리(기계어)로 컴파일해야함.  
    - 단점 : 시간이 오래 걸린다 -> 뭔가를 변경한 거에 대한 결과를 보고 싶으면 컴파일해야 한다? ui 개발할 때 불편함.  
    - 그래서, 개발할 때는 JIT 컴파일러가 필요함.
  - JIT(just-in-time) : dart VM 을 사용하여 코드의 결과를 바로 화면에 보여준다.  
    - 가상 머신에서 작동하는 거라 약간 느리지만, 개발 중에만 사용하는 거라 괜찮다.  
    - 그리고 개발 후, 실제 배포할 때는 AOT 컴파일러를 사용한다. (가상머신이 아니라 기계어를 실행하니까 앱이 빨리 돌아간다)
  - 그래서 dart는 개발하기에도, 배포하기에도 좋은 언어!

3. null safety
  - [dart 문서](https://dart.dev/null-safety/understanding-null-safety)
  - [번역](https://medium.com/flutter-korea/flutter%EC%9D%98-null-safety-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-dd4ee1f7d6a5)


4. dart, flutter 둘 다 구글이 만들었다.  
  - flutter를 위해서 dart 를 수정할 수 있다. (React 팀은 js가 맘에 안 들어도 수정할 수 없지만...)

### dart 배우기

[다트패드](https://dartpad.dev/) 에서 설치없이 dart 사용 가능


***

## 1. VARIABLES
- main 함수는 모든 dart 프로그램의 Entry point 이다. 여기서 코드를 호출. 이름 바꾸면 실행되지 않음. 
- 세미콜론이 없으면 에러 (dart 에서는 일부러 안 쓸 때도 있기 때문에 포매터 등이 자동으로 붙여주지 않는다.)

- 변수 선언 
  - var 를 사용한다.(권장)
    - 변수를 선언할 때 var 키워드를 사용하면 자료형을 명시해주지 않아도 dart 가 알아서 추정한다.
    - 하지만 새로운 값을 대입할 때에는 자료형이 일치해야 한다.
    - 함수나 메소드 내부에 지역 변수를 선언할 때 사용
  - 자료형을 같이 써준다.
    - class에서 변수나 property 를 선언할 때 사용

  ```
  void main() {
    var name = 'tube';
    name = 'neo';
  }

  void main(){
    String name = 'tube';
    name = 'neo';
  }
  ```
  
  - Dynamic Type  
  자료형을 알기 어려울 때, 정말 필요할 때만 쓰기!
  ```
  void main(){
    var name; // dynamic name;
    if(name is String){
    ...
    }
  }
  
  ```
  
- null safety
  - 개발자가 null 값을 참조할 수 없게 한다. 
  - 컴파일러가 null 참조하는 케이스를 잡지 못해서 런타임 에러가 날 수 있는데, 이런 상황이 발생하지 않도록 한다.
  ```
  void main() {
    String? name = null; // nullable 한 변수임을 표시하기 위해 ? 를 붙여준다. 
    if(name.length == 1){
    
    } // 이런 거 쓰면 에러. null 이니까!
    name = 'neo';
    if(name != null){
      print(name.isNotEmpty); // true
    } 
    
    print(name?.isNotEmpty); // 이렇게도 작성 가능
  }
  ```
  
- final (한 번만 할당 가능)
  ```
  final name = 'tube';
  name = 'neo'; // 에러
  ```
  
- late
  - 초기 데이터 없이 변수를 선언할 수 있게 해 준다.
  ```
  late final String name;
  // do sth; go to api and so on....
  print(name) // null safety 라서 에러
  name = 'tube';
  name = 12; // final 이니까 에러.
  ```

- const (이게 따로 있다니? final 이 아니야?) : compile-time constant 를 만들어준다. 
  - 수정될 수 없음. (final과 같음)
  - compile-time 에 알고 있는 값이어야 한다. (앱스토어에 올리기 전에 이미 알고 있어야 한다. 사용자가 입력하는 값, api에서 받아오는 값 이런 건 안 된다.)
  ```
  const APIKey = "ADFDFAFD";
  final APIKey = fetchApi(); // 컴파일 시점에 모르므로 const 로 쓸 수 없음. 
  const max_allowd_price = 120; // 이런 건 가능.
  ```


