
export interface Product {
    description:string;
    price:number;
}
// const phone:Product ={
//     description: "pocoX7pro",
//     price: 1250000
// }

// const Pc:Product ={
//     description: "Lenovo yoga 7 series",
//     price: 3200000
// }

export interface TaxCalculationOptions{
    tax:number;
    products:Product[]
}
// function taxCalculation (options:TaxCalculationOptions):[number, number] {
// function taxCalculation ( {tax,products}:TaxCalculationOptions):[number, number] {
export function taxCalculation (options:TaxCalculationOptions):[number, number] {
    const {tax,products}=options
    let total=0;

    products.forEach( ({price}) => {
        total+= price;
    });
    return [total,total*tax];
}

// const shppingCart=[phone,Pc];
// const tax=0.15;

// const [total, totalTax] = taxCalculation({
//     tax:tax,
//     products:shppingCart
// })

// console.log('total: ', total)
// console.log('tax: ', totalTax)

export{}