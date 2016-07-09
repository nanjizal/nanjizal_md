package nanjizal.loaders;
import js.Lib;
import haxe.Http;
import js.Browser;
import haxe.ds.StringMap;
class TxtLoader{
    public var contents:  StringMap<String>;
    var loaded: Void -> Void;
    var count: Int;
    public function new( fileNames: Array<String>, loaded_: Void -> Void ){
        reload( fileNames, loaded_ );
    }
    public function reload( fileNames: Array<String>, loaded_: Void -> Void ){
        contents = new StringMap<String>();
        loaded = loaded_;
        count = fileNames.length;
        for( file in fileNames ) load( file );
    }
    function load( file: String ){ 
        var r         = new Http( file );
        r.onError     = Browser.alert;
        r.onData      = store.bind( file.split('/').pop() );
        r.request( false );
    }
    function store( name: String,  data: String ){
        count--;
        trace( 'store ' + name + ' ' + count );
        contents.set( name, data );
        if( count == 0 ){
            loaded();
        }
    }
}
