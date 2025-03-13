# Quadratic Equation Solver in Bash
This script is designed to solve quadratic equations of the form:
> ax^2 + bx + c = 0

in the set of real numbers (from 0 to 2 solutions).

## TODO
- Add handling a=0
- Add handling non-numeric coefficients

## Requirements
- Installed Bash interpreter
- Installed `bc` utility for floating point calculations

## Installation
1. Download or copy the quadratic_solver.sh file
2. Give the file execution rights:
`chmod +x quadratic_solver.sh`

## Run
- In interactive mode:
  1. Run the script in the terminal:
`./quadratic_solver.sh`
  2. Enter the coefficients a, b and c separated by a space and press Enter.
  3. The script will calculate the roots of the equation (if they exist) and output the result to the console.
- In non-interactive (file) mode:
  1. Create file `input.txt` with the coefficients a, b and c separated by a space.
  2. Run the script in the terminal with parameter `-f`.
  3. The script will calculate the roots of the equation (if they exist) and output the result to the console.


## Example of work
``` bash
$ ./quadratic_solver.sh
Enter coefficients a, b and c:
1 -3 2
Two roots: x1 = 2, x2 = 1
```
## Error handling
- If a = 0, the script will return an error, since the equation will no longer be quadratic.
- If the discriminant is negative, the script will report that there are no real roots.

## License
This project is distributed under the MIT license. You can freely use this software if you defeat the author in rapid chess (1 party, control 30 seconds, no time addition)
