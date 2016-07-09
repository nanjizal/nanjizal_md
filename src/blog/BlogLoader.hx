package nanjizal.blog;
import nanjizal.loaders.TxtLoader;
import haxe.Json;
using Markdown;
typedef Blog = {
    var blog:Array<Item>;
}
typedef Item = {
    var name: String;
    var content: Content;
}
typedef Content = {
    var links: Array<HtmlLink>;
    var markdown: String; 
}
typedef HtmlLink = {
    var name: String;
    var src: String;
}
class BlogLoader{
    public var items: Array<Item>;
    public var currentItemsName: String;// name of item
    var names = new Array<String>();
    var blogFolder: String;
    var txtLoader: TxtLoader;
    var blogFile: String;
    var loaded: Void -> Void;
    public var render: String -> Void; // set how to render the markdown file loaded.
    public function itemNames(): Array<String> {
        if( names.length == 0 ) for( item in items ) names.push( item.name );
        return names;
    }
    public function loadItemByName( name: String ){
        var index = names.indexOf( name );
        var itemContent = items[ index ].content;
        var currentItem = itemContent.markdown;
        var links       = itemContent.links;
        txtLoader.reload( [ blogFolder + currentItem ], renderMarkDown.bind( currentItem, name, links ) );
    }
    public function new( blogFolder_: String, blogFile_: String, loaded_: Void->Void ){
        blogFolder = blogFolder_;
        blogFile = blogFile_;
        loaded = loaded_;
        txtLoader = new TxtLoader( [ blogFolder + 'blog.json'], jsonsLoaded );
    }
    function jsonsLoaded(){
        var blogJson: Blog = Json.parse( txtLoader.contents.get( 'blog.json' ) );
        items = blogJson.blog;
        loaded();
    }
    function renderMarkDown( currentItem: String, name: String, links: Array<HtmlLink> ){
        currentItemsName = name;
        var str = txtLoader.contents.get( currentItem );
        for( link in links ) str = StringTools.replace( str, '$' + link.name, link.src ); // add any links in file
        if( render != null ) render( str.markdownToHtml() );
    }
}
