function convertToRoman(num) {
    let a=num.toString().split("");
    let b=a.slice();
    let n=[];
    let str=[];
    let table=["","I","II","III","IV","V","VI","VII","VIII","IX","X"]
    table[20]="XX"; table[30]="XXX"; table[40]="XL";table[50]="L";table[60]="LX";table[70]="LXX";table[80]="LXXX";table[90]="XC";table[100]="C";
    table[200]="CC";table[300]="CCC";table[400]="CD";table[500]="D";table[600]="DC";table[700]="DCC";table[800]="DCCC";table[900]="CM";table[1000]="M";table[2000]="MM";table[3000]="MMM";
    for(let i=0;i<a.length;i++) {
    n[i]=b.pop();
    n[i]=n[i]*Math.pow(10,i);
    } for(let i=0;i<n.length;i++) {
      str.unshift(table[n[i]])
    }
    return str.join("")
    }
    