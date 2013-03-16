(function ($) {
    // tipWrap:  提示消息的容器
    // maxNumber:  最大输入字符
    $.fn.charCount = function (tipWrap, controlBtn, maxNumber) {
        var countClass = 'available',
            // 定义内部容器的CSS类名
            fullClass = 'exceeded',
            // 定义超出字符的CSS类名
            disabledClass = 'disabled'; // 定义不可用提交按钮CSS类名
        // 统计字数
        var count = function () {
            //var btn = $(this).closest('form').find(':submit');
            var val = $(this).val().replace(/[^x00-xff]/g, 'xx').length / 2; //making English char 0.5 and Chinese char 1
            if (controlBtn != null) {
	            // 是否禁用提交按钮
	            var disabled = {
	                on: function () {
	                    controlBtn.removeAttr('disabled').removeClass(disabledClass);
	                },
	                off: function () {
	                    controlBtn.attr('disabled', 'disabled').addClass(disabledClass);
	                }
	            };
            }
            if (val == 0 && controlBtn != null) disabled.off();
            if (val <= maxNumber) {
                if (val > 0 && controlBtn != null) disabled.on();
                tipWrap.html('<span class="' + countClass + '">\u8FD8\u80FD\u8F93\u5165 <i>' + Math.abs(Math.floor(maxNumber - val)) + '</i> \u4E2A\u5B57</span>');
            } else {
                if (controlBtn != null) disabled.off();
                tipWrap.html('<span class="' + countClass + ' ' + fullClass + '">\u5DF2\u7ECF\u8D85\u51FA <i>' + Math.abs(Math.floor(maxNumber - val)) + '</i> \u4E2A\u5B57</span>');
            };
        };
        $(this).bind('focus keyup change', count);
        return this;
    };
})(jQuery);
