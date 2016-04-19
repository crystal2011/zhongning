    $(document).ready(function() {
        //幻灯片切换
        function autoSlide(navBtn, slideEle, className, speed) {
                var i = 0;
                var timer = setInterval(function() {
                    $(slideEle).eq(i).fadeIn(300).siblings(slideEle).fadeOut(300);
                    $(navBtn).eq(i).addClass(className).siblings().removeClass(className);
                    i == $(navBtn).length ? i = 0 : i++;
                }, speed);
                $(navBtn).on('mouseover', function() {
                    var $index = $(this).index();
                    $(this).addClass(className).siblings().removeClass(className);
                    $(slideEle).eq($index).stop(true).fadeIn(300).siblings(slideEle).stop(true).fadeOut(300);
                    i = $index;
                });
            }
            //tab切换
        function tab(navBtn, slideEle, className, speed, userEvent) {
            $(navBtn).on(userEvent, function() {
                var $index = $(this).index();
                $(this).addClass(className).siblings().removeClass(className);
                $(slideEle).eq($index).stop(true).fadeIn(speed).siblings(slideEle).stop(true).fadeOut(speed);
            });
        }
        /*全局页码切换*/
        $('.pages li').on('click', function() {
            $(this).addClass('cur').siblings().removeClass('cur');
        });
        $('.pages>.next').on('click', function() {
            for (var i = 0; i < $('.pages li').length; i++) {
                if ($('.pages li').eq(i).hasClass('cur')) {
                    if (i == $('.pages li').length - 1) {
                        return false;
                    } else {
                        $('.pages li').eq(i).removeClass('cur');

                        function siblingli() {
                            $('.pages li').eq(i + 1).addClass('cur');
                        };
                        return siblingli();
                    }
                }
            };
        });
        $('.pages>.prev').on('click', function() {
            for (var i = 0; i < $('.pages li').length; i++) {
                if ($('.pages li').eq(i).hasClass('cur')) {
                    if (i == 0) {
                        return false;
                    } else {
                        $('.pages li').eq(i).removeClass('cur');

                        function siblingli() {
                            $('.pages li').eq(i - 1).addClass('cur');
                        };
                        return siblingli();
                    }
                }
            };
        });
        /*全局头部固定*/
        $(window).scroll(function(event) {
            if ($(window).scrollTop() < 30) {
                $('.header').css('top', '30px');
                $('.header').removeClass('small');
                $('.top').removeClass('cur');
				$('.menu-box').removeClass('scroll');

            } else {
                $('.header').css('top', '0');
                $('.header').addClass('small');
                $('.top').addClass('cur');
				$('.menu-box').addClass('scroll');
            }
        });
        /*全局头部菜单*/
        $('nav li').hover(function(){
		$(this).children('.menu-box').show()
		$(this).children('a').addClass('cur');
		},function(){
			$('nav .menu-box').hide()
			$(this).children('a').removeClass('cur');
		})
        /*全局遮罩层*/
        $('.mask').width($('body').width());
        $('.mask,.pop-temp').height($('body').height());
        $(window).resize(function() {
            $('.mask').width($('body').width());
            $('.mask').height($('body').height());
        })

        $('.pop-btn').on('click', function(event) {
            $('.popup,.mask').addClass('cur');
        });
        $('.popup input,.popup textarea').focus(function() {
            $(this).removeClass('warning').addClass('cur');
            $(this).siblings('small').removeClass('cur');
        }).blur(function() {
            $(this).removeClass('cur');
            if ($(this).val() == '') {
                $(this).addClass('warning');
                $(this).siblings('small').addClass('cur');
            };
        });
        $('.close').on('click', function(event) {
            $('.popup,.mask,.tooltip').removeClass('cur');
            $('.popup input,.popup small,.popup textarea,.pop-temp').removeClass('warning cur');
        });
        /*首页八卦*/
        $('.up-btn').mouseover(function() {
            $('.gossip-box').removeClass('a-clockwise');
            $('.gossip-box').addClass('clockwise');
        });
        $('.down-btn').mouseover(function() {
            $('.gossip-box').removeClass('clockwise');
            $('.gossip-box').addClass('a-clockwise');
        });


        /* 首页nav-box,focus tab切换*/
        $('.nav-box').hover(function hoverEvent() {
            $('.nav-box,.title-box').removeClass('cur');
            $(this).addClass('cur').siblings('.title-box').addClass('cur');
            var $index = $('.nav-box').index(this);
            $('.focus li').removeClass('cur');
            $('.focus li').eq($index).addClass('cur');
        }, function() {
            return false;
        });

        /* 首页focus方向切换*/
        $('.next').on('click', function() {
            for (var i = 0; i < $('.nav-box').length; i++) {
                if ($('.nav-box').eq(i).hasClass('cur')) {
                    $('.nav-box,.focus li,.title-box').removeClass('cur');
                    if (i !== $('.nav-box').length - 1) {
                        function closure1() {
                            $('.nav-box').eq(i + 1).addClass('cur').siblings('.title-box').addClass('cur');
                            $('.focus li').eq(i + 1).addClass('cur');
                        }
                        return closure1();
                    } else {
                        function closure2() {
                            $('.nav-box').eq(0).addClass('cur').siblings('.title-box').addClass('cur');
                            $('.focus li').eq(0).addClass('cur');
                        }
                        return closure2();
                    }
                }
            };
        });
        $('.prev').on('click', function() {
            for (var i = 0; i < $('.nav-box').length; i++) {
                if ($('.nav-box').eq(i).hasClass('cur')) {
                    $('.focus li,.nav-box,.title-box').removeClass('cur');

                    function closure3() {
                        $('.nav-box').eq(i - 1).addClass('cur').siblings('.title-box').addClass('cur');
                        $('.focus li').eq(i - 1).addClass('cur');
                    }
                    return closure3();
                }
            };
        });
        /* sem托管row4tab切换*/
        $('#hosting-nav li').hover(function() {
            $(this).addClass('cur').siblings().removeClass('cur');
            var $index = $('#hosting-nav li').index(this);
            $('.hosting-tab img').eq($index).addClass('cur').siblings().removeClass('cur');
        });
        /*品牌移动互联网row4tab切换*/


        autoSlide('#mobile-nav span', '#mobile-row4-tab li', 'cur', 2000);
        autoSlide('#mobile-nav span', '.mobile-row4-strong', 'cur', 2000);
        /*品牌移动互联网row2step切换*/
        $('.m-step .step').hover(function hoverEvent() {
            var $index = $('.m-step .step').index(this);
            $(this).siblings().find('.title-box,.mobile-nav-box').removeClass('cur')
            $(this).find('.title-box,.mobile-nav-box').addClass('cur');
            $('.brand-mobile-row.row2 .content').eq($index).addClass('cur').siblings('.content').removeClass('cur');
            $('.brand-mobile-row.row2').find('.con-box').removeClass('cur');
            $('.brand-mobile-row.row2 .content').eq($index).find('.con-box').addClass('cur');
        }, function() {
            return false;
        });
        /*品牌律智通nav*/
        $('.wisdom-main nav span').on('click', function(event) {
            var $index = $('.wisdom-main nav span').index(this);
            var $boxTop = $('.wisdom-main .box').eq($index).offset().top - 200;
            $('html,body').animate({
                scrollTop: $boxTop
            });
        });
        /*品牌-pc*/
        $('.go-bottom').on('click', function() {
            var $row9Top = $('.pc-main .row9').offset().top;
            $('html,body').animate({
                scrollTop: $row9Top
            });
        })
        $('.del').on('click', function(event) {
            $('.Pop_up_box').hide();
        });
        $('.solutions-btn').on('click', function() {
            var $index = $('.solutions-btn').index(this);
            $('.solutions_popup').eq($index).show();
        });
        /*客户案例nav切换*/
        $('.case nav li').hover(function() {
            var $index = $('.case nav li').index(this);
            $(this).addClass('cur').siblings().removeClass('cur');
            $('.case .main').eq($index).show().siblings('.main').hide();
        });
        /*客户案例banner切换*/
        $('.case-lawer').hover(function() {
            $(this).addClass('cur').siblings('.case-lawer').removeClass('cur');
            var $index = $('.case-lawer').index(this);
            var srcAdd = 'http://www.lawyermarketing.cn/skins/images/wycms/caselawer' + $index + 'big.png';
            $('.lawer-big img').attr('src', srcAdd);
            $('.tab-box .title').eq($index).addClass('cur').siblings('.title').removeClass('cur');
        });
        /*关于我们导航*/
        function navLeft() {
            var $navLeft = $(window).width() / 2 + 500 + 'px';
            $('.about-nav').css('left', $navLeft);
        }
        navLeft();
        $(window).resize(function() {
            navLeft();
        });
        $(window).scroll(function() {
            if ($('.about-main').length > 0) {
                var $mainTop = $('.about-main').offset().top + 30;
                if ($(window).scrollTop() > $mainTop) {
                    $('.about-nav').fadeIn();
                } else {
                    $('.about-nav').fadeOut();
                }
            } else {
                return false
            };
        });
        /*网律商学院专家咨询*/

        function secMin() {
            var s = setInterval(function() {
                $('#second').html(parseInt($('#second').html()) - 1);
            }, 1000);
            setTimeout(function() {
                $('.tooltip,.mask').removeClass('cur');
                $('#second').html('5');
                clearInterval(s);
            }, 5000);
        };
        $('#consult-btn').on('click', function() {
            $('.tooltip,.mask').addClass('cur');
            secMin();

        });
        /*网律商学院热门标签*/
        function selectFrom(lowerValue, upperValue) {
            var choices = upperValue - lowerValue + 1;
            return Math.floor(Math.random() * choices + lowerValue);
        }

        var $colors = ['#0092C7', '#9FE0F6', '#1f699c', '#9fb8d0', '#3d8ecd'];
        var $sizeArr = ['12px', '14px', '16px', '18px', '20px', '22px', '24px'];
        for (var i = 0; i < $('.tags-box a').length; i++) {
            var $color = $colors[selectFrom(0, $colors.length - 1)];
            var $size = $sizeArr[selectFrom(0, $sizeArr.length - 1)];
            $('.tags-box a').eq(i).css({
                'color': $color,
                'font-size': $size
            });
        };
        /*营销方案-特殊营销*/
        tab('#special-nav li', '.special-tab img', 'cur', 0, 'click');
        tab('#special-nav li', '.special-tab .content', 'cur', 0, 'click');
        /*营销方案-模板库*/
        $('.templates-nav-box ul li').on('click', function() {
            $(this).addClass('cur').siblings('li').removeClass('cur');
        });

        //弹出层start
        $('.templates-list').on('click','li', function() {
            var $index = $(this).index();
            $('.pop-temp').eq($index).addClass('cur').siblings('.pop-temp').removeClass('cur');
            $('.mask').addClass('cur');
            var tempImgs = $('.pop-temp.cur .temp-slide-wrapper img'),
                oWidth = $('.pop-temp.cur .temp-slide-wrapper img').not('.cur').outerWidth(),
                curWidth = $('.pop-temp.cur .temp-slide-wrapper img.cur').outerWidth();

            if (tempImgs.length <= 3) { //判断宽度
                $(".temp-slide-wrapper").width('1000px');
            } else {
                $(".temp-slide-wrapper").width((tempImgs.length - 1) * oWidth + curWidth);
            }

            for (var i = 0; i < tempImgs.length; i++) { //判断起始位置
                if (tempImgs.eq(i).hasClass('cur')) {
                    if (i == 0) {
                        $(".temp-slide-wrapper").css('left', (1000 - curWidth) / 2);
                    } else {
                        var leftNum = -oWidth * (i - 1) + 'px';
                        $(".temp-slide-wrapper").css('left', leftNum);
                    }
                };
            };
            $('.pop-temp .next').on('click', function() {
                for (var i = 0; i < tempImgs.length; i++) {
                    if (tempImgs.eq(i).hasClass('cur')) {
                        if (i == tempImgs.length - 1) {
                            return false;
                        } else {
                            $(".temp-slide-wrapper").animate({
                                left: -oWidth * i
                            }, 500);
                            tempImgs.eq(i).animate({
                                    'width': '160px',
                                    'height': '200px',
                                    'padding-top': '224px',
                                    'opacity': '.5'
                                },
                                500,
                                function() {
                                    $(this).removeClass('cur');
                                });
                            tempImgs.eq(i + 1).animate({
                                    'width': '500px',
                                    'height': '724px',
                                    'padding-top': '0',
                                    'opacity': '1'
                                },
                                500,
                                function() {
                                    $(this).addClass('cur');
                                });
                        }
                    }
                };
            });
            $('.pop-temp .prev').on('click', function() {
                for (var i = 0; i < tempImgs.length; i++) {
                    if (tempImgs.eq(i).hasClass('cur')) {
                        if (i == 0) {
                            return false;
                        } else {
                            $(".temp-slide-wrapper").animate({
                                left: -oWidth * (i - 2)
                            }, 500);
                            tempImgs.eq(i).animate({
                                    'width': '160px',
                                    'height': '200px',
                                    'padding-top': '224px',
                                    'opacity': '.5'
                                },
                                500,
                                function() {
                                    $(this).removeClass('cur');
                                });
                            tempImgs.eq(i - 1).animate({
                                    'width': '500px',
                                    'height': '724px',
                                    'padding-top': '0',
                                    'opacity': '1'
                                },
                                500,
                                function() {
                                    $(this).addClass('cur');
                                });
                        }
                    }
                };
            });
        })

        //弹出层end
        //媒介解决方案
        $('.medium-main .row3 i').on('click', function(e) {
            $(this).parent().toggleClass('cur');
            $(this).toggleClass('fa-chevron-circle-down').toggleClass('fa-chevron-circle-up');
        })
        tab('.medium-main .row3 nav span', '.medium-main .row3 .tab-box', 'cur', 0, 'click');
        //律无忧
        tab('.adsense-main .tab-nav li', '.adsense-main .tab-con', 'cur', 0, 'click');
    });
