function palindrome(str) {
let a=str.replace(/[" "|_|,|.|:|'/'|'\'|(|)|\-]/g,"");
a=a.toLowerCase();
let b=a.split("");
let c=b.slice();
let d=[];
if (a.length % 2 !=0) {
for (let i=(a.length-1)/2;i<a.length;i++) {
d.unshift(c[i]);
b.splice((a.length-1)/2,1)
}
d.pop();
console.log(a,b,c,d);
let e=0;
for(let j=0;j<b.length;j++) {
  if (b[j]!=d[j]) {
    e+=1
  }
}
if(e==0) {return true} else {return false}
} else {
for (let i=(a.length)/2;i<a.length;i++) {
d.unshift(c[i]);
b.splice((a.length)/2,1)
}
console.log(a,b,c,d);
} let e=0;
for(let j=0;j<b.length;j++) {
  if (b[j]!=d[j]) {
    e+=1
  }
}
if(e==0) {return true} else {return false}
}