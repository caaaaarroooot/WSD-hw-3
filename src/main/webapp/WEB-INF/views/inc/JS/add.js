const nameInput = document.getElementById("name");
const birthYearInput = document.getElementById("birthyear");
const countryInput = document.getElementById("country");
const positionInput = document.getElementById("position");
const clubInput = document.getElementById("club");
const mainFootInput = document.getElementById("mainfoot");
const myButton = document.getElementById("btn");

const errorMessageName = document.getElementById("error-message-name");
const errorMessageBirthYear = document.getElementById(
    "error-message-birthyear"
);
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
    let isValid = true;

    isValid = validateField(nameInput, errorMessageName) && isValid;
    isValid =
        validateField(
            birthYearInput,
            errorMessageBirthYear,
            validateBirthYear
        ) && isValid;
    isValid =
        validateField(countryInput, errorMessageCountry, validateCountry) &&
        isValid;
    isValid =
        validateField(positionInput, errorMessagePosition, validatePosition) &&
        isValid;
    isValid = validateField(clubInput, errorMessageClub) && isValid;
    isValid = validateField(mainFootInput, errorMessageMainFoot) && isValid;

    return isValid;
}

// 폼 제출 처리
function handleSubmit(event) {
    // event.preventDefault();
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
