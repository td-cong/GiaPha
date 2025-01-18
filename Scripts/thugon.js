(function ($) {
    $(document).ready(function () {
        $(window).on('load', function () {
            if ($('.single-product div#tab-description').length > 0) {
                let wrap = $('.single-product div#tab-description');
                let current_height = wrap.height();
                let your_height = 800;
                if (current_height > your_height) {
                    wrap.addClass('fix_height');
                    wrap.append(function () {
                        return '<div class="giuseart_readmore_flatsome giuseart_readmore_flatsome_more"><a title="Xem thêm" href="javascript:void(0);">Xem thêm</a></div>';
                    });
                    wrap.append(function () {
                        return '<div class="giuseart_readmore_flatsome giuseart_readmore_flatsome_less" style="display: none;"><a title="Xem thêm" href="javascript:void(0);">Thu gọn</a></div>';
                    });
                    $('body').on('click', '.giuseart_readmore_flatsome_more', function () {
                        wrap.removeClass('fix_height');
                        $('body .giuseart_readmore_flatsome_more').hide();
                        $('body .giuseart_readmore_flatsome_less').show();
                    });
                    $('body').on('click', '.giuseart_readmore_flatsome_less', function () {
                        wrap.addClass('fix_height');
                        $('body .giuseart_readmore_flatsome_less').hide();
                        $('body .giuseart_readmore_flatsome_more').show();
                    });
                }
            }
        });
    });
})(jQuery);