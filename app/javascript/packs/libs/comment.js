document.addEventListener('DOMContentLoaded', function () {
    //スライドアニメーション
    const CoVi = new CommentView();

})


class CommentView{
    constructor() {
        this.DOM = {};
        this.DOM.commentbtn =  document.querySelector('.comment-btn');
        this.DOM.commentbtn.addEventListener('click',this._addview);
        this.DOM.closebtn = document.querySelector('.close-btn');
        this.DOM.closebtn.addEventListener('click',this._closeview);
    }
    _addview(){
        document.querySelector('.comment-post').classList.add("post-inview");
        document.querySelector('#content').classList.add("post-inview");   
    }
    _closeview(){
        document.querySelector('.comment-post').classList.remove("post-inview");
        document.querySelector('#content').classList.remove("post-inview");      
    }
}

