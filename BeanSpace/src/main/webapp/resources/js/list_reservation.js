
  

    // 날짜 및 시간 필터링 기능
    document.getElementById('datetimeFilter').addEventListener('change', function() {
        const selectedDateTime = this.value; // 입력된 날짜 및 시간
        const rows = document.querySelectorAll('#reservationTable tr');

        rows.forEach(row => {
            const reservationDateTime = row.cells[1].textContent; // 예약 날짜-시간

            // 날짜가 일치하거나 필터가 비어 있으면 표시
            if (reservationDateTime.startsWith(selectedDateTime) || selectedDateTime === '') {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });


$(function(){



});

function renderTable(data) {
    const table = document.getElementById("selectFilteredTable");
    table.innerHTML = "<tr><th>시설명</th>  <th>예약 날짜</th><th>주차 시간</th><th>출차 시간</th></tr>"; // 테이블 초기화
    data.forEach(item => {
        const row = table.insertRow();
        row.insertCell(0).innerText = item.name;
        row.insertCell(1).innerText = item.age;
    });
}



function filterBySelect() {
    const ageRange = document.getElementById("datetimeFilter").value;
    let filtered = sessionData;
    if (ageRange !== "all") {
        filtered = sessionData.filter(item => item.age >= parseInt(ageRange));
    }
    renderTable(filtered);
}



    document.addEventListener('DOMContentLoaded', function () {
        // 메뉴 열기
        document.getElementById('button_menu').addEventListener('click', function () {
            document.querySelector('aside').classList.add('active');
        });

        // 메뉴 닫기
        document.getElementById('closeMenu').addEventListener('click', function () {
            document.querySelector('aside').classList.remove('active');
        });
    });