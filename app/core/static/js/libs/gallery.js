(function($) {

    'use strict';

    class Gallery {

        constructor() {
            this.image = null;
            this.overlay = null;
            this.id_map = [];
            this.current_id = null;
        }

        init() {
            let close_pointer = $('<div class="close"><i class="material-icons">close</i></div>'),
                next_pointer = $('<div class="next"><i class="material-icons">chevron_right</i></div>'),
                prev_pointer = $('<div class="prev"><i class="material-icons">chevron_left</i></div>'),
                overlay = $('<div id="overlay" class="hidden"></div>');

            overlay.append(close_pointer)
                .append(prev_pointer)
                .append(next_pointer);
            $('body').append(overlay);

            // Bind overlay actions
            overlay.bind('click', () => { this.next(); });
            next_pointer.bind('click', () => { this.next(); });
            prev_pointer.bind('click', () => { this.prev(); });

            close_pointer.bind('click', (e) => {
                e.stopPropagation();
                this.hide();
            });

            $(window).bind('resize', () => { this.resize(); });
            $(document).bind('keydown', (e) => {
                if (e.keyCode === 27) {
                    this.hide();
                }
                if (e.keyCode === 39) {
                    this.next();
                }
                if (e.keyCode === 37) {
                    this.prev();
                }
            });

            // Bind image actions
            $.each($('.preview'), (i, el) => {
                let id = $(el).data('id'),
                    link = $(el).attr('href');

                $(el).bind('click', (e) => {
                    e.preventDefault();
                    this.build(id, link);
                });

                this.id_map.push([id, link]);
            });

            this.overlay = overlay;
        };

        build(id, link) {
            $.loaderShow();

            this.overlay.find('.original').remove();
            this.image = $('<img src="' + link + '" class="original resizible shadow" />');
            this.image.on('load', () => {
                this.current_id = id;
                this.overlay.append(this.image);

                this.open();
                this.resize();
                $.loaderHide();
            });
        };

        resize() {
            let shift_x = ($(window).width() - this.image.width()) / 2,
                shift_y = ($(window).height() - this.image.height()) / 2;

            if (shift_x > 0) this.image.css('left', shift_x);
            if (shift_y > 0) this.image.css('top', shift_y);
        };

        next() {
            for (let i = 0; i < this.id_map.length; i++) {
                if (this.current_id === this.id_map[i][0]) {
                    if (i + 1 === this.id_map.length) {
                        this.build(this.id_map[0][0], this.id_map[0][1]);
                    } else {
                        this.build(this.id_map[i + 1][0], this.id_map[i + 1][1]);
                    }
                    return;
                }
            }
        };

        prev() {
            for (let i = 0; i < this.id_map.length; i++) {
                if (this.current_id === this.id_map[i][0]) {
                    if (i - 1 < 0) {
                        this.build(this.id_map[this.id_map.length][0], this.id_map[this.id_map.length][1]);
                    } else {
                        this.build(this.id_map[i - 1][0], this.id_map[i - 1][1]);
                    }
                    return;
                }
            }
        };

        open() {
            this.overlay.removeClass('hidden');
        };

        hide() {
            this.overlay.addClass('hidden');
        };
    }

    $.gallery = new Gallery();

})(jQuery);