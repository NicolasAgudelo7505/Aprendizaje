export class Person {
    public firstName: string;
    public lastName:string
    private address: string;
    constructor(firstName:string,lastName:string,address:string = 'No address'){
        this.firstName=firstName;
        this.lastName=lastName
        this.address=address;

    }
}

// export class Hero extends Person{
//     public alterEgo:string;
//     public age:number;
//     public realName:string;

//     constructor (alterEgo:string,age:number,realName:string){
//         super(realName,'NY')
//         this.alterEgo=alterEgo;
//         this.age=age;
//         this.realName=realName;
//     }
// }

export class Hero {
    public alterEgo:string;
    public age:number;
    public realName:string;
    public person:Person;

    constructor (alterEgo:string,age:number,realName:string,person:Person){
        this.alterEgo=alterEgo;
        this.age=age;
        this.realName=realName;
        this.person=person
    }
}

const tony =new Person('Tony','Stark','NY')
const ironman= new Hero('ironman',40,'Tony',tony);
console.log(ironman)
