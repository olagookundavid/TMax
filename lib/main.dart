// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print, unused_local_variable

void main() {
  num? age = 0;
  Person person1 = Person(age: 10);
  Person person2 = Person(age: 20);
  person1.increaseAge(5);
  person2.increaseAge(10);
}

/*
if(condition){
  logic;
}else if(condition){

}else if(condition){
  
}else{

}
*/

void agegetter(int value) {
  int age;
  age = value + 2;
}

class Person {
  Person({required this.age});
  int? age;

  void talk() {
    print('i am talking');
  }

  void walk() {
    print('i am walking');
  }

  increaseAge(int value) {
    print('former age was $age');
    age = age! + value;
    print('new age is $age');
  }
}
