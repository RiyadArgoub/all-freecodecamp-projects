import React, {useState,useEffect} from "react";
document.getElementById("root");

const App = () => {
    let quoteList=["We cannot solve problems with the kind of thinking we employed when we came up with them.",
    "Learn as if you will live forever, live like you will die tomorrow.",
    "Stay away from those people who try to disparage your ambitions. Small minds will always do that, but great minds will give you a feeling that you can become great too.",
    "When you give joy to other people, you get more joy in return. You should give a good thought to happiness that you can give out.",
    "When you change your thoughts, remember to also change your world.",
    "It is only when we take chances, when our lives improve. The initial and the most difficult risk that we need to take is to become honest.",
    "Nature has given us all the pieces required to achieve exceptional wellness and health, but has left it to us to put these pieces together."]
    
    let authorList=["Albert Einstein","Mahatma Gandhi","Mark Twain","Eleanor Roosevelt","Norman Vincent Peale","Walter Anderson","Diane McLaren"]
    
    let colorList=["rgb(119, 177, 169)","rgb(22, 160, 133)","rgb(119, 177, 169)","rgb(231, 76, 60)","rgb(39, 174, 96)","rgb(44, 62, 80)","rgb(155, 89, 182)"]

    let position=Math.floor(Math.random()*quoteList.length)
    
    const [counter,setCounter] = useState(Math.floor(Math.random()*quoteList.length));

    useEffect(() => { document.body.style.backgroundColor = colorList[counter]}, [counter]);
    useEffect(() => {  }, [counter]);

    return (<>
    <table id="quote-box" style={{width:"490px", transitionDuration: "0.4s", height:"250px", border:"35px solid black", backgroundColor:"black", marginLeft:"auto", marginRight:"auto", marginTop:"200px", marginUp:"auto", top:"-200px"}}>
        <tr>
            <th style={{color:colorList[counter], fontFamily: 'Raleway', fontSize:"32px", transitionDuration: "0.4s"}} id="text"><i className="fa fa-quote-left"></i> {quoteList[counter]}</th>
        </tr>

        <tr>
        <td id="author" style={{textAlign:"right", color:colorList[counter], transitionDuration: "0.4s", fontFamily: 'Raleway', fontSize:"18px"}}>
            -{authorList[counter]} 
        </td>
        </tr>
        <td>
        <a id="tweet-quote" href={"https://www.twitter.com/intent/tweet/?hashtags=quotes&related=freecodecamp&text=\""+quoteList[counter].replace(/\s/ig,"%20")+"\"%20"+authorList[counter].replace(/\s/ig,"%20")}  title="Tweet this quote!"><button style={{backgroundColor:colorList[counter], borderRadius:"10px", transitionDuration: "0.4s", marginRight:"20px",width:"50px", height:"50px", border:"none", cursor:"pointer"}}><i className="bi bi-twitter" style={{color:"white", fontSize:"18px"}}></i></button></a>  
            <a href={"https://www.tumblr.com/widgets/share/tool?posttype=quote&tags=quotes,freecodecamp&caption="+authorList[counter].replace(/\s/ig,"%20")+"&content="+quoteList[counter].replace(/\s/ig,"%20")+"&canonicalUrl=https%3A%2F%2Fwww.tumblr.com%2Fbuttons&shareSource=tumblr_share_button"}  title="Post this quote on tumblr!"><button style={{backgroundColor:colorList[counter], borderRadius:"10px", transitionDuration: "0.4s",width:"50px", height:"50px", border:"none", cursor:"pointer"}}><i className="fa fa-tumblr " style={{color:"white", fontSize:"18px"}}></i></button></a>

            <button id="new-quote" style={{float:"right", borderRadius:"10px", transitionDuration: "0.4s", backgroundColor:colorList[counter], cursor:"pointer", color:"white",width:"130px", height:"50px", fontFamily: 'Raleway', fontSize:"18px", border:"none", cursor:"pointer"}} onClick={
                ()=>
                setCounter(
                    ()=>{
                        position = Math.floor(Math.random()*quoteList.length);
                        while(position==counter) {position = Math.floor(Math.random()*quoteList.length)} return position
                    }
                    )}
                ><b>Next quote</b></button>
        </td>


    </table>
    <p style={{textAlign:"center", color:"white", fontFamily: 'Raleway'}}>by <a href="www.riyadargoub.com" title="Visit my website" style={{textDecoration:"none", color:"white", fontFamily: 'Raleway', fontWeight:"bold"}}>Riyad Argoub</a></p>
        </>
    );
}

export default App;