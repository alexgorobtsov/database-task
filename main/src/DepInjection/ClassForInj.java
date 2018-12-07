package DepInjection;

class Injectable {

    void print() {
        System.out.println("inj");
    }
}

public class ClassForInj {

    private Injectable object = null;


    public static void main(String[] args) {
        ClassForInj classForInj = new ClassForInj();
        Injector.inject(classForInj, new Injectable());
        classForInj.object.print();
    }
}