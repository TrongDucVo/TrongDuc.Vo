var mlist = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
function gMonth(d){
    return mlist[d.getMonth()]
}
function gDate(d){
    return d.getDate()
}
function gYear(d){
    return d.getFullYear()
}
function gLastday(d){
    var d1 = d.setDate(d.getMonth())
    return d1.getDay()
}
