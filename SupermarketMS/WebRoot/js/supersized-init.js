jQuery(function($){

    $.supersized({

        // Functionality
        slide_interval     : 4000,    //转换之间的长度 Length between transitions
        transition         : 1,    //0 - 无，1 - 淡入淡出，2 - 滑动顶，3 - 滑动向右，4 - 滑底，5 - 滑块向左，6 - 旋转木马右键，7 - 左旋转木马 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
        transition_speed   : 1000,    //转型速度 Speed of transition
        performance        : 1,    //0 - 正常，1 - 混合速度/质量，2 - 更优的图像质量，三优的转换速度//（仅适用于火狐/ IE浏览器，而不是Webkit的）0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)

        // Size & Position
        min_width          : 0,    //最小允许宽度（以像素为单位） Min width allowed (in pixels)
        min_height         : 0,    //最小允许高度（以像素为单位） Min height allowed (in pixels)
        vertical_center    : 1,    //垂直居中背景 Vertically center background
        horizontal_center  : 1,    //水平中心的背景 Horizontally center background
        fit_always         : 0,    //图像绝不会超过浏览器的宽度或高度（忽略分钟。尺寸） Image will never exceed browser width or height (Ignores min. dimensions)
        fit_portrait       : 1,    //纵向图像将不超过浏览器高度 Portrait images will not exceed browser height
        fit_landscape      : 0,    //景观的图像将不超过宽度的浏览器 Landscape images will not exceed browser width

        // Components
        slide_links        : 'blank',    //个别环节为每张幻灯片 Individual links for each slide (Options: false, 'num', 'name', 'blank')
        slides             : [    //幻灯片影像 Slideshow Images
                                 {image : 'images/1.jpg'},
                                 {image : 'images/2.jpg'},
                                 {image : 'images/3.jpg'}
                       ]

    });

});
