// 7plusArguements
package main;


type person struct {
    age int;
    next *(type person);
};


func main(){
    var x, y type person;
    y.age = 20;
    x.next = &y;
    print (*(x.next)).age;
};
