var IE = document.all ? true : false
document.onmousemove = getMousepoints;
var mousex = 0;
var mousey = 0;
function getMousepoints() {
    mousex = event.clientX + document.body.scrollLeft;
    mousey = event.clientY + document.body.scrollTop;
    return true;
}

// prevent the BackSpace work as Text box back delete charactores
   $(document).keydown(function(e) {
       var doPrevent;
       if (e.keyCode === 8) {
           var d = e.srcElement || e.target;
           if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {
               doPrevent = d.readOnly || d.disabled;
           }
           else
               doPrevent = true;
       }
       else
           doPrevent = false;

       if (doPrevent)
           e.preventDefault();
   });
                       
 