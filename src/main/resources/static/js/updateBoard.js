document.addEventListener('DOMContentLoaded', function() {
    const token = 'token';
    const boardId = new URLSearchParams(window.location.search).get('id');

    if (!token) {
        handleUnauthorized();
        return;
    }

    if (!boardId) {
        handleError({ message: '게시글 ID가 제공되지 않았습니다.' });
        return;
    }

    fetchBoardAndUserData(token, boardId)
        .then(([boardResponse, userData]) => {
            if (!boardResponse || !boardResponse.data || !userData) {
                throw new Error('데이터를 불러오는데 실패했습니다.');
            }
            const boardData = boardResponse.data;
            if (boardData.memberId !== userData.id) {
                handleUnauthorizedEdit();
                return;
            }
            populateForm(boardData);
            setupEventListeners(token, boardId);
        })
        .catch(handleError);
});

function fetchBoardAndUserData(token, boardId) {
    return Promise.all([
        fetchData(`/boards/${boardId}`, token),
        fetchData('/members/my-info', token)
    ]);
}

function fetchData(url, token) {
    return fetch(url, {
        headers: { 'Authorization': `Bearer ${token}` }
    }).then(handleResponse);
}

function handleResponse(response) {
    if (!response.ok) {
        throw { status: response.status, response };
    }
    return response.json();
}

function populateForm(boardData) {
    console.log('Populating form with data:', boardData);
    document.getElementById('title').value = boardData.title || '';
    document.getElementById('content').value = boardData.content || '';
    document.getElementById('price').value = boardData.price || '';
    document.getElementById('boardStatus').value = boardData.boardStatus || '판매중';
}

function setupEventListeners(token, boardId) {
    const form = document.getElementById('updateBoardForm');
    const deleteBtn = document.getElementById('deleteButton');

    if (form) {
        form.addEventListener('submit', event => {
            event.preventDefault();
            updateBoard(token, boardId);
        });
    } else {
        console.error('Update form not found');
    }

    if (deleteBtn) {
        deleteBtn.addEventListener('click', event => {
            event.preventDefault();
            if (window.confirm('정말 삭제하시겠습니까?')) {
                deleteBoard(token, boardId);
            }
        });
    } else {
        console.error('Delete button not found');
    }
}

function updateBoard(token, boardId) {
    const updatedData = {
        title: document.getElementById('title').value,
        content: document.getElementById('content').value,
        price: parseInt(document.getElementById('price').value),
        boardStatus: document.getElementById('boardStatus').value
    };

    fetch(`/boards/${boardId}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify(updatedData)
    })
        .then(handleResponse)
        .then(() => {
            alert('게시글이 성공적으로 수정되었습니다.');
            window.location.href = `/boards/${boardId}`;
        })
        .catch(error => {
            console.error('게시글 수정 중 오류 발생:', error);
            alert('게시글 수정 중 문제가 발생했습니다.');
        });
}

function deleteBoard(token, boardId) {
    fetch(`/boards/${boardId}`, {
        method: 'DELETE',
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
        .then(handleResponse)
        .then(() => {
            alert('게시글이 삭제되었습니다.');
            window.location.href = '/boards';
        })
        .catch(error => {
            console.error('게시글 삭제 중 오류 발생:', error);
            alert('게시글 삭제 중 문제가 발생했습니다.');
        });
}

function handleUnauthorized() {
    alert('로그인이 필요합니다.');
    window.location.href = '/login';
}

function handleUnauthorizedEdit() {
    alert('해당 게시글의 작성자만 수정할 수 있습니다.');
    window.location.href = '/boards';
}

function handleError(error) {
    console.error('오류 발생:', error);
    alert('오류가 발생했습니다. 오류: ' + (error.message || '알 수 없는 오류'));
}