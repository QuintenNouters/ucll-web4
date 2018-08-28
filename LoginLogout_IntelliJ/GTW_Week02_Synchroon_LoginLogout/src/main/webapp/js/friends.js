var button = document.getElementById("searchusersbutton");
var xhrSearch = new XMLHttpRequest();
var xhrFriends = new XMLHttpRequest();
var xhrAmount = new XMLHttpRequest();
button.onclick = searchFriends;

setInterval(getFriends, 2500);

function searchFriends(){
    var input = document.getElementById("searchusersfield").value;
    xhrSearch.open("GET", "Controller?action=SearchUsers&key="+encodeURI(input), true);
    xhrSearch.onreadystatechange = getSearchResult;
    xhrSearch.send(null);
}

function getSearchResult(){
    if (xhrSearch.status == 200) {
        if (xhrSearch.readyState == 4) {
            var json = JSON.parse(xhrSearch.responseText);
            var result = document.getElementById("searchresult");
            var ul = document.createElement("ul");
            for(p in json){
                var li = document.createElement("li");
                var person = json[p];
                li.setAttribute("class", "user");
                li.setAttribute("id", person.userId);

                var statusDiv = createStatusDiv(person.status, person.statusMessage);
                li.append(statusDiv);

                var par = document.createElement("p");
                var text = person.userId + " " + person.firstName + " " + person.lastName;
                var node = document.createTextNode(text);
                par.appendChild(node);
                li.appendChild(par);

                var newButton = createButtonWithOnClick("add","Add", "addPerson('"+ person.userId+"')");
                li.appendChild(newButton);

                ul.appendChild(li);
            }
            if(result.children[0] != null){
                result.removeChild(result.children[0])
            }
            result.appendChild(ul);
        }
    }
}

function createStatusDiv(status, statusMessage){
    var statusDiv = document.createElement("div");
    statusDiv.setAttribute("class", "status"+status.toLowerCase());
    var statusSpan = document.createElement("span");
    statusSpan.setAttribute("class", "statustext");
    var statusText = document.createTextNode(""+statusMessage);
    statusSpan.appendChild(statusText);
    statusDiv.appendChild(statusSpan);
    return statusDiv;
}

function createButtonWithOnClick(className, name, onClick){
    var newButton = document.createElement("input");
    newButton.setAttribute("class", className);
    newButton.setAttribute("type","button");
    newButton.setAttribute("value", name);
    newButton.setAttribute("onClick", onClick);
    return newButton;
}

function addPerson(userId){
    var xhr = new XMLHttpRequest();
    xhr.open("GET","Controller?action=AddUser&id="+encodeURI(userId), true);
    xhr.send(null);
    searchFriends();
}

function getFriends(){
    xhrFriends.open("GET","Controller?action=FriendsList", true);
    xhrFriends.onreadystatechange = getFriendsResult;
    xhrFriends.send(null);
}

function getFriendsResult(){
    if(xhrFriends.status == 200){
        if(xhrFriends.readyState == 4){
            var json = JSON.parse(xhrFriends.responseText);
            var div = document.getElementById("friends");
            var ul = document.createElement("ul");
            var divamount = document.getElementById("statusamount");
            var offline = 0;
            var online = 0;
            for (p in json){
                var li = document.createElement("li");
                var person = json[p];

                if(person.status == "OFFLINE"){
                    offline++;
                } else{
                    online++;
                }
                li.setAttribute("class","friend");
                li.setAttribute("id",person.userId);

                var statusDiv = createStatusDiv(person.status, person.statusMessage);
                li.appendChild(statusDiv);

                var par = document.createElement("p");
                par.setAttribute("class", "friendName");
                var text = person.userId + " " + person.firstName + " " + person.lastName;
                var node = document.createTextNode(text);
                par.appendChild(node);
                li.appendChild(par);

                var newButton = createButtonWithOnClick("remove","Remove","removePerson('"+person.userId+"')");
                li.appendChild(newButton);
                var message = document.createElement("input");
                message.setAttribute("id", "msgbutton");
                message.setAttribute("class", person.userId);
                message.setAttribute("type", "button");
                message.setAttribute("value", "message");
                li.appendChild(message);
                ul.appendChild(li);
            }
            var pamount = document.createElement("p");
            var textamount = "Online: " + online + " Offline: " + offline;
            var nodeamount = document.createTextNode(textamount);
            pamount.appendChild(nodeamount);

            if(divamount.children[0] != null){

                divamount.removeChild(divamount.children[0])
            }
            divamount.appendChild(pamount);


            if(div.children[0] != null){
                div.removeChild(div.children[0])
            }
            div.appendChild(ul);
        }
    }
}

function removePerson(userid){
    var xhr = new XMLHttpRequest();
    xhr.open("GET","Controller?action=RemoveFriend&id="+encodeURI(userid), true);
    xhr.send(null);
    getFriends();
}