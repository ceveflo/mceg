$(function(){$.fn.imagesLoaded=function(e){function i(){e.call(a,r)}function t(){--n<=0&&this.src!==l&&(setTimeout(i),r.off("load error",t))}var r=this.find("img"),n=r.length,a=this,l="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";return n||i(),r.on("load error",t).each(function(){if(this.complete||void 0===this.complete){var e=this.src;this.src=l,this.src=e}}),this};var e=$("#rg-gallery"),i=e.find("div.es-carousel-wrapper"),t=i.find("ul > li"),r=t.length;Gallery=function(){var n=0,a="carousel",l=!1,s=function(){t.add('<img src="/assets/ajax-loader.gif"/><img src="/assets/black.png"/>').imagesLoaded(function(){c(),o(),g(t.eq(n))}),"carousel"===a&&d()},d=function(){i.show().elastislide({imageW:65,onClick:function(e){return l?!1:(l=!0,g(e),void(n=e.index()))}}),i.elastislide("setCurrent",n)},c=function(){var t=$('<a href="#" class="rg-view-full"></a>'),r=$('<a href="#" class="rg-view-thumbs rg-view-selected"></a>');e.prepend($('<div class="rg-view"/>').append(t).append(r)),t.on("click.rgGallery",function(){return"carousel"===a&&i.elastislide("destroy"),i.hide(),t.addClass("rg-view-selected"),r.removeClass("rg-view-selected"),a="fullview",!1}),r.on("click.rgGallery",function(){return d(),r.addClass("rg-view-selected"),t.removeClass("rg-view-selected"),a="carousel",!1}),"fullview"===a&&t.trigger("click")},o=function(){if($("#img-wrapper-tmpl").tmpl({itemsCount:r}).prependTo(e),r>1){var i=e.find("a.rg-image-nav-prev"),t=e.find("a.rg-image-nav-next"),n=e.find("div.rg-image");i.on("click.rgGallery",function(){return f("left"),!1}),t.on("click.rgGallery",function(){return f("right"),!1}),n.touchwipe({wipeLeft:function(){f("right")},wipeRight:function(){f("left")},preventDefaultEvents:!1}),$(document).on("keyup.rgGallery",function(e){39==e.keyCode?f("right"):37==e.keyCode&&f("left")})}},f=function(e){return l?!1:(l=!0,"right"===e?n+1>=r?n=0:++n:"left"===e&&(0>n-1?n=r-1:--n),void g(t.eq(n)))},g=function(r){var s=e.find("div.rg-loading").show();t.removeClass("selected"),r.addClass("selected");var d=r.find("img"),c=d.data("large"),o=d.data("description");$("<img/>").load(function(){e.find("div.rg-image").empty().append('<img src="'+c+'"/>'),o&&e.find("div.rg-caption").show().children("p").empty().text(o),s.hide(),"carousel"===a&&(i.elastislide("reload"),i.elastislide("setCurrent",n)),l=!1}).attr("src",c)},u=function(e){i.find("ul").append(e),t=t.add($(e)),r=t.length,i.elastislide("add",e)};return{init:s,addItems:u}}(),Gallery.init()});