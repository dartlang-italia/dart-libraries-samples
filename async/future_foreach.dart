import 'dart:async';

void main() {
	var items = 
	[
		new Duration(seconds: 5),
		new Duration(seconds: 1),
		new Duration(seconds: 2)
	];

	Future.forEach(
		items, (element){
			waitFor(
				element, 
				items.indexOf(element)
			).then((value) => print(value));
		}
	)
	.then((_) => print("start..."));
}

Future<String> waitFor(Duration timeout, int order) {
	var completer = new Completer();

	var timer = new Timer(timeout, (){
		var now = new DateTime.now();
		completer.complete("$order: ${now.toString()}");
	});

	return completer.future;
}