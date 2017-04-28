typedef struct tHuman{
    int age;
    int (*birthday) (struct tHuman * this);
}Human;

void grow(Human * human){
    human->age++;
}

Human Daniel = {53, grow};



printf('Hej age: %i ', 15);

