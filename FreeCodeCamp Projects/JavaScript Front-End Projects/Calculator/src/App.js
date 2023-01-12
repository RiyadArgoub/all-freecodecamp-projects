import './App.css';
import React from "react";
import {useState} from "react";

function App() {

const [subResult,setSubResult] = useState("0");

const [result,setResult] = useState("0");

let resultMid=[...result];
let evaluation=0;

const calculate=()=> {
  if(result=="0") {setResult(()=>subResult)}
  else if(subResult=="0"&&(result[result.length-1]!="*"&&result[result.length-1]!="/")) {setSubResult(()=>"0")}
  else {setResult(()=>result+subResult)};
  setSubResult(()=>"0");
  console.log(result);
  if(subResult!="0"){
  resultMid=[...result,...subResult].toString().replace(/,/ig,"");
  console.log(resultMid);
  evaluation=eval(resultMid);
  console.log(evaluation);
  setResult(()=>""+evaluation)
  }
}

const addDecimal = ()=> {
  if(subResult.length===0) {setSubResult((a)=>"0.")}
  else if(subResult.match(/\./)) {setSubResult((a)=>a)}
  else {setSubResult((a)=>a+".")}
  } 

const addOperation = (sign)=> {
  if(sign=="-" &&(subResult[0]=="+"||subResult[0]=="/"||subResult[0]=="*")) {setResult(()=>result+sign);setSubResult(sign);resultMid=[...result,...subResult].toString().replace(/,/ig,"")}
  else if((resultMid[resultMid.length-1]=="+"||resultMid[resultMid.length-1]=="-"||resultMid[resultMid.length-1]=="*"||resultMid[resultMid.length-1]=="/")&&(subResult=="+"||subResult=="-"||subResult=="*"||subResult=="/")) {
    if((resultMid[resultMid.length-2]=="+"||resultMid[resultMid.length-2]=="-"||resultMid[resultMid.length-2]=="*"||resultMid[resultMid.length-2]=="/")) {resultMid=resultMid.slice(0,-2)+sign;setResult(()=>resultMid);setSubResult(()=>sign)}
    else{resultMid[resultMid.length-1]=sign;setResult(resultMid);setSubResult(sign)}
  }
  else{
    if(result=="0") {setResult((a)=>subResult+sign);resultMid=[...result,...subResult].toString().replace(/,/ig,"");setSubResult(()=>sign)}
    else if(subResult=="0") {setResult((a)=>result+sign);setSubResult(()=>sign);resultMid=[...result,...subResult].toString().replace(/,/ig,"")}
    else {setResult((a)=>result+subResult+sign);setSubResult(()=>sign);resultMid=[...result,...subResult].toString().replace(/,/ig,"")}
  }
}

const clearAll = ()=> {
  setSubResult("0");
  setResult("0");
  resultMid=[...result,...subResult].toString().replace(/,/ig,"")
}

function addNumber(num) {
  if(subResult=="0") {setSubResult(()=>num)}
  else if(subResult=="+"||subResult=="-"||subResult=="*"||subResult=="/") {setSubResult(()=>num)}
  else {setSubResult((a)=>a+num)}
}


  return (
    <div>
      <table>
        <tr><td id="display" colSpan={4}>{result}</td></tr>
        <tr><td id="input" colSpan={4}>{subResult}</td></tr>
        <tr>
          <td id="clear" onClick={clearAll} colSpan={2}>AC</td>
          <td id="divide" onClick={()=>addOperation("/")} className="operations">/</td>
          <td id="multiply" onClick={()=>addOperation("*")} className="operations">X</td>
        </tr>
        <tr>
          <td id="seven" onClick={()=>addNumber("7")} className="numbers">7</td>
          <td id="eight" onClick={()=>addNumber("8")} className="numbers">8</td>
          <td id="nine" onClick={()=>addNumber("9")} className="numbers">9</td>
          <td id="subtract" onClick={()=>addOperation("-")} className="operations">-</td>
        </tr>
        <tr>
          <td id="four" onClick={()=>addNumber("4")} className="numbers">4</td>
          <td id="five" onClick={()=>addNumber("5")}className="numbers">5</td>
          <td id="six" onClick={()=>addNumber("6")} className="numbers">6</td>
          <td id="add" onClick={()=>addOperation("+")} className="operations">+</td>
        </tr>
        <tr>
          <td id="one" onClick={()=>addNumber("1")} className="numbers">1</td>
          <td id="two" onClick={()=>addNumber("2")} className="numbers">2</td>
          <td id="three" onClick={()=>addNumber("3")} className="numbers">3</td>
          <td id="equals" onClick={calculate} rowSpan={2}>=</td>
        </tr>
        <tr>
          <td id="zero" onClick={()=>addNumber("0")} colSpan={2} className="numbers">0</td>
          <td id="decimal" onClick={addDecimal} className="numbers">.</td>
        </tr>
      </table>
      <h3 style={{textAlign:'center'}}>by <a href="www.riyadargoub.com">Riyad Argoub</a></h3>
    </div>
  );
}

export default App;
