create table board
( 
	idx int not null auto_increment,
	title varchar(100),
	writer varchar(100),
	content varchar(2000),
	indate datetime default now(),
	count int default 0,
	
	primary key(idx)
);

-- alt + x (실행 단축키)

insert into board(title, writer, content)
values('스프링 게시판', '김승현', '즐거운 게시판 만들기');

delete from board;

insert into visit(v_date) values(NOW());

select count(*) as totalCnt from visit;

select count(*) as todayCnt from visit
        where v_date=now();
               

select count(*) as todayCnt from visit
        where v_date > DATE_ADD(now(), interval -24 hour)

SELECT * FROM community_info ORDER BY article_date DESC
				
SELECT COUNT(article_seq) FROM comment where user_num = (select user_num from user_info)	

SELECT COUNT(comment_seq) FROM comment 
        where article_seq = (select article_seq from community_info where article_seq=1)
        
select * from comment where article_seq = 1
			
update question_board set q_status=1 
        where q_seq=(select q_seq from question_board where q_seq (insert into answer_info(q_seq) values (1)))			
        
update question_board set q_status=1 where q_seq=1

INSERT INTO comment(article_seq, user_num,comment_content,comment_date)
VALUES(1, 2, '댓르르르르르르ㅡ르르르르르르르르르르르르르르르으느므ㅡㄴ아림나허ㅣㅇ나허ㅣㅏ넣미아허ㅣㅏ가나나다라라하마나아하ㅏ바사ㅏ아하ㅏ나다사아ㅏ카아ㅏ남하아밯',NOW());


insert into visit(v_date) values(NOW())
