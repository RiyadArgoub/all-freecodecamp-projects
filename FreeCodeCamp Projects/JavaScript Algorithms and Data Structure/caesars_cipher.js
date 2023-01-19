function rot13(str) {
    let a="";
    let b=[];
    let c="";
    for(let i=0;i<str.length;i++) {
    if (/[A-Z]/.test(str[i])) {
    a=str.charCodeAt(i);
    a= a-65;
    a= (a+13) % 26;
    a+=65
    b.push(a)
    } else if (/[!|?|" "|.]/.test(str[i])) {
    a=str.charCodeAt(i);
    b.push(a)
    }
    c= String.fromCharCode(...b);
    }
    console.log(c);
    return c
    
    }