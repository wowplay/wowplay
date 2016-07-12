define(function(require, exports, module) {

    var Notify = require('common/bootstrap-notify');
    var Validator = require('bootstrap.validator');
    var Lazyload = require('echo.js');
    var Cookie = require('cookie');
    var Swiper = require('swiper');
    require('common/validator-rules').inject(Validator);

    exports.run = function() {
        Lazyload.init();
        changehottag();
        var swiper = new Swiper('.poster .swiper-container', {
            pagination: '.swiper-pager',
            paginationClickable: true,
            autoplay: 5000,
            autoplayDisableOnInteraction: false,
            loop: true,
            calculateHeight: true,
            roundLengths: true,
            onSwiperCreated: function(swiper) {
               $(".swiper-slide").removeClass('hide'); 
            }
        });
          $('.swiper-button-prev').on('click', function(e){
            e.preventDefault()
            swiper.swipePrev()
          })
          $('.swiper-button-next').on('click', function(e){
            e.preventDefault()
            swiper.swipeNext()
          })
            //首页课程
        $(".hz-index-nav li").mouseenter(function(){
            var $self =$(this);
            var indexcourseitem = $(".index-course .tabs .item");
            var marginleft = $self.index()*$self.width();
            $(".bottom-act").stop().animate({marginLeft:marginleft},300);
            $(".hz-index-nav li ").removeClass("act");
            $self.addClass("act");        
            if(!$self.hasClass("ispost") && $self.index()!=0){
              $.get($self.data('url'),function(data){
                indexcourseitem.removeClass("act");
                $("#"+$self.data("id")).html(data).addClass("act");
                $self.addClass("ispost"); 
                Lazyload.init();
              });
            }
            else{
                indexcourseitem.removeClass("act");
                $("#"+$self.data("id")).addClass("act");
            }
        })
    };

    //首页热门标签替换
    var changehottag = function(){ 
      $hottag = $(".hot-tag-main");
      if(window.localStorage){
        if(localStorage.hztag){
           localStorage.hztag = parseInt(localStorage.hztag)==2? 0: parseInt(localStorage.hztag)+1; 
           $hottag.hide().eq(localStorage.hztag).show();
        }else{
           localStorage.hztag = hottagevent($hottag);
        }
      }
      else if(window.navigator.cookieEnabled)  
        {
            if(getCookie("hztag")){
            var hztag = getCookie("hztag")==2? 0 : parseInt(getCookie("hztag"))+1; 
            addCookie("hztag", hztag,60*24*90);
            $hottag.hide().eq(getCookie("hztag")).show(); 
            }
            else{
              addCookie("hztag", hottagevent($hottag),60*24*90);
            }
        }
      else{
        hottagevent($hottag);
      }
    }

    var hottagevent = function($item){
      var namber= Math.floor(Math.random()*3);
      $item.hide().eq(namber).show();
      return namber;
    }
    // 添加Cookie
    function addCookie(objName, objValue, objMinutes) {
        var str = objName + "=" + escape(objValue);
        if (objMinutes > 0) {
            var date = new Date();
            var ms = objMinutes * 60 * 1000;
            date.setTime(date.getTime() + ms);
            str += "; expires=" + date.toGMTString() + "";
        }
        document.cookie = str + "; path=/";
    }
    // 删除Cookie
    function delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = getCookie(name);
        if (cval != null)
            document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    }
    // 获取Cookie
    function getCookie(objName) {
        var arrStr = document.cookie.split("; ");
        var arryLength = arrStr.length;
        for (var i = 0; i < arryLength; i++) {
            var temp = arrStr[i].split("=");
            if (temp[0] == objName) return unescape(temp[1]);
        }
    }

});