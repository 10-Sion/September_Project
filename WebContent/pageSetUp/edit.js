    // 수정 버튼 클릭 시 폼 보이기
    document.querySelector('.editBtn').addEventListener('click', function() {
        const editForm = document.querySelector('.edit_form');
        editForm.style.display = 'block';
        
        // 원래 정보 숨기기
        const table = document.querySelector('table');
        table.style.display = 'none';
        
        // 수정 버튼 숨기기
        this.style.display = 'none';
    });
    
    // 취소 버튼 클릭 시 폼 숨기고 원래 정보 다시 표시
    document.querySelector('.edit_cancel').addEventListener('click', function(event) {
        event.preventDefault(); // 폼 전송 방지
        
        const editForm = document.querySelector('.edit_form');
        editForm.style.display = 'none';
        
        // 원래 정보 표시
        const table = document.querySelector('table');
        table.style.display = 'table';
        
        // 수정 버튼 다시 표시
        const editButton = document.querySelector('.editBtn');
        editButton.style.display = 'block';
    });
    
    // 수정 폼 제출 시 데이터 갱신
    document.querySelector('.edit_form').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼 전송 방지
        
        // 폼에서 입력된 데이터 가져오기
        const pw = document.querySelector('#pw').value;
        const name = document.querySelector('#name').value;
        const addr = document.querySelector('#addr').value;
        const phone = document.querySelector('#phone').value;
        const tel = document.querySelector('#tel').value;
        const email = document.querySelector('#email').value;
        
        // Ajax를 사용하여 서버로 데이터 보내고 업데이트
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/Employee/employee/update', true); // 업데이트를 처리할 서버 엔드포인트 지정
        
        // 서버로 보낼 데이터 설정
        const data = new FormData();
        data.append('pw', pw);
        data.append('name', name);
        data.append('addr', addr);
        data.append('phone', phone);
        data.append('tel', tel);
        data.append('email', email);
        
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버로부터 응답을 받은 후 처리할 로직
                // 응답 내용에 따라 성공 또는 실패 메시지를 표시할 수 있습니다.
                
                // 성공 시 데이터 업데이트
                const response = JSON.parse(xhr.responseText);
                if (response.success) {
                    // 테이블 업데이트
                    const table = document.querySelector('table');
                    table.style.display = 'table';
                    const cells = table.querySelectorAll('td');
                    
                    // 각 셀에 데이터 반영
                    cells[1].textContent = pw;
                    cells[3].textContent = name;
                    cells[5].textContent = addr;
                    cells[7].textContent = phone;
                    cells[9].textContent = tel;
                    cells[11].textContent = email;
                    
                    // 수정 버튼 다시 표시
                    const editButton = document.querySelector('.editBtn');
                    editButton.style.display = 'block';
                    
                    // 수정 폼 숨기기
                    const editForm = document.querySelector('.edit_form');
                    editForm.style.display = 'none';
                } else {
                    // 실패 메시지 표시 또는 처리
                }
            }
        };
        
        // 데이터를 서버로 전송
        xhr.send(data);
    });
