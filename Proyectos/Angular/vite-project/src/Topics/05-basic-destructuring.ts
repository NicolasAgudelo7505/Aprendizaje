interface audioPlayer {
    audioVolume:number;
    songDuration:number;
    song:string;
    details:Details;
}
interface Details{
    author:string;
    year:number;
}
const audioplayer:audioPlayer = {
    audioVolume:50,
    songDuration:253,
    song:"505",
    details:{
        author:"Arctic Monkeys",
        year:2007
    }
}
const{song:song2, songDuration:duration2, details}=audioplayer;
const {author}=details

console.log('song: ', song2);
console.log('Duration: ', duration2);
console.log('author : ', author);

const [,,Trunks]:string[]=['goku','vegeta']


export{}