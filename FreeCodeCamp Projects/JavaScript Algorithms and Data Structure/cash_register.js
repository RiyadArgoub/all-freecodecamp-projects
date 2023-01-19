function checkCashRegister(price, cash, cid) {
    let a = [{ name: 'ONE HUNDRED', val: 100},{ name: 'TWENTY', val: 20},{ name: 'TEN', val: 10},
    { name: 'FIVE', val: 5},{ name: 'ONE', val: 1},{ name: 'QUARTER', val: 0.25},{ name: 'DIME', val: 0.1},{ name: 'NICKEL', val: 0.05},{ name: 'PENNY', val: 0.01}
    ];
     let zz = {status: null, change: []};
     let change = cash - price;
     let abc = cid.reduce(function(b,sd) {
     b.total += sd[1];
     b[sd[0]] = sd[1];
     return b;
     }, {
       total: 0})
     if(abc.total === change) {
     zz.status = 'CLOSED';
     zz.change = cid;
     return zz;}
     if(abc.total<change) {
     zz.status = 'INSUFFICIENT_FUNDS';
     return zz;}
     var change_arr = a.reduce(function(b, sd) {
     var value = 0;
     while(abc[sd.name] > 0 && change >= sd.val) {
    change -= sd.val;
     abc[sd.name] -= sd.val;
     value += sd.val;
     change = Math.round(change * 100) / 100;
     }
     if(value > 0) {
     b.push([ sd.name, value ]);
     }
     return b;
     }, []);
     if(change_arr.length < 1 || change > 0) {
     zz.status = 'INSUFFICIENT_FUNDS';
     return zz;
     }
     zz.status = 'OPEN';
     zz.change = change_arr;
     return zz;
    }