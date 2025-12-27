function addnumbers(a:number, b:number) :number {
return a+b;
}
const addnumbersarrow = (a:number, b:number):string =>{
    return `${a+b}`;
}

function multiply(firstnumber:number,secondnumber?:number,base:number = 2){
    return firstnumber*base;

}

// const result:number=addnumbers(1,2);
// const result2:string=addnumbersarrow(1,2);
// const multiplyresult:number=multiply(5);
// console.log({result,result2,multiplyresult})



interface Character {
    name :string;
    hp: number;
    showhp: () => void;
}

const HealCharacter = (character:Character, amount:number) =>{
    character.hp+=amount;
}

const strider:Character={
    name: 'strider',
    hp: 50,
    showhp(){
        console.log(`puntos de vida ${this.hp}`)
    }
}

HealCharacter(strider,50);
strider.showhp();

export{}