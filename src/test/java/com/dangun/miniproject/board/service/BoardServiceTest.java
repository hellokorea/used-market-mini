package com.dangun.miniproject.board.service;

import static org.assertj.core.api.SoftAssertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.*;
import static org.springframework.data.domain.Sort.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import com.dangun.miniproject.board.dto.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.util.ReflectionTestUtils;

import com.dangun.miniproject.board.domain.Board;
import com.dangun.miniproject.board.domain.BoardStatus;
import com.dangun.miniproject.comment.domain.Comment;
import com.dangun.miniproject.member.domain.Member;
import com.dangun.miniproject.fixture.BoardFixture;
import com.dangun.miniproject.fixture.CommentFixture;
import com.dangun.miniproject.board.repository.BoardRepository;
import com.dangun.miniproject.member.repository.MemberRepository;
import com.dangun.miniproject.board.service.impl.BoardServiceImpl;


@ExtendWith(MockitoExtension.class)
class BoardServiceTest {

	@InjectMocks
	private BoardServiceImpl boardServiceImpl;

	@InjectMocks
	private BoardServiceImpl boardService;

	@Mock
	private BoardRepository boardRepository;

	@Mock
	private MemberRepository memberRepository;

	@Nested
	@DisplayName("게시글 상세 조회")
	class GetBoardDetail {

		@Test
		@DisplayName("[성공] 게시글 ID로 상세 정보가 정상적으로 조회된다.")
		void getBoardDetail_success() {
			// given -- 테스트의 상태 설정
			final Member member = mock(Member.class);
			final Board board = BoardFixture.instanceOf(member);

			board.getComments().addAll(new ArrayList<>());

			given(boardRepository.findById(any())).willReturn(Optional.of(board));

			final GetBoardDetailResponse response = GetBoardDetailResponse.from(board);

			given(boardRepository.findBoardById(any())).willReturn(response);

			// when -- 테스트하고자 하는 행동
			final GetBoardDetailResponse result = boardServiceImpl.getBoardDetail(1L);

			// then -- 예상되는 변화 및 결과
			assertSoftly(softAssertions -> {
				softAssertions.assertThat(result).isNotNull();
				softAssertions.assertThat(result.getId()).isEqualTo(response.getId());
				softAssertions.assertThat(result.getTitle()).isEqualTo(response.getTitle());
			});
		}

		@Test
		@DisplayName("[성공] 게시글 작성자 정보와 함께 댓글 목록이 최신순으로 조회된다.")
		void getBoardDetail_commentsAndWriterInfo_success() {
			// given -- 테스트의 상태 설정
			final Member member = mock(Member.class);
			final Board board = mock(Board.class);
			final Comment comment1 = CommentFixture.instanceOf(member, board);
			final Comment comment2 = CommentFixture.instanceOf(member, board);

			when(board.getComments()).thenReturn(List.of(comment1, comment2));
			when(member.getId()).thenReturn(1L);
			when(board.getMember()).thenReturn(member);

			given(boardRepository.findById(any())).willReturn(Optional.of(board));

			final GetBoardDetailResponse response = GetBoardDetailResponse.from(board);

			given(boardRepository.findBoardById(any())).willReturn(response);

			// when -- 테스트하고자 하는 행동
			final GetBoardDetailResponse result = boardServiceImpl.getBoardDetail(1L);

			// then -- 예상되는 변화 및 결과
			assertSoftly(softAssertions -> {
				softAssertions.assertThat(result).isNotNull();
				softAssertions.assertThat(result.getId()).isEqualTo(response.getId());
				softAssertions.assertThat(result.getComments().size()).isEqualTo(response.getComments().size());
			});
		}
	}

	@Nested
	@DisplayName("게시글 목록 조회")
	class GetBoardList {

		@Test
		@DisplayName("[성공] 페이지당 게시글 목록이 10개씩 정상적으로 조회된다.")
		void getBoardList_paging_success() {
			// given -- 테스트의 상태 설정
			final Member member = mock(Member.class);
			final PageRequest pageRequest = PageRequest.of(0, 10);

			final List<Board> boardList = Arrays.asList(
					BoardFixture.instanceOf(member),
					BoardFixture.instanceOf(member)
			);

			final PageImpl<Board> response = new PageImpl<>(boardList);

			given(boardRepository.findAllWithMember(any())).willReturn(response);

			// when -- 테스트하고자 하는 행동
			final Page<GetBoardResponse> result = boardServiceImpl.getBoardList(pageRequest);

			// then -- 예상되는 변화 및 결과
			assertSoftly(softAssertions -> {
				softAssertions.assertThat(result.getTotalPages()).isEqualTo(response.getTotalPages());
				softAssertions.assertThat(result.getTotalElements()).isEqualTo(response.getTotalElements());
				softAssertions.assertThat(result.getContent().size()).isEqualTo(response.getSize());
			});
		}

		@Test
		@DisplayName("[성공] 키워드로 게시글 목록이 정상적으로 검색된다.")
		void getBoardList_searchByKeyword_success() {
			// given -- 테스트의 상태 설정
			final Member member = mock(Member.class);
			final PageRequest pageRequest = PageRequest.of(0, 10, by(Direction.DESC, "createdAt"));

			final List<Board> boardList = List.of(
					BoardFixture.instanceOf(member, "키워드 Title", "content"),
					BoardFixture.instanceOf(member, "일반 Title", "content")
			);

			final List<Board> searchBoardList = boardList.stream()
					.filter(board -> board.getTitle().contains("키워드"))
					.toList();

			final PageImpl<Board> response = new PageImpl<>(searchBoardList);

			given(boardRepository.searchBoardsByKeyword(eq("키워드"), any())).willReturn(response);

			// when -- 테스트하고자 하는 행동
			final Page<GetBoardResponse> result = boardServiceImpl.getBoardList("키워드", pageRequest);

			// then -- 예상되는 변화 및 결과
			assertSoftly(softAssertions -> {
				softAssertions.assertThat(result.getTotalPages()).isEqualTo(1); // 결과가 하나의 페이지에 있어야 함
				softAssertions.assertThat(result.getTotalElements()).isEqualTo(1); // 키워드와 관련 있는 게시글 1개
				softAssertions.assertThat(result.getContent().size()).isEqualTo(1); // 실제 반환된 게시글의 개수 확인
			});
		}

		@Nested
		@DisplayName("작성 게시글 목록 조회")
		class GetMyBoardList {

			@Test
			@DisplayName("[성공] 자신이 작성한 게시글 목록이 정상적으로 조회된다.")
			void getMyBoardList_success() {
				// given -- 테스트의 상태 설정
				final Member member = mock(Member.class);
				final PageRequest pageRequest = PageRequest.of(0, 10);

				final List<Board> boardList = Arrays.asList(
						BoardFixture.instanceOf(member),
						BoardFixture.instanceOf(member)
				);

				final PageImpl<Board> response = new PageImpl<>(boardList);

				given(boardRepository.findAllByMyBoard(any(), any())).willReturn(response);

				// when -- 테스트하고자 하는 행동
				final Page<GetBoardResponse> result = boardServiceImpl.getMyBoardList(1L, pageRequest);

				// then -- 예상되는 변화 및 결과
				assertSoftly(softAssertions -> {
					softAssertions.assertThat(result.getTotalPages()).isEqualTo(response.getTotalPages());
					softAssertions.assertThat(result.getTotalElements()).isEqualTo(response.getTotalElements());
					softAssertions.assertThat(result.getContent().size()).isEqualTo(response.getSize());
				});
			}
		}
	}


	@Test
	@DisplayName("게시글 생성")
	public void testCreateBoard() {
		// Given
		Long memberId = 1L;
		Long boardId = 1L; // 새로 생성된 게시글의 ID

		// Mock Member
		Member member = new Member();
		ReflectionTestUtils.setField(member, "id", memberId);

		// Request 객체 생성
		WriteBoardRequest request = new WriteBoardRequest("제목", "내용");

		Board board = Board.builder()
				.title(request.getTitle())
				.content(request.getContent())
				.build();
		ReflectionTestUtils.setField(board, "id", boardId); // 새로 생성된 게시글 ID 설정

		when(memberRepository.findById(memberId)).thenReturn(Optional.of(member));
		when(boardRepository.save(any(Board.class))).thenReturn(board);

		// When
		WriteBoardResponse response = boardService.writeBoard(request, memberId);

		// Then
		assertNotNull(response);
		assertEquals("BOARD-S001", response.getCode());
		assertEquals("Board Write Success", response.getMessage());
		assertEquals(boardId, response.getData().getId());
		assertNotNull(response.getTimestamp());

		verify(memberRepository).findById(memberId);
		verify(boardRepository).save(any(Board.class));
	}



	@Test
	@DisplayName("존재하지 않는 작성자에 의해 게시글 생성")
	public void testCreateBoardWhenMemberNotFound() {
		// Given
		Long memberId = 99L;
		WriteBoardRequest request = new WriteBoardRequest("제목", "내용");

		when(memberRepository.findById(memberId)).thenReturn(Optional.empty());

		// When & Then
		assertThrows(RuntimeException.class, () -> boardService.writeBoard(request,memberId), "Member not found");
	}

	@Test
	@DisplayName("게시글 수정")
	public void testUpdateBoard() {
		// Given
		Long boardId = 1L;
		Long memberId = 1L;

		Member member = new Member();
		ReflectionTestUtils.setField(member, "id", memberId);

		Board existingBoard = Board.builder()
				.title("기존 제목")
				.content("기존 내용")
				.price(500)
				.boardStatus(BoardStatus.판매중)
				.member(member)
				.build();

		ReflectionTestUtils.setField(existingBoard, "id", boardId);

		UpdateBoardRequest request = new UpdateBoardRequest("새 제목");

		when(boardRepository.findById(boardId)).thenReturn(Optional.of(existingBoard));
		when(memberRepository.findById(memberId)).thenReturn(Optional.of(member));

		// When
		UpdateBoardResponse response = boardService.updateBoard(boardId, request, memberId);

		// Then
		assertNotNull(response); // 응답 확인
		assertEquals("BOARD-S002", response.getCode());
		assertEquals("Board Update Success", response.getMessage());
		assertNotNull(response.getData());
		assertEquals("새 제목", response.getData().getContent());
		assertNotNull(response.getTimestamp());

		verify(boardRepository).findById(boardId);
		verify(memberRepository).findById(memberId);

		// 업데이트 되었는지
		assertEquals("새 제목", existingBoard.getContent());
		assertEquals("기존 제목", existingBoard.getTitle());
		assertEquals(500, existingBoard.getPrice());
		assertEquals(BoardStatus.판매중, existingBoard.getBoardStatus());
	}





	@Test
	@DisplayName("존재하지 않는 회원이 수정")
	public void testUpdateBoardWithNonExistentMember() {
		// Given
		Long boardId = 1L;
		Long nonExistentMemberId = 999L;
		UpdateBoardRequest request = new UpdateBoardRequest("새 제목");

		Member existingMember = new Member();
		ReflectionTestUtils.setField(existingMember, "id", nonExistentMemberId);

		Board existingBoard = Board.builder()
				.content("기존 내용")
				.member(existingMember)
				.price(1000)
				.boardStatus(BoardStatus.판매중)
				.title("기존 제목")
				.build();

		ReflectionTestUtils.setField(existingBoard, "id", boardId);

		when(boardRepository.findById(boardId)).thenReturn(Optional.of(existingBoard));

		// When
		RuntimeException thrown = assertThrows(RuntimeException.class, () -> {
			boardService.updateBoard(boardId, request, nonExistentMemberId);
		});
		// Then
		assertEquals("User Not Found", thrown.getMessage());
	}



	@Test
	@DisplayName("토큰이 없을 때 수정 요청")
	public void testUpdateBoardWithNoToken() {
		// Given
		Long boardId = 1L;
		Long memberId = null; // 인증되지 않은 사용자 (토큰이 없음)
		UpdateBoardRequest request = new UpdateBoardRequest("새 제목");

		Board existingBoard = Board.builder()
				.content("기존 내용")
				.member(new Member()) // 임시 회원 설정
				.price(1000)
				.boardStatus(BoardStatus.판매중)
				.title("기존 제목")
				.build();

		ReflectionTestUtils.setField(existingBoard, "id", boardId);

		// When
		RuntimeException thrown = assertThrows(RuntimeException.class, () -> {
			boardService.updateBoard(boardId, request, memberId);
		});
		// Then
		assertEquals("Token Not Exist", thrown.getMessage());
	}



	@Test
	@DisplayName("존재하지 않는 게시글에 대한 수정")
	public void testUpdateNonExistentBoard() {
		// Given
		Long nonExistentBoardId = 999L;
		UpdateBoardRequest request = new UpdateBoardRequest("새 제목");

		when(boardRepository.findById(nonExistentBoardId)).thenReturn(Optional.empty());

		// When
		RuntimeException thrown = assertThrows(RuntimeException.class, () -> {
			boardService.updateBoard(nonExistentBoardId, request, 1L);
		});
		// Then
		assertEquals("Board not found", thrown.getMessage());
	}





	@Test
	@DisplayName("게시글 삭제 성공")
	public void testDeleteBoard() {
		// Given
		Long boardId = 1L;
		Long memberId = 1L;

		Member member = Member.builder()
				.email("test@example.com")
				.nickname("테스트닉네임")
				.password("password")
				.build();
		ReflectionTestUtils.setField(member, "id", memberId);

		Board board = Board.builder()
				.title("제목")
				.content("내용")
				.price(1000)
				.boardStatus(BoardStatus.판매중)
				.member(member)
				.build();
		ReflectionTestUtils.setField(board, "id", boardId);

		when(boardRepository.findById(boardId)).thenReturn(Optional.of(board));

		// When
		DeleteBoardResponse response = boardService.deleteBoard(boardId, memberId);

		// Then
		verify(boardRepository).findById(boardId);
		verify(boardRepository).delete(board);

		assertNotNull(response);
		assertEquals("BOARD-S001", response.getCode());
		assertEquals("Board Delete Success", response.getMessage());
	}

	@Test
	@DisplayName("존재하지 않는 회원이 게시글 삭제 시도")
	public void testDeleteBoardByNonExistentMember() {
		// Given
		Long boardId = 999L;
		Long nonExistentMemberId = 999L;

		Member existingMember = new Member();
		ReflectionTestUtils.setField(existingMember, "id", 1L);

		Board board = Board.builder()
				.title("제목")
				.content("내용")
				.price(1000)
				.boardStatus(BoardStatus.판매중)
				.member(existingMember)
				.build();
		ReflectionTestUtils.setField(board, "id", boardId);

		when(boardRepository.findById(boardId)).thenReturn(Optional.of(board));

		// When & Then
		assertThrows(RuntimeException.class, () ->
				boardService.deleteBoard(boardId, nonExistentMemberId)
		);

		verify(boardRepository).findById(boardId);
		verify(boardRepository, never()).delete(any(Board.class));
	}
}