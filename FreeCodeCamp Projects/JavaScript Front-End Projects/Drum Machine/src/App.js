import React from "react";
import {useState} from "react";
import './App.css';

function App() {

  var soundList = [{
    keyCode: 81,
    keyTrigger: "Q",
    id: "Heater-1",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-1.mp3"
}, {
    keyCode: 87,
    keyTrigger: "W",
    id: "Heater-2",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-2.mp3"
}, {
    keyCode: 69,
    keyTrigger: "E",
    id: "Heater-3",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-3.mp3"
}, {
    keyCode: 65,
    keyTrigger: "A",
    id: "Heater-4",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-4_1.mp3"
}, {
    keyCode: 83,
    keyTrigger: "S",
    id: "Clap",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-6.mp3"
}, {
    keyCode: 68,
    keyTrigger: "D",
    id: "Open-HH",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Dsc_Oh.mp3"
}, {
    keyCode: 90,
    keyTrigger: "Z",
    id: "Kick-n'-Hat",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Kick_n_Hat.mp3"
}, {
    keyCode: 88,
    keyTrigger: "X",
    id: "Kick",
    url: "https://s3.amazonaws.com/freecodecamp/drums/RP4_KICK_1.mp3"
}, {
    keyCode: 67,
    keyTrigger: "C",
    id: "Closed-HH",
    url: "https://s3.amazonaws.com/freecodecamp/drums/Cev_H2.mp3"
}]

const playSound0 =()=> {
  document.getElementById("Q").play();
  setDisplay("Piano-1")
}

const playSound1 =()=> {
  document.getElementById("W").play();
  setDisplay("Piano-2")
}
const playSound2 =()=> {
  document.getElementById("E").play();
  setDisplay("Piano-3")
}
const playSound3 =()=> {
  document.getElementById("A").play();
  setDisplay("Heater")
}
const playSound4 =()=> {
  document.getElementById("S").play();
  setDisplay("Clap")
}
const playSound5 =()=> {
  document.getElementById("D").play();
  setDisplay("Cymbal")
}
const playSound6=()=> {
  document.getElementById("Z").play();
  setDisplay("Sticks-1")
}
const playSound7 =()=> {
  document.getElementById("X").play();
  setDisplay("Sticks-2")
}
const playSound8=()=> {
  document.getElementById("C").play();
  setDisplay("Cymbal Short")
}
const [display,setDisplay] = useState("default");
window.addEventListener('keydown', function (event) {
  if(event.key.toUpperCase()=="Q") {playSound0()}
  if(event.key.toUpperCase()=="W") {playSound1()}
  if(event.key.toUpperCase()=="E") {playSound2()}
  if(event.key.toUpperCase()=="A") {playSound3()}
  if(event.key.toUpperCase()=="S") {playSound4()}
  if(event.key.toUpperCase()=="D") {playSound5()}
  if(event.key.toUpperCase()=="Z") {playSound6()}
  if(event.key.toUpperCase()=="X") {playSound7()}
  if(event.key.toUpperCase()=="C") {playSound8()}
})


  return (    
    <div id="drum-machine"><i class="inner-logo fa fa-free-code-camp" style={{float:"right", fontSize:"24px"}}> </i>
    <table>
    <tr>
    <td><button className="drum-pad" id="sound0" onClick={playSound0} type="button">Q<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Chord_1.mp3" id="Q" preload="auto"></audio></button></td>
    <td><button className="drum-pad" id="sound1" onClick={playSound1} type="button">W<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Chord_2.mp3" id="W"></audio></button></td>
    <td><button className="drum-pad" id="sound2" onClick={playSound2} type="button">E<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Chord_3.mp3" id="E"></audio></button></td>
    </tr>
    <tr>
    <td><button className="drum-pad" id="sound3" onClick={playSound3} type="button">A<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Heater-4_1.mp3" id="A"></audio></button></td>
    <td><button className="drum-pad" id="sound4" onClick={playSound4} type="button">S<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Heater-6.mp3" id="S"></audio></button></td>
    <td><button className="drum-pad" id="sound5" onClick={playSound5} type="button">D<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Dsc_Oh.mp3" id="D"></audio></button></td>
    <td id="display">
        <h3 style={{backgroundColor:"grey", width:"200px", height:"65px", marginLeft:"30px",marginTop:"15px"}}>Display:<h4 style={{marginTop:"0"}}>{display}</h4></h3>
      </td>
    </tr>
    <tr>
    <td><button className="drum-pad" id="sound6" onClick={playSound6} type="button">Z<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Kick_n_Hat.mp3" id="Z"></audio></button></td>
    <td><button className="drum-pad" id="sound7" onClick={playSound7} type="button">X<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/RP4_KICK_1.mp3" id="X"></audio></button></td>
    <td><button className="drum-pad" id="sound8" onClick={playSound8} type="button">C<audio className="clip" src="https://s3.amazonaws.com/freecodecamp/drums/Cev_H2.mp3" id="C"></audio></button></td>
    </tr>




    </table>




    </div>
  );
}

export default App;
