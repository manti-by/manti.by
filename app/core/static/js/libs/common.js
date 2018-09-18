(($) => {

    'use strict';

    $.setCookie = (name, value, expire) => {
        let expire_date = new Date();

        expire_date.setDate(expire_date.getDate() + expire);
        value = encodeURIComponent(value) +
            (expire === null ? '' : '; expires=' + expire_date.toUTCString());

        document.cookie = name + '=' + value;
    };

    $.getCookie = (name, default_value) => {
        let value = document.cookie,
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

    $.secondsToTime = (time) => {
        let hours = Math.floor(time / 3600);
        hours = hours > 9 ? hours : '0' + hours;
        time -= hours * 3600;

        let minutes = Math.floor(time / 60);
        minutes = minutes > 9 ? minutes : '0' + minutes;
        time -= minutes * 60;

        let seconds = parseInt(time % 60, 10);
        seconds = seconds > 9 ? seconds : '0' + seconds;

        return hours + ':' + minutes + ':' + seconds;
    };

    $.loadDeferredStyles = () => {
        let addStylesNode = document.getElementById('deferred-styles'),
            replacement = document.createElement('div');

        replacement.innerHTML = addStylesNode.textContent;
        document.body.appendChild(replacement);
        addStylesNode.parentElement.removeChild(addStylesNode);
    };

})(jQuery);
