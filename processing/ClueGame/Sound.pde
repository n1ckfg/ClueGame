import ddf.minim.*;

Minim minim;
String soundPath = "sounds";

//SOUNDS~~~~~~~~~~~~~~~~~
//foreground sounds
AudioPlayer fgSplat;

//background sounds
AudioPlayer bgMusic;

//~~~~~~~~~~~~~~~~~~~~~~~

void soundSetup(){
  minim = new Minim(this);
  //foreground
  fgSplat = minim.loadFile("sounds/splat.wav");
  //background
  bgMusic = minim.loadFile("sounds/march.mp3");
}

void soundStop(){
  try{
     minim.stop();
    //--
    //foreground
    closeSound(fgSplat);
    //background
    closeSound(bgMusic);
    //--
  }catch(Exception e){ }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void stopSound(AudioSnippet _a){
  _a.pause();
}

void stopSound(AudioPlayer _a){
  _a.pause();
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void playSound(AudioSnippet _a){
  _a.rewind();
  _a.play();
}

void playSound(AudioPlayer _a){
  _a.play(0);
}

void playSound(AudioPlayer _a, boolean _l){
  if(_l){
    _a.loop();
  }else{
    _a.play(0);
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void closeSound(AudioSnippet _a){
  try{
    _a.close();
  }catch(Exception e){ }
}

void closeSound(AudioPlayer _a){
  try{
    _a.close();
  }catch(Exception e){ }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
