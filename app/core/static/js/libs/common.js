setCookie = function(name, value, exdays) {
    var exdate = new Date(), cookie;

    exdate.setDate(exdate.getDate() + exdays);
    cookie = encodeURIComponent(value);
    cookie += ((exdays === null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = name + "=" + cookie;
};

getCookie = function(name) {
    var value = document.cookie;
    var start = value.indexOf(" " + name + "=");

    if (start === -1) {
        start = value.indexOf(name + "=");
    }

    if (start === -1) {
        value = null;
    } else {
        start = value.indexOf("=", start) + 1;
        var end = value.indexOf(";", start);

        if (end === -1) {
            end = value.length;
        }
        value = decodeURIComponent(value.substring(start,end));
    }

    return value;
};