var webSocket;

function openSocket(){
    webSocket = new WebSocket("ws://localhost:8080/echo");
    webSocket.onopen = function(event){
        console.log("Connection Openen");
    };

    webSocket.onmessage = function(event){
        writeResponse(event.data);
    };

    webSocket.onclose = function(event){
        console.log("Connection Closed");
    };
}

function send(postid){
    var name = document.getElementById(postid + "_comment" + "_name").value;
    var text = document.getElementById(postid + "_comment"+ "_text").value;
    var rating = document.getElementById(postid + "_comment"+ "_rating").value;
    var json = '{ "postid": "'+encodeURI(postid)+'", "name":"'+encodeURI(name)+'" , "text":"'+encodeURI(text)+'" , "rating":"'+encodeURI(rating)+'" }';
    webSocket.send(json)
}

function writeResponse(responseText){
    var json = JSON.parse(responseText);
    var comments_div = document.getElementById(json.postid + "_comments");
    var comment_div = document.createElement("div");
    comment_div.setAttribute("class", "comment");
    var name = createDivPWithClass("username", json.name);
    var text = createDivPWithClass("text", json.text);
    var rating = createDivPWithClass("rating", json.rating);
    comment_div.appendChild(name);
    comment_div.appendChild(text);
    comment_div.appendChild(rating);
    comments_div.appendChild(comment_div);
}

function createDivPWithClass(classname, value){
    var div = document.createElement("div");
    div.setAttribute("class",classname);
    var divPar = document.createElement("p");
    var divNode = document.createTextNode(decodeURI(value));
    divPar.appendChild(divNode);
    div.appendChild(divPar);
    return div;
}