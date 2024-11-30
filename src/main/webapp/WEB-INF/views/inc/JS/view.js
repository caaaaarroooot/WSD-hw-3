// URL에서 id를 가져옴
const urlParams = new URLSearchParams(window.location.search);
console.log(urlParams);
const playerId = urlParams.get("id");

console.log(playerId);
if (playerId) {
    // document.getElementById("edit-link").href = "./edit.jsp?id=" + playerId;
    document.getElementById("edit-link").href = "./edit.jsp?id=" + playerId;

} else {
    // id가 없을 경우 기본 링크로 설정
    document.getElementById("edit-link").href = "./edit.jsp";
}

// playerData에서 id에 해당하는 데이터 가져오기
const player = playerData[playerId];

// 데이터를 화면에 표시
if (player) {
    document.getElementById("name").value = player.name;
    document.getElementById("birthyear").value = player.age;
    document.getElementById("club").value = player.team;
    document.getElementById("country").value = player.nationality;
    document.getElementById("position").value = player.position;
    document.getElementById("mainfoot").value = player.foot;
} else {
    document.getElementById("player-name").innerText =
        "플레이어 정보를 찾을 수 없습니다.";
}
