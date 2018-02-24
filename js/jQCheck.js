function jqCheck() {
    if (window.jQuery) {
    } else {
        var head = document.getElementsByTagName("head")[0];
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js";
        script.onreadystatechange = handler;
        script.onload = handler;
        head.appendChild(script);

        function handler() {
            console.log("jquery added")
        }
    }
}
jqCheck()
