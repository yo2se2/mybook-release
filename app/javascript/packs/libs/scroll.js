document.addEventListener('DOMContentLoaded', function () {
    //スライドアニメーション
    const _inviewAnimation = function(el, isIntersecting){
        if(isIntersecting) {
            el.classList.add('inview');
        }else{
            el.classList.remove('inview');
        }
    }

    //header
    const header =document.querySelector('header')
    const _navAnimation = function(el, isIntersecting){
        if(isIntersecting) {
            header.classList.remove('triggered');
        }else{
            header.classList.add('triggered');
        }
    }

    const cs = new ScrollObserver('.cover-slide', _inviewAnimation);
    const navTrigger = new ScrollObserver('.nav-trigger',_navAnimation,{once: false});
    const vb = new ScrollObserver('.books', _inviewAnimation);
    const commentContainer = new ScrollObserver('.comment__container',_inviewAnimation)

});

class ScrollObserver {
    constructor(els, cb, options) {
        this.els = document.querySelectorAll(els);
        const defaultOptions = {
            root: null,
            rootMargin: "0px",
            threshold: 0,
            once: true
        };
        this.cb = cb;
        this.options = Object.assign(defaultOptions, options);
        this.once = this.options.once;
        this._init();
    }
    _init() {
        const callback = function (entries, observer) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    this.cb(entry.target, true);
                    if(this.once) {
                        observer.unobserve(entry.target);
                    }
                } else {
                    this.cb(entry.target, false);
                }
            });
        };

        this.io = new IntersectionObserver(callback.bind(this), this.options);

        // @see https://github.com/w3c/IntersectionObserver/tree/master/polyfill
        this.io.POLL_INTERVAL = 100;
        
        this.els.forEach(el => this.io.observe(el));
    }

    destroy() {
        this.io.disconnect();
    }
}

