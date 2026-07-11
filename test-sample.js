const greeting = "Hello, world!";
const numbers = [3, 1, 4, 1, 5, 9, 2, 6];

function sumNumbers(list) {
	return list.reduce((total, current) => total + current, 0);
}

console.log(greeting);
console.log("Sum:", sumNumbers(numbers));
