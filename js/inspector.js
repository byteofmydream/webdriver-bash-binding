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
    var changeAim = {
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
    var changeVerline = {
        72: {
            left: "-=0"
        },
        37: {
            left: "-=1"
        },
        38: {
            top: "-=0"
        },
        39: {
            left: "+=1"
        },
        40: {
            top: "+=0"
        }
    };
    var changeHorline = {
        72: {
            left: "-=0"
        },
        37: {
            left: "-=0"
        },
        38: {
            top: "-=1"
        },
        39: {
            left: "+=0"
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
        var animationAim = changeAim[e.which];
        var animationVertline = changeVerline[e.which];
        var animationHorline = changeHorline[e.which];
        going = setInterval(keepGoing, 1);

        function keepGoing() {
            $(".ball").css(animationAim);
            $("#vert_line").css(animationVertline);
            $("#horizontal_line").css(animationHorline);
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
        var pageWidth = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
        var pageHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
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
        var vert_line = document.createElement("div");
        vert_line.setAttribute("id", "vert_line");
        body.appendChild(vert_line);
        $(vert_line).css({
            "width": "2px",
            "height": pageHeight,
            "position": "absolute",
            "left": "40px",
            "top": "1px",
            "z-index": "99999999",
            "background-color": "violet"
        });
        var horizontal_line = document.createElement("div");
        horizontal_line.setAttribute("id", "horizontal_line");
        body.appendChild(horizontal_line);
        $(horizontal_line).css({
            "width": pageWidth,
            "height": "2px",
            "position": "absolute",
            "left": "1px",
            "top": "50px",
            "z-index": "99999999",
            "background-color": "violet"
        });
        var cursor = document.createElement("img");
        cursor.setAttribute("class", "ball");
        cursor.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=";
        body.appendChild(cursor);
        $(cursor).css({
            "width": "1px",
            "height": "1px",
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
        $("#horizontal_line").css({"top": y + "px"});
        $("#vert_line").css({"left": x + "px"});
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