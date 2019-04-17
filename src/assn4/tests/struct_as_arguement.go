// StructAsArguement

package main;

type person struct {
	name int;
	age  int;
};

func person_check(a type person) int {
	if a.age > 0 {
		return 1;
	};
	return -1;
};

func main(){
	var p type person;
	p.name = 10;
	p.age = 100;
	print person_check(p);
};
