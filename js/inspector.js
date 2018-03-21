var SelectorLab = function () {
    function libInvoke() {
        var head = document.getElementsByTagName("head")[0];
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "https://cdnjs.cloudflare.com/ajax/libs/optimal-select/4.0.1/optimal-select.min.js";
        script.onreadystatechange = handler;
        script.onload = handler;
        head.appendChild(script);
        function handler() {
            console.log("SelectorsLibAdded")
        }
    }
    libInvoke();
    var change = {
        72: {
            left: "-=0"
        },
        37: {
            left: "-=1"
        },
        38: {
            top: "-=1"
        },
        39: {
            left: "+=1"
        },
        40: {
            top: "+=1"
        }
    };
    $(document).one("keydown", keyDown);
    var going;
    var highlightedElement;

    function keyDown(e) {
        if (e.which === 72) {
            showHelp()
        }
        $(document).one("keyup", keyup);
        var animation = change[e.which];
        going = setInterval(keepGoing, 1);

        function keepGoing() {
            $(".ball").css(animation)
        }
    }

    function target_highlight() {
        var square = $("#square_highlighter");
        square.hide();
        var widget = $("#selectorWidget");
        widget.hide();
        var pos = $(".ball").position();
        var oldHighlighted;
        if (typeof highlightedElement != "undefined") {
            oldHighlighted = highlightedElement;
        } else {
            oldHighlighted = null;
        }
        highlightedElement = document.elementFromPoint(pos.left - window.pageXOffset - 1, pos.top - window.pageYOffset - 1);
        square.show();
        widget.show();
        if(oldHighlighted === null || !$(oldHighlighted).is(highlightedElement)) {
            draw_square(highlightedElement);
            $("#selectorWidgetInput").val(OptimalSelect.getSingleSelector(highlightedElement));
        }
    }

    function draw_square(target) {
        var elementToCover = $(target);
        var offset = elementToCover.offset();
        var left = offset.left + "px";
        var top = offset.top + "px";
        var height = elementToCover.height() + "px";
        var width = elementToCover.width() + "px";

        var square = $("#square_highlighter");
        square.css({
            "left": left,
            "top": top,
            "width": width,
            "height": height
        });
        square.animate({ opacity: 0.5 }, 100);
    }

    function keyup(e) {
        console.log("button pressed is ", e.which);
        if (e.which === 72) {
            showHelp()
        }
        clearInterval(going);
        $(document).one("keydown", keyDown);
        target_highlight();
        console.log(highlightedElement)
    }

    function showHelp() {
        $("#helpDiv")[0].webkitRequestFullscreen();
    }

    function createCursor() {
        var body = document.getElementsByTagName("body")[0];
        var square = document.createElement("div");
        square.setAttribute("id", "square_highlighter");
        body.appendChild(square);
        $(square).css({
            "width": "5px",
            "height": "5px",
            "position": "absolute",
            "left": "30px",
            "top": "40px",
            "z-index": "99999999",
            "background-color": "violet"
        });
        var cursor = document.createElement("img");
        cursor.setAttribute("class", "ball");
        cursor.src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACvElEQVQ4T32Ty09TQRTGv7m37/b2RZHSUlpatEYKCx8x8RHFAMpCF7LAuPFvc2N0oYn4iCKJStQYJUZBFkihthVKobfv0ue9x2lJNARxljPn+813vjnDwFd+/BoJLiean5fQFV1i7b3Dljw4TNozEag7OdjnXjAmj46R4cZZMC1BSdVRfTCLI4dAtrnYeGsCYo8eaAHVmU9gmbFRMow4oRYLEHwBqBUTyvdfwpNY2eckdXSYzNNXIWjyUH/FwSwSat92wBLeIJkiPdAHHaB6A8zthVI2ovj4Nfrje5BEKEK26XGILAc1lQTT61Fby6K6tIVOwbo7QGYOMfptoEYDgqcPLXIiPzMPKCocU1egIRnKJhdrtdhdzaLyI4tQOsb+2FzhEOuJblh8EtRGE0K3G+ToBwhg+SQPLQWBiwvRHCrRLMLb8Y52X5/fe/xkDzsheSRQk0PMlk6FWq4AGg1KySLyqzkM7+yJDwDaG19cPnJHuBOXCWqLR80dCFoR1UIdG1/TOLmT3HfpgTdf4IH5RnphaPG0ae+YMUJDIyG5mMapteXDAR8GwhSYOA9LLg41K/Mn03QACnciOpwoOfyIPX2LC5vrB1uYHzhGoclLsGYSfKA2wNo9V5odgGTWgloKxD4fZF0XYrPvMJqK/Q3xlW+Qjk+Owi4n0YrHIep1SOWriG+VOwC/24JeuxFKvQ5Nvx8Zmxurc+8xkYwy9rwvSEMTl+FMJ9BKJCDqdNgoVRHNVHA9u9W55YnTTYMuM7wSh/A50QYGIHd7sTz7BuzjuYs0YjWiubYOgYvju1WsZEuYKmT2hfXQ5qKwU4LfZORzwiGhIBaLVbBnHj+dNuhgYAJ+1mpYLpVxuyj/80fes3bRkGRBwGBAjVQs1Pjoty0+srrIJIpIN+q4U8n/9zvfNdupR6fHrqLgZjHDfgMR5CsxEFaiMQAAAABJRU5ErkJggg==";
        body.appendChild(cursor);
        $(cursor).css({
            "width": "5px",
            "height": "5px",
            "position": "absolute",
            "left": "30px",
            "top": "40px",
            "z-index": "99999999"
        });
    }

    var helpText = ["Move cursor with arrow keys", "Place cursor with mouse doing long click"];

    function createHelpModal() {
        var body = document.getElementsByTagName("body")[0];
        var div = document.createElement("div");
        div.id = "helpDiv";
        for (var i = 0; i < helpText.length; i++) {
            $(div).append('<input type="checkbox" checked id="pref-box-' + i + '"/> ' + helpText[i] + '<br/>');
        }
        body.appendChild(div);
        $(div).show();
        $(div).css({"position": "fixed", "font-size": "47px"});
    }

    function putCursor(x, y) {
        $(".ball").css({"left": x + "px", "top": y + "px"});
        target_highlight();
    }
    function createSelectorWidget() {
        var parentEl = document.getElementsByTagName("body")[0];
        $(parentEl).append('<div id="selectorWidget">Selector:<input type="text" id="selectorWidgetInput"/><button id="copySelBtn">Copy!</button></div>');
        $("#selectorWidget").css({"z-index":"999999999","top":"20px","width": "20px", "height": "20px", "border": "radius:10px", "background": "#ccc", "position": "fixed"});
        $("#selectorWidget").mousedown(function () {
            $(document).mousemove(function (event) {
                start = 0;
                $('#selectorWidget').css({'left': event.pageX, 'top': event.pageY});
            });
        });
        $(document).mouseup(function () {
            $(this).off('mousemove')
        });
        $("#copySelBtn").attr('onclick',"document.getElementById('selectorWidgetInput').select();document.execCommand('Copy')");
    }

    createCursor();
    createHelpModal();
    createSelectorWidget();

    var body = document.getElementsByTagName("body")[0];
    var longpress = 1000;
    var start;
    $(body).on('mousedown', function (e) {
        start = new Date().getTime();
    });
    $(body).on('mouseleave', function (e) {
        start = 0;
    });
    $(body).on('mouseup', function (e) {
        if (new Date().getTime() >= (start + longpress)) {
            putCursor(e.pageX, e.pageY);
        }
    });
};
SelectorLab();