```jac
"""An AI-Powered Calculator in JAC"""

import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

walker Calculator {
    has num1: float;
    has num2: float;
    has operator: str;

    can start with `root entry;
    can compute with calc entry;
}

node calc {
    has result: str;

    # Perform calculation
    can do_calculation;
}

"""Explain the calculation using AI"""
def explain_calculation(num1: float, num2: float, operator: str, result: str) -> str by llm();

can Calculator.do_calculation {
    if operator == "+" {
        result = (num1 + num2) as str;
    }
    elif operator == "-" {
        result = (num1 - num2) as str;
    }
    elif operator == "*" {
        result = (num1 * num2) as str;
    }
    elif operator == "/" {
        if num2 == 0 {
            result = "Error: Division by zero";
        }
        else {
            result = (num1 / num2) as str;
        }
    }
    elif operator == "^" {
        result = (num1 ** num2) as str;
    }
    elif operator == "%" {
        result = (num1 % num2) as str;
    }
    elif operator == "sqrt" {
        if num1 < 0 {
            result = "Error: Negative root";
        }
        else {
            result = (num1 ** 0.5) as str;
        }
    }
    else {
        result = "Invalid operator";
    }

    std.out("Result: " + result);

    # Call the AI to explain
    let explanation = explain_calculation(num1, num2, operator, result);
    std.out("AI Explanation: " + explanation);
}

# CLI entry
with entry:__main__ {
    root spawn Calculator(10, 5, "+");     # Example: addition
    root spawn Calculator(10, 5, "-");     # Example: subtraction
    root spawn Calculator(10, 5, "*");     # Example: multiplication
    root spawn Calculator(10, 5, "/");     # Example: division
    root spawn Calculator(2, 3, "^");      # Example: power
    root spawn Calculator(10, 3, "%");     # Example: modulo
    root spawn Calculator(9, 0, "sqrt");   # Example: square root
}
```
