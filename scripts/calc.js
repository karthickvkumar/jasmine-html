Calculator = function() {
    this.value = 0;
};

Calculator.prototype.add = function(number) {
    if (typeof(number) == "number") {
        this.value += number;
    } else {
        alert("Argument must be a number");
    }
};

Calculator.prototype.addition = function(numOne, numTwo) {
    if (typeof(numOne) == "number" && typeof(numTwo) == "number") {
        return numOne + numTwo;
    } else {
        return "Error!";
    }
};


function addition(numOne, numTwo) {
    if (typeof(numOne) == "number" && typeof(numTwo) == "number") {
        return numOne + numTwo;
    } else {
        return "Error!";
    }
}