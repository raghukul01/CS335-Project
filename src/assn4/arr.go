package main;

func cubeArr() [10]int {
    var a [10]int;
    for i := 0;i < 10;i++ {
        a[i] = i*i*i;
    };
    return a;
};

func main(){
    b := cubeArr();
    for i := 0;i < 10;i++ {
        print b[i];
    };
};
