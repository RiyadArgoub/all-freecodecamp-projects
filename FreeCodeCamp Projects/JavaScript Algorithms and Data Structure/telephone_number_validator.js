function telephoneCheck(str) {
    let s2= str.slice();
    let s3= str.slice();
    s3=s3.replace(/[^\(\)]/g,"");
      if((s2.replace(/\D/g,"")).length==11) {
        
    console.log(str,s3.length);
    if(/^[1]/.test(str)==true) {
    if(/1[" "|(]?[" "|(]?\d\d\d[" "|)]?[" "|)]?[\-]?\d\d\d[" "]?[\-]?\d\d\d\d/.test(str)==true) {
      if(s3.length!=0&&s3.length!=2) {return false}
      if (s3.length==0) {return true
      } else if (s3.length==2) {
        if (str[1]!="("&&str[5]!=")"&&str[2]!="("&&str[6]!=")") {
          return false
        }
        if (str[1]=="("&&str[5]==")") {
          return true
        } else if (str[2]=="("&&str[6]==")") {
          return true
        }
      }
    }
    } else {return false}
      } else if ((s2.replace(/\D/g,"")).length==10) {
    console.log(str,s3.length)
    if(/\d\d\d[" "|)]?[" "|)]?[\-]?\d\d\d[\-]?\d\d\d\d/.test(str)==true) {
       if(s3.length!=0&&s3.length!=2) {return false}
      if (s3.length==0) {return true
      } else if (s3.length==2) {
        if (str[0]!="("&&str[4]!=")"&&str[1]!="("&&str[5]!=")") {
          return false
        }
        if (str[0]=="("&&str[4]==")") {
          return true
        } else if (str[1]=="("&&str[5]==")") {return true}else {return false}
      }
    }
    else {return false}
      }
      else {return false}
    }