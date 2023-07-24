const socket = io('http://localhost:3000');
const form = document.getElementById('form-cont');
const msgInput = document.getElementById('icon_prefix2');
const msgCont = document.querySelector(".navBar");
const user = document.getElementById('userName');
const append = (message, position) =>{
    const messageElement = document.createElement('div');
    messageElement.innerText = message;
    messageElement.classList.add('message');
    messageElement.classList.add(position);
    msgCont.append(messageElement);
}

form.addEventListener('submit', (e)=>{
    e.preventDefault();
    const message = msgInput.value;
    append(`You : ${message}`, 'right');
    socket.emit('send',message);
    msgInput.value = "";
});

const name =prompt("Enter Your Nik Name To Join");
socket.emit('new-user-joined', name);
//user.innerHTML = name;

socket.on('user-joined', name =>{
    append(`${name} joined the chat`, 'left');
});

socket.on('receive', data =>{
    append(`${data.name} : ${data.message}`, 'left');
    
});

socket.on('left', name =>{
    append(`${name} left the chat`, 'left');
});

