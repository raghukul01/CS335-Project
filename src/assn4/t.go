package main;

type person struct {
    age int;
    name int;
};

func main(){
    var a [10](type person);
    for i := 0;i < 10;i++ {
        a[i].age = i;
        a[i].name = i*i;
    };
    for i := 0;i < 10;i++ {
        print a[i].age, a[i].name;
    };
};
