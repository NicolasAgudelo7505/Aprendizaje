import { type Product, } from './06-function-destructuring';
import {taxCalculation} from './06-function-destructuring'
const shoppingCart:Product[] =[{
    description:'Xiaomi',
    price:300
},
{
    description:'motorola',
    price:120,
}];

// const TaxCalculationOptions2:TaxCalculationOptions[]=[{
//     tax:0.15,
//     products:shoppingCart
// }]

const [total,taxTotal] =taxCalculation({
    products:shoppingCart,
    tax:0.15
});
console.log('total: ',total);
console.log('tax: ',taxTotal);