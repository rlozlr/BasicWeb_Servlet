console.log("comment js 시작합니다.");
console.log("[" + bnoVal + "]번 게시물");

// Controller에서 list 달라고 요청
async function getCommentListFromServer(bno) {
	try {
		const resp = await fetch("/cmt/list/"+bno);	// cmt / list /317
		const result = await resp.json();	// '[{..}, {..}, {..}]'
        return result;
	} catch(error) {
        console.log(error);
    }
}

// 댓글 객체 생성 & 누적해서 list로 => html 구조를 직접 생성
function spreadComentList(result) { // result => 댓글 리스트
    console.log("comment List >> " + result);
    let div = document.getElementById("commentLine");
    div.innerHTML = ""; // 원래 만들어뒀던 구조 지우기

    for(let i = 0; i < result.length; i++) {
        let html = `<div>`;
        html += `<div>${result[i].cno}, ${result[i].writer}, ${result[i].regdate}</div>`;
        html += `<div>`;
        html += `<input type="text" class="cmtText" value="${result[i].content}">`;
        if(result[i].writer == userId) {
            html += `<button type ="button" data-cno="${result[i].cno}" class="cmtModBtn">수정</button>`;
            html += `<button type ="button" data-cno="${result[i].cno}" class="cmtDelBtn">삭제</button><br>`;
        }
        html += `</div></div><br><hr>`;
        div.innerHTML += html;  // 각 댓글 객체를 누적해서 담기
    }
}

// 댓글 뿌리기
function printCommentList(bno) {
    getCommentListFromServer(bno).then(result => {   // cmtList
        console.log(result);
        if(result.length > 0) {
            spreadComentList(result);
        } else {
            let div = document.getElementById("commentLine");
            div.innerHTML = `<div>댓글이 없습니다.</div>`;
        }
    });
}

// 댓글 등록
async function postCommentToServer(cmtData) {
    try {
        const url = "/cmt/post";
        const config = {
            // method, headers, body (body가 없다면 headers도 없다 / get method는 config 안씀 / but 데이터를 보내야 해서 method, header, body 다 필요)
            method : 'post',
            headers : {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtData)
        };

        const resp = await fetch(url, config);
        const result = await resp.text();   // isOk 값을 리턴
        return result;

    } catch (error) {
        console.log(error);
    }
}

document.getElementById('cmtAddBtn').addEventListener('click',()=>{
    const cmtText = document.getElementById('cmtText').value;
    if(cmtText == null || cmtText == ''){
        alert('댓글을 입력해주세요.');
        return false;
    } else {
        // 댓글등록
        let cmtData = {
            bno : bnoVal,
            writer : document.getElementById('cmtWriter').value,
            content : cmtText
        };
        // 댓글 등록 비동기 통신 호출
		postCommentToServer(cmtData).then(result => {
			console.log(result);
			if(result > 0) {
				alert('댓글등록 성공~!!');
                document.getElementById('cmtText').value = '';
			}
			// 댓글출력
            printCommentList(bnoVal);
		})
    }
})