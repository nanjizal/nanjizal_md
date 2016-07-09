package;
import js.html.DivElement;
import Intro;
import nanjizal.blog.BlogLoader;
class Nanjizal{
    static function main(){ new Nanjizal(); }
    static inline var _FONT = '</FONT>';
    static inline var FONT_ = '<FONT FACE="Trebuchet MS, Helvetica, sans-serif">';
    var blogFolder = 'blog/';
    var blogFile = 'blog.json';
    var blogLoader: BlogLoader;
    var doc = js.Browser.window.document;
    var div: DivElement;
    function new(){
        div = doc.createDivElement();
        showIntroFaster();
        loadBlog();
    }
    function showIntroFaster(){
        renderHtml( Intro.markdown() );
    }
    function loadBlog(){
        blogLoader = new BlogLoader( blogFolder, blogFile, blogLoaded );
        blogLoader.render = renderHtml;
    }
    function blogLoaded(){
        var names = blogLoader.itemNames();
        blogLoader.loadItemByName( names[ 0 ] );// load first blog item
    }
    function renderHtml( markdown: String ){
        div.innerHTML = FONT_ + markdown + _FONT;
        doc.body.appendChild( div );
    }
}
