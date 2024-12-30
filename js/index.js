const num1 = [1, 2, 3, 4];
const num2 = [5, 6, 7, 8, 9];

const numbers = [...num1, ...num2];
console.log(numbers);

const numberCopy = numbers.map((number) => number * 2);
console.log(numberCopy);
