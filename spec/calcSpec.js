describe("Calculator", function() {
    describe("Addition function", function() {
        it("should return 42", function() {
            expect(addition(20, 22)).toBe(42);
        });

        it("should return 26", function() {
            expect(addition(7, 19)).toBe(26);
        });
        
        xit("should return an error if we don't supply two numbers", function() {
            spyOn(window, "alert");
            addition("Hitchhikers", "Guide")
            expect(window.alert).toHaveBeenCalledWith("Error!");
        });
    });
});

Calculator = function() {
    this.value = 0;
};

/*Calculator.prototype.add = function(number) {
    if (typeof(number) == "number") {
        this.value += number;
    } else {
        alert("Argument must be a number");
    }
};*/
