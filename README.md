# NasaRovers

![branch badge](https://github.com/mcoul/nasa-rovers/actions/workflows/main.yml/badge.svg?branch=master)

## Installation

    $ bundle install

## Usage

Run `rake run` to enjoy the project, or `rake friendly_run` if it's your first time and want to know how to use the program.

Both commands `rake spec` and `rspec` can be used to run the tests.

The command `rake rubocop` can be used to run linter.

## License

This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Coding problem

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. A rover’s position and location is represented by a combination of x and y coordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation.

An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same Heading. Assume that the square directly North from (x, y) is (x, y+1).

### INPUT:

The first line of input is the upper-right coordinates of the plateau, the lower- left coordinates are assumed to be 0,0. The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation. Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

### OUTPUT:

The output for each rover should be its final coordinates and heading.

### EXAMPLE I/O:

Test Input:

```
5 5
1 2 N
L M L M L M L M M
3 3 E
M M R M M R M R R M
```

Expected Output:

```
1 3 N
5 1 E
```

# Solution approach

The problem was initially solved with a TDD approach, creating the necessary models and methods that would satisfy the written tests. Once the behavior of all the models met the expectations, the input parsing was developed, but this time without using TDD nor testing.

### State design pattern

The problematic of the different moves depending on the rover's current direction could be perfectly tackled using a state design pattern; this is a great alternative to putting lots of conditionals in the Rover model by encapsulating the behaviors within state objects (the 4 directions). One can simply change the state object in the Rover model to change its behavior.

- Context class: the Rover, which has an interface with the different moves that are affected by the current direction
- State 'abstract' class: Direction
- The different states of the state machine are derived classes of the Direction base class
- State-specific behavior is defined in the appropriate State derived classes
- A pointer to the current "state" is held in the Rover model; to change the direction, we change the current pointer

In this case, the State/Direction is not a Singleton, since each rover will have its own different direction.

This is how I drafted the state transitions for the cardinal points, in order to create the state pattern:

<img src="https://i.imgur.com/UGNxGH2.jpeg" width=70%>

### Command design pattern

This pattern was used mixed with the input parsing logic, so it was not 100% followed as it was with the state pattern, but it is very useful to delegate the different actions sent by the user.

It was very useful for encapsulating the different requests/actions in different classes, and having a more reusable code. It intends to decouple the user that executes the command from the command logic and this turns out in a much more understandable/readable code.

In this project, there are three main commands: move forward, turn left and turn right.

### Command line parsers

As mentioned above, the parsers were used in conjunction with the 3 main commands, to validate the input received before executing any command, and therefore catching exceptions and letting the user fix their mistake, instead of aborting the program.

Three parsers are defined: 'Create plateau', 'Deploy rover' and 'Move rover', each one of them handling the behavior of the different lines entered by the user.



## Test cases - Results

### Correctly working
<img src="https://user-images.githubusercontent.com/15703857/122919037-29540900-d336-11eb-91e2-b4567986bd9d.gif" width=60%>

In this case, 4 rovers are deployed and moved inside the plateau, with no problems. Any desired number of rovers can be deployed and moved, there is no restriction for this, since they are treated dynamically.

### Plateau size validations
<img src="https://user-images.githubusercontent.com/15703857/122918175-38868700-d335-11eb-8dca-f48e86e9214d.gif" width=60%>

For this line, exactly two integer values must be entered, separated by a space, to recognize the maximum x & y coordinates. A warning is shown if:
- The characters are not numeric
- The line is empty
- There are more than two values separated by spaces

Since it is just a warning, the program gives you the opportunity to enter the line again.

### Deployment validations
<img src="https://user-images.githubusercontent.com/15703857/122921086-79cc6600-d338-11eb-8b77-554bd7116dbe.gif" width=60%>

For this line, exactly two integer values must be entered, separated by a space, to recognize the initial x & y coordinates, plus a valid cardinal point at the end ('N', 'W', 'S', 'E'); both uppercase and lowercase values are accepted. A warning is shown if:
- The first two values are not numeric
- The line is empty
- There are more than three values separated by spaces
- The cardinal point is invalid
- The cardinal point is not placed at the end of the string

Since it is just a warning, the program gives you the opportunity to enter the line again.

### Movement validations
<img src="https://user-images.githubusercontent.com/15703857/122918186-39b7b400-d335-11eb-87f0-390376719546.gif" width=60%>

For this line, a string containing any combination of the three expected movement characters must be entered, separated by a space or all together, both are accepted. A warning is shown if:
- Any of the characters is not a valid command ('M', 'L', 'R')
- The line is empty

Since it is just a warning, the program gives you the opportunity to enter the line again.

Another warning for this part is "Out of bounds", that happens whenever a sequence of movements lead the rover to exit the plateau's limits. In this case, the program gives you the opportunity to enter the line again, returning the rover to its initial deployment position.

