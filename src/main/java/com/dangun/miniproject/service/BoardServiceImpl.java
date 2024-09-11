package com.dangun.miniproject.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dangun.miniproject.domain.Board;
import com.dangun.miniproject.domain.Comment;
import com.dangun.miniproject.dto.GetBoardDetailResponse;
import com.dangun.miniproject.dto.GetBoardResponse;
import com.dangun.miniproject.dto.GetCommentResponse;
import com.dangun.miniproject.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BoardServiceImpl implements BoardService {

	private final BoardRepository boardRepository;

	/**
	 * 게시글 상세 조회
 	 */
	@Override
	public GetBoardDetailResponse getBoardDetail(final Long boardId) {

		// TODO: ExceptionHandler 로 예외 처리 수정
		final Board board = boardRepository.findById(boardId)
			.orElseThrow(IllegalArgumentException::new);

		final GetBoardDetailResponse boardResponse = GetBoardDetailResponse.from(board);

		for (Comment comment : board.getComments()) {
			final boolean isBoardWriter = checkBoardWriter(board, comment);
			final GetCommentResponse commentResponse = GetCommentResponse.from(comment, isBoardWriter);

			boardResponse.getComments().add(commentResponse);
		}

		return boardResponse;
	}

	/**
	 * 게시글 목록 조회
	 */
	@Override
	public Page<GetBoardResponse> getBoardList(final Pageable pageable) {

		final PageRequest pageRequest = PageRequest.of(0, 10);
		final Page<Board> boards = boardRepository.findAllWithMember(pageRequest);

		return boards.map(GetBoardResponse::from);
	}

	/**
	 * 게시글 키워드 검색
	 */
	@Override
	public Page<GetBoardResponse> getBoardList(final String keyword, final Pageable pageable) {

		final PageRequest pageRequest = PageRequest.of(0, 10);
		final Page<Board> boards = boardRepository.searchBoardsByKeyword(keyword, pageRequest);

		return boards.map(GetBoardResponse::from);
	}

	/**
	 * 작성 게시글 목록 조회
	 */
	@Override
	public Page<GetBoardResponse> getMyBoardList(final Long memberId, final Pageable pageable) {

		final PageRequest pageRequest = PageRequest.of(0, 10);
		final Page<Board> boards = boardRepository.findAllByMyBoard(memberId, pageRequest);

		return boards.map(GetBoardResponse::from);
	}

	// 게시글 작성자인지 확인
	private boolean checkBoardWriter(final Board board, final Comment comment) {

		final Long boardWriter = board.getMember().getId();
		final Long commentWriter = comment.getMember().getId();

		return boardWriter.equals(commentWriter);
	}

}
