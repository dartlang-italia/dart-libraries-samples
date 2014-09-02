import 'dart:html';
import 'dart:web_audio';
import 'dart:async';
import 'dart:math' as Math;

void main() {
  // Creates a new AudioContext()
  var context = new AudioContext();

  // Creates an oscillator
  var vco = context.createOscillator();

  // Sets the frequency (440 Hz = A3)
  vco.frequency.value = 440;

  // Creates an amplifier (Gain Node)
  var vca = context.createGain();

  // Sets the gain value to 0
  vca.gain.value = 0;

  // Connects the oscillator to the amplifier
  vco.connectNode(vca);

  // Connects the amplifier to the destination node
  vca.connectNode(context.destination);

  // Starts playing. Notice that you won't be hearding any sound because gain
  // value at this point is still zero
  vco.start(0);

  // Sets and prepares values we will be relying on
  bool playing = false;
  Timer timerLoop;
  bool pulse = false;

  querySelector('#play').onClick.listen((e) {
    // Sets the gain value to 0 if playing is true, and viceversa
    vca.gain.value = playing ? 0 : 1;

    if (playing && pulse) {
      // If it's pulsing, then...
      vca.gain.value = 0; // ... it sets the gain value to zero
      if (timerLoop != null) {
        timerLoop.cancel(); // ... cancels the timer
        timerLoop = null;
        pulse = false; // ... set the `pulse` variable to false
      }
    }
    playing = !playing; // Toggles the state of playing
  });

  querySelector('#pulse').onClick.listen((e) {
    if (playing) {
      pulse = !pulse;
      if (pulse) {
        double counter = 20.3;
        new Timer.periodic(new Duration(milliseconds: 10), (t) {
          if (timerLoop == null) {
            timerLoop = t;
          }
          vca.gain.value = (Math.sin(counter) + 1) / 2;
          counter = counter + 0.1;
        });
      } else {
        if (timerLoop != null) {
          timerLoop.cancel();
          timerLoop = null;
          vca.gain.value = 1;
        }

      }
    }
  });
}
