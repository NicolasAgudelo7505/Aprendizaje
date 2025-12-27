const skills:string[]=['Bash', 'Counter', 'Healing']
skills;
interface character{
    name:string;
    hp:number;
    skills:string[];
    hometown?:string;
}
const strider: character = {
    name: "Strider",
    hp: 75,
    skills: ['Bash','Counter'],
};

strider.hometown='Albuquerque';
export{};