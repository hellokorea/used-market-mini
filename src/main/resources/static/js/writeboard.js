document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('writeBoardForm');


    const token = getToken();
    console.log('토큰을 가져왔습니다:', token ? '토큰이 있습니다' : '토큰을 찾을 수 없습니다');


    if (!token) {
        handleUnauthorized();
        return;
    }

    console.log('토큰 찾음!');

    // 사용자 정보를 불러오기
    fetchUserInfo(form);

    form.addEventListener('submit', function(event) {
        event.preventDefault();
        submitBoard();
    });
});

function getToken() {
    return localStorage.getItem('accessToken') || localStorage.getItem('token');
}

function putHeadersAccessToken() {
    const token = getToken();
    return {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
    };
}

function fetchUserInfo(form) {

    fetch('/members/my-info', {
        method: 'GET',
        headers: putHeadersAccessToken()
    })
        .then(response => {
            console.log('Response status:', response.status);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.text();
        })
        .then(text => {
            console.log('Raw response text:', text);
            try {
                return JSON.parse(text);
            } catch (e) {
                console.error('JSON 파싱에 실패:', e);
                throw new Error('응답에서 유효하지 않은 JSON');
            }
        })
        .then(data => {
            if (data.status === 'success' || data.message === '회원 정보 조회 성공' || (data.data && typeof data.data === 'object')) {
                console.log('User 정보 :', data.data || data);
            } else {
                throw new Error(data.message || '사용자 정보를 불러오는 데 실패했습니다.');
            }
        })
        .catch(error => {
            alert('사용자 정보를 불러오는 데 실패했습니다. 다시 로그인해 주세요.');
            //window.location.href = '/auth/login';
        });
}


function submitBoard() {
    const boardData = {
        title: document.getElementById('title').value,
        content: document.getElementById('content').value,
        price: parseInt(document.getElementById('price').value),
        boardStatus: '판매중'
    };

    console.log('Board data:', boardData);

    fetch('/boards', {
        method: 'POST',
        headers: putHeadersAccessToken(),
        body: JSON.stringify(boardData),
        credentials: 'include'
    })
        .then(response => response.text().then(text => {
            if (!response.ok) {
                console.error('오류 응답 본문:', text);
                throw new Error(`서버 응답 오류 (${response.status}): ${text}`);
            }
            try {
                return JSON.parse(text);
            } catch (e) {
                console.error('JSON 파싱에 실패했습니다:', e);
                throw new Error('응답에서 유효하지 않은 JSON');
            }
        }))
        .then(data => {
            console.log('Success:', data);
            alert('게시글이 성공적으로 작성되었습니다.');
            window.location.href = '/boards';
        })
        .catch(error => {
            console.error('Error:', error);
            alert('게시글 작성에 실패했습니다. 오류: ' + error.message);
        });
}

function handleUnauthorized() {
    alert('로그인이 필요합니다.');
    window.location.href = '/auth/login';
}