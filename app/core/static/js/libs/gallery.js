(function($) {

    'use strict';

    $.gallery =  {

        image: null,
        overlay: null,

        id_map: [],
        current_id: null,

        init: function() {
            var view = this,
                close_pointer = $('<div class="close"><i class="material-icons">close</i></div>'),
                next_pointer = $('<div class="next"><i class="material-icons">chevron_right</i></div>'),
                prev_pointer = $('<div class="prev"><i class="material-icons">chevron_left</i></div>'),
                overlay = $('<div id="overlay" class="hidden"></div>');

            overlay.append(close_pointer)
                .append(prev_pointer)
                .append(next_pointer);
            $('body').append(overlay);

            // Bind overlay actions
            overlay.bind('click', function() { view.next(); });
            next_pointer.bind('click', function() { view.next(); });
            prev_pointer.bind('click', function() { view.prev(); });

            close_pointer.bind('click', function(event) {
                event.stopPropagation();
                view.hide();
            });

            $(window).bind('resize', function() { view.resize(); });
            $(document).bind('keydown', function(event) {
                if (event.keyCode === 27) {
                    view.hide();
                }
                if (event.keyCode === 39) {
                    view.next();
                }
                if (event.keyCode === 37) {
                    view.prev();
                }
            });

            // Bind image actions
            $.each($('.preview'), function() {
                var id = $(this).data('id'),
                    link = $(this).attr('href');

                $(this).bind('click', function(event) {
                    event.preventDefault();
                    view.build(id, link);
                });

                view.id_map.push([id, link]);
            });

            view.overlay = overlay;
        },

        build: function(id, link) {
            var view = this;

            $.fn.loaderShow();

            view.overlay.find('.original').remove();
            view.image = $('<img src="' + link + '" class="original resizible black-shadow" />');
            view.image.on('load', function() {
                view.current_id = id;
                view.overlay.append(view.image);

                view.open();
                view.resize();
                $.fn.loaderHide();
            });
        },

        resize: function() {
            var shift_x = ($(window).width() - this.image.width()) / 2,
                shift_y = ($(window).height() - this.image.height()) / 2;

            if (shift_x > 0) this.image.css('left', shift_x);
            if (shift_y > 0) this.image.css('top', shift_y);
        },

        next: function() {
            for (var i = 0; i < this.id_map.length; i++) {
                if (this.current_id === this.id_map[i][0]) {
                    if (i + 1 === this.id_map.length) {
                        this.build(this.id_map[0][0], this.id_map[0][1]);
                    } else {
                        this.build(this.id_map[i + 1][0], this.id_map[i + 1][1]);
                    }
                    return;
                }
            }
        },

        prev: function() {
            for (var i = 0; i < this.id_map.length; i++) {
                if (this.current_id === this.id_map[i][0]) {
                    if (i - 1 < 0) {
                        this.build(this.id_map[this.id_map.length][0], this.id_map[this.id_map.length][1]);
                    } else {
                        this.build(this.id_map[i - 1][0], this.id_map[i - 1][1]);
                    }
                    return;
                }
            }
        },

        open: function() {
            this.overlay.removeClass('hidden');
        },

        hide: function() {
            this.overlay.addClass('hidden');
        }
    };
})(jQuery);