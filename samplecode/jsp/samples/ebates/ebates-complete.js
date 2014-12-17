var EBates = function() {
    return {
        complete : function(data) {
            try {
                if(data != null && typeof data != "undefined") {
                    var url = "", params = [], c = 0;
                    for(var k in data) {
                        if(k.toUpperCase() == "URL") {
                            url = data[k];
                        } else {
                            params[c++] = escape(k) + "=" + escape(data[k]);
                        }
                    }
                    if(url != "") {
                        var f=document.createElement("iframe");
                        f.width="0";
                        f.height="0";
                        f.frameborder="0";
                        f.style.display="none";
                        f.src= url + "?" + params.join("&");
                        document.getElementsByTagName('body')[0].appendChild(f);
                    }
                }
            }
            catch(e){}
        }
    }
}();
