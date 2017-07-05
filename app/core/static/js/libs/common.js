(function($) {

    'use strict';

    $.fn.setCookie = function (name, value, expire) {
        var expire_date = new Date();

        expire_date.setDate(expire_date.getDate() + expire);
        value = encodeURIComponent(value) +
            (expire === null ? '' : '; expires=' + expire_date.toUTCString());

        document.cookie = name + '=' + value;
    };

    $.fn.getCookie = function(name, default_value) {
        var value = document.cookie,
            start = value.indexOf(' ' + name + '='), end;

        if (start === -1) {
            start = value.indexOf(name + '=');
        }

        if (start === -1) {
            value = default_value;
        } else {
            start = value.indexOf('=', start) + 1;
            end = value.indexOf(';', start);

            if (end === -1) {
                end = value.length;
            }
            value = decodeURIComponent(value.substring(start, end));
        }

        return value;
    };

    $.fn.secondsToTime = function(time) {
        var hours = Math.floor(time / 3600);
        hours = hours > 9 ? hours : '0' + hours;
        time -= hours * 3600;

        var minutes = Math.floor(time / 60);
        minutes = minutes > 9 ? minutes : '0' + minutes;
        time -= minutes * 60;

        var seconds = parseInt(time % 60, 10);
        seconds = seconds > 9 ? seconds : '0' + seconds;

        return hours + ':' + minutes + ':' + seconds;
    };

    $.fn.loaderShow = function() {
    };

    $.fn.loaderHide = function() {
    };

})(jQuery);
