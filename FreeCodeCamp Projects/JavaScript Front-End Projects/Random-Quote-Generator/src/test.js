let quoteList=["We cannot solve problems with the kind of thinking we employed when we came up with them.",
    "Learn as if you will live forever, live like you will die tomorrow.",
    "Stay away from those people who try to disparage your ambitions. Small minds will always do that, but great minds will give you a feeling that you can become great too.",
    "When you give joy to other people, you get more joy in return. You should give a good thought to happiness that you can give out.",
    "When you change your thoughts, remember to also change your world.",
    "It is only when we take chances, when our lives improve. The initial and the most difficult risk that we need to take is to become honest.",
    "Nature has given us all the pieces required to achieve exceptional wellness and health, but has left it to us to put these pieces together."]
    
let authorList=["Albert Einstein","Mahatma Gandhi","Mark Twain","Eleanor Roosevelt","Norman Vincent Peale","Walter Anderson","Diane McLaren"]
    
let quoteList2=[];
    
let authorList2=[];

for(let i=0;i<quoteList.length;i++) {
    quoteList2.push(quoteList[i].replace(/\s/ig,"%20"));
    authorList2.push(authorList[i].replace(/\s/ig,"%20"));
}

console.log(quoteList2[6])
"https:www.twitter.com/intent/tweet/?hashtags=quotes&related=freecodecamp&text=\""+quoteList2[counter]+"\"%20"+authorList2[counter]