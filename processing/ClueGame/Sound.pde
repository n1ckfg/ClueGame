import ddf.minim.*;

Minim minim;
String soundPath = "sounds";

//SOUNDS~~~~~~~~~~~~~~~~~
//foreground sounds
ddf.minim.AudioPlayer fgSplat;

//background sounds
ddf.minim.AudioPlayer bgMusic;

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

void stopSound(ddf.minim.AudioSnippet _a){
  _a.pause();
}

void stopSound(ddf.minim.AudioPlayer _a){
  _a.pause();
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void playSound(ddf.minim.AudioSnippet _a){
  _a.rewind();
  _a.play();
}

void playSound(ddf.minim.AudioPlayer _a){
  _a.play(0);
}

void playSound(ddf.minim.AudioPlayer _a, boolean _l){
  if(_l){
    _a.loop();
  }else{
    _a.play(0);
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void closeSound(ddf.minim.AudioSnippet _a){
  try{
    _a.close();
  }catch(Exception e){ }
}

void closeSound(ddf.minim.AudioPlayer _a){
  try{
    _a.close();
  }catch(Exception e){ }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
