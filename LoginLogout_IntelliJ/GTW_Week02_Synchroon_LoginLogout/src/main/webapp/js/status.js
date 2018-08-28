var xhr = new XMLHttpRequest();
var current = document.getElementById("statustext");
var status = current.innerText;
var button = document.getElementById("statusbutton");
button.onclick = changeStatus;
var dropdown = document.getElementById("statusdropdown");
dropdown.onchange = setTemp;

function setTemp(){
    status = dropdown.options[dropdown.selectedIndex].value;
    textBoxVisibility();
}

function textBoxVisibility(){
    if(dropdown.value == "CUSTOM"){
        showTextBox();
    }else{
        hideTextBox();
    }
}

function showTextBox(){
    var input = document.getElementById("statustextbox");
    input.style.display = 'block';
}

function hideTextBox(){
    var input = document.getElementById("statustextbox");
    input.style.display = 'none';
}

function getTextFromTextBox(){
    return document.getElementById("statustextbox").value;
}

function changeStatus(){
    if(dropdown.value == "CUSTOM"){
        console.log(getTextFromTextBox());
        xhr.open("GET", "Controller?action=Status&status="+encodeURI(dropdown.value)+"&message="+encodeURI(getTextFromTextBox()), true)
    }else{
        xhr.open("GET", "Controller?action=Status&status="+encodeURI(dropdown.value), true)
    }
    xhr.onreadystatechange = getStatus;
    xhr.send(null);
}

function getStatus(){
    if (xhr.status == 200) {
        if (xhr.readyState == 4) {
            var response = JSON.parse(xhr.responseText);
            var status = response.statusMessage;
            var  statusText = document.createTextNode(status);
            var statusDiv = document.getElementById("status");
            statusDiv.setAttribute("class", "status"+status.toLowerCase());
            var statusSpan = document.createElement("status");
            statusSpan.setAttribute("class", "statusText");
            if(statusDiv == null){
                statusDiv = document.createElement('div');
                statusDiv.setAttribute("id", "status");
                statusDiv.setAttribute("class", "status");
                statusDiv.appendChild(statusText);
            }else{
                statusSpan.appendChild(statusText);
                statusDiv.removeChild(statusDiv.childNodes[0]);
                statusDiv.appendChild(statusSpan);
            }
        }
    }
}