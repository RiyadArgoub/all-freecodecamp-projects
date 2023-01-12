import './App.css';
import React from "react";
import {useState,useEffect,useCallback} from "react";

function App() {

const [breakTime,setBreakTime] = useState(5);
const [sessionTime,setSessionTime] = useState(25);
const [time,setTime] = useState(25*60);
const [paused,setPaused] = useState(true);
const [position,setPosition] = useState("Session");

const displayTime = (time) => {
  let minutes = Math.floor(time/60);
  let seconds = time % 60;
  return (
    (minutes<10 ? "0"+ minutes :minutes)+":"+
    (seconds<10 ? "0" + seconds:seconds)
  )
}

const breakTimeChange = (sign) => {
  if(paused==true) {
  if (breakTime===1 && sign===-1) {}
  else if (breakTime===60 && sign===1) {}
  else {setBreakTime(()=>breakTime+sign)
    
  if(position=="Break"){setTime(()=>60*(breakTime+sign))}}
}
}

const sessionTimeChange =(sign) => {
  if(paused==true) {
  if (sessionTime===1 && sign===-1) {}
  else if (sessionTime===60 && sign===1) {}
  else {setSessionTime(()=>sessionTime+sign)

  if(position=="Session"){setTime(()=>60*(sessionTime+sign))}}}
}

const startTimer = () => {

  if(paused==true) {
      let second=1000;
      let date= new Date().getTime();
      let nextDate= new Date().getTime() + second;
        setPaused(false)
      var interval = setInterval(()=> {
        date = new Date().getTime();
          if(date > nextDate) {
            setTime((a)=>{
              if(a==1) {
                document.getElementById("beep").play();
              }
              if(a<1){
                if(position=="Session"){
                  setPosition("Break");
                  setTime(60*breakTime)
                } else if(position=="Break") {
                  setPosition("Session");
                  setTime(60*sessionTime)
                }
              }
            return a-1})
            nextDate += second;
          }
      },30)
      localStorage.clear();
      localStorage.setItem("interval-id",interval)
    }

  else if(paused==false) {
    clearInterval(localStorage.getItem("interval-id"));
    setPaused(true);
  }
}

const resetTimer = () => {
  clearInterval(localStorage.getItem("interval-id"));
  setBreakTime(5);
  setSessionTime(25);
  setTime(60*25);
  displayTime(time)
  setPosition("Session");
  setPaused(true)
  document.getElementById("beep").pause();
  document.getElementById("beep").currentTime = 0;
}

  return (
    <div>
      <audio id="beep" src="https://raw.githubusercontent.com/freeCodeCamp/cdn/master/build/testable-projects-fcc/audio/BeepSound.wav"></audio>
      <table>
        <tr>
      <td colSpan={2}><h2>25 + 5 Clock</h2></td>
        </tr>
        <tr>
          <td id="break-label"><h3>Break Length</h3><div id="break-length"><a id="break-decrement" onClick={()=>breakTimeChange(-1)}><i className="fa fa-arrow-down arrow"/></a>{breakTime}<a id="break-increment" onClick={()=>breakTimeChange(1)}><i className="fa fa-arrow-up arrow"/></a></div></td>
          <td id="session-label"><h3>Session Length</h3><div id="session-length"><a id="session-decrement" onClick={()=>sessionTimeChange(-1)}><i className="fa fa-arrow-down arrow"/></a>{sessionTime}<a id="session-increment" onClick={()=>sessionTimeChange(1)}><i className="fa fa-arrow-up arrow"/></a></div></td>
        </tr>
        <tr>
          <td colSpan={2}><div id="timer-label"><h3>{position}</h3><h2 id="time-left">{displayTime(time)}</h2></div></td>
        </tr>
        <tr><td colSpan={2}><a id="start_stop" onClick={startTimer}><i class="fa fa-play"/> <i class="fa fa-pause"/></a> <a id="reset" onClick={resetTimer}><i class="fa fa-refresh"/></a></td></tr>
      </table>
      <h3>Coded and designed by <a href="www.riyadaragoub.com">Riyad Argoub</a></h3>
    </div>
  );
}

export default App;
