import 'dart:async';

void main() {
	var source = """
		Lorem ipsum dolor sit amet, 
		consectetur adipisicing elit. 
		Dolore, mollitia, amet repellat 
		pariatur maxime praesentium dicta 
		qui quas aliquid minus tempore 
		possimus molestiae saepe alias 
		a quibusdam reprehenderit obcaecati.
	""".split(" ").iterator;

	var data = new StreamController();

	var stream = data.stream;

	stream.listen((e){
		print(e);
	});

	var timer = new Timer.periodic(new Duration(seconds: 1), (timer){
		if(source.moveNext()) {
			data.add(source.current.trim());

		} else {
			timer.cancel();			
		}
	});
}