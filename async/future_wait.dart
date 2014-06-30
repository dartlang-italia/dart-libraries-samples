import 'dart:async';

void main() {
	Future.wait(
		[
			waitFor(new Duration(seconds: 5), 1),
			waitFor(new Duration(seconds: 1), 2),
			waitFor(new Duration(seconds: 2), 3)
		]
	)
	.then((List<String> result){
		result.forEach((String value){
			print(value);
		});
	});
}

Future<String> waitFor(Duration timeout, int order) {
	var completer = new Completer();

	var timer = new Timer(timeout, (){
		var now = new DateTime.now();
		completer.complete("$order: ${now.toString()}");
	});

	return completer.future;
}