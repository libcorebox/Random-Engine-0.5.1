package;

class Ratings {

	public static var reRatingStuff:Array<Dynamic> = [
                ['F', 0.2], // From 0% to 19%
                ['F+', 0.4], // From 20% to 39%
                ['C', 0.5], // From 40% to 49%
                ['C+', 0.6], // From 50% to 59%
                ['B', 0.69], // From 60% to 68%
                ['B+', 0.7], // 69%
                ['A', 0.8], // From 70% to 79%
                ['A+', 0.9], // From 80% to 89%
                ['S', 1], // From 90% to 99%
                ['P', 1] // The value on this one isn't used 
        ];

	public static var peRatingStuff:Array<Dynamic> = [
		['You Suck!', 0.2], //From 0% to 19%
		['Shit', 0.4], //From 20% to 39%
		['Bad', 0.5], //From 40% to 49%
		['Bruh', 0.6], //From 50% to 59%
		['Meh', 0.69], //From 60% to 68%
		['Nice', 0.7], //69%
		['Good', 0.8], //From 70% to 79%
		['Great', 0.9], //From 80% to 89%
		['Sick!', 1], //From 90% to 99%
		['Perfect!!', 1] //The value on this one isn't used
	];

	public static var keRatingStuff:Array<Dynamic> = [
		["D", 0.401], // 40%
		["C", 0.6], // 59%
		["C", 0.7], // 69%
		["B", 0.8], // 79%
		["A", 0.86], // 85%
		["A.", 0.9], // 89%
		["A:", 0.96], // 95%
		["AA", 0.976], // 97.5%
		["AA.", 0.981], // 98%
		["AA:", 0.986], // 98.5%
		["AAA", 0.991], // 99%
		["AAA.", 0.9936], // 99.35%
		["AAA:", 0.9959], // 99.58%
		["AAAA", 0.998], // 99.79%
		["AAAA.", 0.9989], // 99.88%
		["AAAA:", 0.9999], // 99.97%
		["AAAAA", 1] // 99.99%
	];
}
