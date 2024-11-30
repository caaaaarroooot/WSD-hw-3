const playerData = {
    1001: {
        name: "손흥민",
        nationality: "대한민국",
        age: 30,
        team: "토트넘",
        position: "LW",
        foot: "양발",
    },
    1002: {
        name: "김민재",
        nationality: "대한민국",
        age: 27,
        team: "바이에른 뮌헨",
        position: "CB",
        foot: "오른발",
    },
    1003: {
        name: "이지윤",
        nationality: "대한민국",
        age: 27,
        team: "FCL",
        position: "GK",
        foot: "오른발",
    },
    1004: {
        name: "박지성",
        nationality: "대한민국",
        age: 27,
        team: "맨체스터 유나이티드",
        position: "MF",
        foot: "오른발",
    },
};

const urlParams = new URLSearchParams(window.location.search);
const playerId = urlParams.get("id");

console.log(playerId);

const player = playerData[playerId];

if (player) {
    document.getElementById("name").value = player.name;
    document.getElementById("birthyear").value = player.age;
    document.getElementById("club").value = player.team;
    document.getElementById("country").value = player.nationality;
    document.getElementById("position").value = player.position;
    document.getElementById("mainfoot").value = player.foot;
}
