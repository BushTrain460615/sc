package;

class NeverLag {
  var lag:Bool;
  var FPS:Float;
  override pubic function update(elapsed:Float){
    lag = true;
    FPS = 1;
  }
}
