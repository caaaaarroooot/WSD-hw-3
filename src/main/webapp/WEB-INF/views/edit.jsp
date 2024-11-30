<%@ page import="com.example.springcrudservice.PlayerVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="top.jsp" %>
body {
box-sizing: border-box;
width: 100vw;
height: 100vh;
padding: 50px 10%;
margin: 0;
display: flex;
flex-direction: column;
align-items: center;
background-color: rgb(248, 249, 250) !important;
overflow-y: auto;
overflow-x: hidden;
font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Liberation Sans", Arial,
sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
color: rgb(33, 37, 41);
font-weight: 300;
}

h1 {
margin: 0;
}
p {
text-align: center;
font-size: 20px;
font-weight: 300;
margin: 0;
}
div {
margin: 0;
padding: 0;
box-sizing: border-box;
}
span {
color: rgb(108, 117, 125);
margin-left: 1%;
}
textarea {
line-height: 1.5;
}
textarea::placeholder {
font-weight: 500;
color: #888;
}
button {
width: 80%;
height: 50px;
background-color: rgb(13, 110, 253);
color: white;
font-size: 20px;
font-weight: 400;
border-radius: 8px;
border: none;
margin-bottom: 50px;
}
.formdiv {
width: 100%;
height: auto;
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
margin-top: 25px;
}
.Div {
width: 100%;
display: flex;
flex-direction: row;
justify-content: space-between;
margin-bottom: 30px;
}
.innerNameDiv {
width: 48%;
height: auto;
display: flex;
flex-direction: column;
}
.innerDiv {
width: 80%;
height: auto;
display: flex;
flex-direction: column;
font-size: 16px;
font-weight: 400;
margin-bottom: 10px;
}
.selectDiv1 {
width: 50%;
height: auto;
display: flex;
flex-direction: column;
margin-bottom: 20px;
}
.selectDiv2 {
width: 45%;
height: auto;
display: flex;
flex-direction: column;
margin-bottom: 20px;
}
.checkboxDiv {
height: 90px;
width: 100%;
border-bottom: 1px solid rgba(150, 150, 150, 0.7);
border-top: 1px solid rgba(150, 150, 150, 0.7);
box-sizing: border-box;
padding-top: 22px;
margin-bottom: 30px;
}
.inputText {
border: 1px solid rgb(206, 212, 218);
border-radius: 6px;
box-sizing: border-box;
font-size: 16px;
font-weight: 400;
padding: 6px 12px;
height: 40px;
resize: none;
margin: 10px 0;
}
.inputText.error {
border-color: red;
}
.inputText.success {
border-color: green;
}
.inputText.optional {
border-color: green;
}
.inputText:focus {
border: 3px solid rgb(161, 194, 241);
padding: 3px 9px;
outline: none;
}
.inputText.success:focus {
border-color: green;
}
.inputText.error:focus {
border-color: red;
}
.optionDiv {
width: 100%;
display: flex;
flex-direction: row;
}
.legendDiv {
font-weight: 400;
}
.error-message {
color: red;
font-size: 12px;
display: none;
}
.error-message.active {
display: block;
}
.mouseOn {
cursor: pointer;
}
</style>
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
</svg>
<div class="container">
  <header class="d-flex justify-content-center py-3">
    <ul class="nav nav-pills">
      <li class="nav-item">
        <a href="list" class="nav-link active" aria-current="page">Home</a>
      </li>
    </ul>
  </header>

  <h1>Player Detail</h1>
  <div class="formdiv">
    <form name="form1" class="formdiv" method="post" action="editok">
      <c:if test="${not empty player}">
        <input type="hidden" value="${player.id}" id="id" name="id">
        <div class="innerDiv">
          Name: <input class="inputText" type="text" name="name" id="name" value="${player.name}"  />
          <div id="error-message-name" class="error-message">
            Name is required
          </div>
        </div>
        <div class="innerDiv">
          Birth Year: <input class="inputText" type="number" name="birthyear" id="birthyear" value="${player.birthyear}"  />
          <div id="error-message-birthyear" class="error-message">
            Birth year must be a valid year below 2024
          </div>
        </div>
        <div class="innerDiv">
          Club: <input class="inputText" type="text" name="club" id="club" value="${player.club}"  />
          <div id="error-message-club" class="error-message">
            Club is required
          </div>
        </div>
        <div class="innerDiv">
          Country: <input class="inputText" type="text" name="country" id="country" value="${player.country}"  />
          <div id="error-message-country" class="error-message">
            Country must be at least 2 characters long
          </div>
        </div>
        <div class="innerDiv">
          Position: <input class="inputText" type="text" name="position" id="position" value="${player.position}"  />
          <div id="error-message-position" class="error-message">
            Position must be GK, DF, MF, or FW
          </div>
        </div>
        <div class="innerDiv">
          Main Foot: <input class="inputText" type="text" name="mainfoot" id="mainfoot" value="${player.mainfoot}"  />
          <div id="error-message-mainfoot" class="error-message">
            Main foot is required
          </div>
        </div>
      </c:if>
      <c:if test="${empty player}">
        <p>해당 플레이어 정보를 찾을 수 없습니다.</p>
      </c:if>
      <button
              type="button"
              id="btn"
              onclick="handleSubmit()"
              onmouseover="mouseon()"
              onmouseout="mouseout()"
      >
        수정
      </button>
    </form>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const nameInput = document.getElementById("name");
  const birthYearInput = document.getElementById("birthyear");
  const countryInput = document.getElementById("country");
  const positionInput = document.getElementById("position");
  const clubInput = document.getElementById("club");
  const mainFootInput = document.getElementById("mainfoot");
  const myButton = document.getElementById("btn");

  const errorMessageName = document.getElementById("error-message-name");
  const errorMessageBirthYear = document.getElementById("error-message-birthyear");
  const errorMessageCountry = document.getElementById("error-message-country");
  const errorMessagePosition = document.getElementById("error-message-position");
  const errorMessageClub = document.getElementById("error-message-club");
  const errorMessageMainFoot = document.getElementById("error-message-mainfoot");

  // 공통 유효성 검사 함수
  function validateField(input, errorMessage, customValidation = null) {
    const value = input.value.trim();
    if (!value || (customValidation && !customValidation(value))) {
      input.classList.add("error");
      input.classList.remove("success");
      errorMessage.classList.add("active");
      return false;
    } else {
      input.classList.remove("error");
      input.classList.add("success");
      errorMessage.classList.remove("active");
      return true;
    }
  }

  // Birth Year에 대한 커스텀 유효성 검사 함수
  function validateBirthYear(value) {
    const year = parseInt(value, 10);
    return !isNaN(year) && year > 0 && year < 2024;
  }

  // Country에 대한 커스텀 유효성 검사 함수
  function validateCountry(value) {
    return value.length >= 2;
  }

  // Position에 대한 커스텀 유효성 검사 함수
  function validatePosition(value) {
    const validPositions = ["GK", "DF", "MF", "FW"];
    return validPositions.includes(value.toUpperCase());
  }

  // 전체 폼 유효성 검사
  function isValid() {
    let valid = true;

    valid &= validateField(nameInput, errorMessageName);
    valid &= validateField(birthYearInput, errorMessageBirthYear, validateBirthYear);
    valid &= validateField(countryInput, errorMessageCountry, validateCountry);
    valid &= validateField(positionInput, errorMessagePosition, validatePosition);
    valid &= validateField(clubInput, errorMessageClub);
    valid &= validateField(mainFootInput, errorMessageMainFoot);

    return valid;
  }

  // 폼 제출 처리
  function handleSubmit() {
    if (isValid()) {
      document.form1.submit();
    }
  }

  // 마우스 hover 이벤트 처리
  function mouseon() {
    myButton.classList.add("mouseOn");
  }

  function mouseout() {
    myButton.classList.remove("mouseOn");
  }

  // 실시간 입력 유효성 검사
  nameInput.addEventListener("input", () => {
    validateField(nameInput, errorMessageName);
  });

  birthYearInput.addEventListener("input", () => {
    validateField(birthYearInput, errorMessageBirthYear, validateBirthYear);
  });

  countryInput.addEventListener("input", () => {
    validateField(countryInput, errorMessageCountry, validateCountry);
  });

  positionInput.addEventListener("input", () => {
    validateField(positionInput, errorMessagePosition, validatePosition);
  });

  clubInput.addEventListener("input", () => {
    validateField(clubInput, errorMessageClub);
  });

  mainFootInput.addEventListener("input", () => {
    validateField(mainFootInput, errorMessageMainFoot);
  });

  // 폼 제출 이벤트 연결
  document.getElementById("form").addEventListener("submit", handleSubmit);
</script>
<%@ include file="bottom.jsp" %>
