function changeFocus1(){
    const phone1 = document.getElementById("phone1").value
    if(phone1.length === 3) {
        document.getElementById("phone2").focus()
    }
}

function changeFocus2(){
    const phone2 = document.getElementById("phone2").value
    if(phone2.length === 4) {
        document.getElementById("phone3").focus()
    }
}

function changeFocus3(){
    const phone1 = document.getElementById("phone1").value
    const phone2 = document.getElementById("phone2").value
    const phone3 = document.getElementById("phone3").value
    if(phone1.length === 3 && phone2.length === 4 && phone3.length === 4){
        document.getElementById("send").style = "background-color: #FFFFFF; color: #0068FF; cursor: pointer;"
        document.getElementById("send").removeAttribute("disabled")
    }
}

function getToken() {
    const token = String(Math.floor(Math.random()*1000000)).padStart(6,"0")
    document.getElementById("token").innerText = token
    document.getElementById("send").style = "background-color: #FFFFFF; cursor: default;"
    document.getElementById("send").setAttribute("disabled", "true")
    document.getElementById("finished").style="background-color: #0068FF; color: #FFFFFF; cursor: pointer;"
    document.getElementById("finished").removeAttribute("disabled")
    getTimerInterval()
}

let interval;

function getTimerInterval(){

    let timer = 179

    interval = setInterval(() => {
        if(timer >= 0){
            const minutes = Math.floor(timer / 60)
            const seconds = timer % 60

            document.getElementById("timer").innerText = minutes + ":" + String(seconds).padStart(2, "0")
            timer -= 1
        } else {
            document.getElementById("token").innerText = "000000"
            document.getElementById("send").style = ""
            document.getElementById("send").setAttribute("disabled", "true")

            document.getElementById("timer").innerText = "3:00"
            document.getElementById("finished").style = ""
            document.getElementById("finished").setAttribute("disabled", "true")

            clearInterval(interval)
        }
    }, 1000)
}

function getTimerIntervalConfirm(){
    clearInterval(interval)
    document.getElementById("finished").style = "background-color: #FFFFFF; cursor: default;"
    document.getElementById("finished").setAttribute("disabled", "true")
    document.getElementById("finished").innerText = "인증완료"
    alert("인증이 완료되었습니다.")

    document.getElementById("signup__button").style = "background-color: #FFFFFF; color: #2C3639; border: 1px solid #2C3639; cursor: pointer;"
    document.getElementById("signup__button").removeAttribute("disabled")
}

function signup(){
    const email = document.getElementById("email").value
    const name = document.getElementById("name").value
    const password1 = document.getElementById("pw1").value
    const password2 = document.getElementById("pw2").value
    const location = document.getElementById("location").value
    const genderWoman = document.getElementById("gender__woman").checked
    const genderMan = document.getElementById("gender__man").checked

    let isValid = true
    if(email.includes("@") === false) {
        document.getElementById("error__email").innerText = "이메일이 올바르지 않습니다."
        isValid = false
    } else {
        document.getElementById("error__email").innerText = ""
    }

    if(name === "") {
        document.getElementById("error__name").innerText = "이름이 올바르지 않습니다."
        isValid = false
    } else {
        document.getElementById("error__name").innerText = ""
    }

    if(password1 === ""){
        document.getElementById("error__password1").innerText = "비밀번호를 입력해 주세요."
        isValid = false
    } else {
        document.getElementById("error__password1").innerText = ""
    }

    if(password2 === ""){
        document.getElementById("error__password2").innerText = "비밀번호를 입력해 주세요."
        isValid = false
    } else {
        document.getElementById("error__password2").innerText = ""
    }

    if(password1 !== password2) {
        document.getElementById("error__password1").innerText = "비밀번호가 일치하지 않습니다."
        document.getElementById("error__password2").innerText = "비밀번호가 일치하지 않습니다."
        isValid = false
    }

    const validLocations = ["서울", "경기도", "인천", "대전", "광주", "대구", "부산", "울산", "충청도", "강원도", "전라도", "제주도"];

    if (!validLocations.includes(location)) {
        document.getElementById("error__location").innerText = "지역을 선택해 주세요.";
        isValid = false;
      } else {
        document.getElementById("error__location").innerText = "";
      }

    if(genderWoman === false && genderMan === false){
        document.getElementById("error__gender").innerText = "성별을 선택해 주세요."
        isValid = false
    } else {
        document.getElementById("error__gender").innerText = ""
    }

    if(isValid === true){
        alert("Film Reaction 가입을 축하합니다.")
    }
}
