var size = 14;
var moves = 0;

var red = "#ff0000";
var orange = "#ffa500";
var yellow = "#ffff00";
var green = "#00ff00";
var blue = "#0000ff";
var purple = "#800080";

function reset() {
	moves = 25;
	for (i = 1; i <= size; i++) {
		for (j = 1; j <= size; j++) {
			num = Math.ceil(Math.random()*6);
			if (num === 1) var color = red;
			else if (num === 2) var color = orange;
			else if (num === 3) var color = yellow;
			else if (num === 4) var color = green;
			else if (num === 5) var color = blue;
			else if (num === 6) var color = purple;
			getTableElement(i, j).css("background-color", color);
			getTableElement(i, j).attr("flooded", "no");
			if (i ===1 && j ===1) var firstColor = color;
		}
	}
	expand(firstColor, 1, 1);
	$("span").html(moves.toString());
}

function rules() {
	alert("Click a colored circle to change the color of the upper-left square \
		and all connected squares of the same color. The object of the game is \
		to fill the entire board with a single color.");
}

function flood(color) {
	if (moves > 0 && !win()) {
		for (i = 1; i <= size; i++) {
			for (j = 1; j <= size; j++) {
				if (getTableElement(i, j).attr("flooded") === "yes")
					expand(color, i, j);
			}
		}
		for (i = 1; i <= size; i++) {
			for (j = 1; j <= size; j++) {
				if (getTableElement(i, j).attr("flooded") === "yes")
					getTableElement(i, j).css("background-color", color);
			}
		}
		moves--;
		$("span").html(moves.toString());
		if (win())
			alert("You win!");
		else if (moves === 0)
			alert("You lose!");
	}
}

function expand(color, row, col) {
	getTableElement(row, col).attr("flooded", "yes");
	if (!(row < 1 || col+1 < 1 || row > size || col+1 > size) && 
		getTableElement(row, col+1).attr("flooded") === "no" && colorToHex(
			getTableElement(row, col+1).css("background-color")) == color)
		expand(color, row, col+1);
	if (!(row < 1 || col-1 < 1 || row > size || col-1 > size) && 
		getTableElement(row, col-1).attr("flooded") === "no" && colorToHex(
			getTableElement(row, col-1).css("background-color")) == color)
		expand(color, row, col-1);
	if (!(row+1 < 1 || col < 1 || row+1 > size || col > size) && 
		getTableElement(row+1, col).attr("flooded") === "no" && colorToHex(
			getTableElement(row+1, col).css("background-color")) == color)
		expand(color, row+1, col);
	if (!(row-1 < 1 || col < 1 || row-1 > size || col > size) && 
		getTableElement(row-1, col).attr("flooded") === "no" && colorToHex(
			getTableElement(row-1, col).css("background-color")) == color)
		expand(color, row-1, col);
}

function win() {
	for (i = 1; i <= size; i++) {
		for (j = 1; j <= size; j++) {
			if (getTableElement(i, j).attr("flooded") === "no") return false;
		}
	}
	return true;
}

function getTableElement(i, j) {
	return $("#main tr:nth-child(" + i.toString() +
		") td:nth-child(" + j.toString() + ")");
}

function colorToHex(color) {
	if (color.substr(0, 1) === '#') return color;
	var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(color);
	var red = parseInt(digits[2]);
	var green = parseInt(digits[3]);
	var blue = parseInt(digits[4]);
	var rgb = blue | (green << 8) | (red << 16);
	var almostThere = rgb.toString(16);
	while (almostThere.length < 6) {
		almostThere = '0' + almostThere;
	}
	return '#' + almostThere;
}