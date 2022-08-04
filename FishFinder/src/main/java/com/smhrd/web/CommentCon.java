package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.domain.Comment;
import com.smhrd.domain.Community;
import com.smhrd.mapper.commentMapper;

@Controller
public class CommentCon {

   @Autowired
   commentMapper cmapper;
   
   // 댓글 조회
   public String commentList(@PathVariable("comment_seq") int comment_seq, Model model) {
   List<Comment> comment = cmapper.commentList(comment_seq);
   model.addAttribute("comment", comment);
   return "view";
   }
   
   // 선택한 community로 이동 
   @RequestMapping("/commList/{comment_seq}")
   public String CommentContent(Model model,
         @PathVariable("comment_seq") int comment_seq) {      
      Comment vo = cmapper.CommentContent(comment_seq);   
      model.addAttribute("comm", vo);   
      return "redirect:/commList/" + comment_seq;
   }
   
   // Comment 등록
   @RequestMapping("/commIn")
   public String commentInsert(Comment cvo) {   
	  System.out.println(cvo.getUser_nick());
      System.out.println(cvo.getArticle_seq());
      cmapper.commentInsert(cvo);
      int article_seq = cvo.getArticle_seq();
      return "redirect:/viewContent/"+article_seq;
   }
      
   // 댓글 수 불러오기
//   public int commentCount(int article_seq, Model model) {
//      int ctotal = cmapper.commentCount(article_seq);
//      model.addAttribute("ctotal",ctotal);
//      return ctotal;
//   }
   
   // Comment 삭제
   @RequestMapping("/commDel/{comment_seq}/{article_seq}")
   public String commentDelete(@PathVariable("comment_seq") int comment_seq, 
         @PathVariable("article_seq") int article_seq, Comment cvo) {
      System.out.println("번호 : " + comment_seq);
      cmapper.commentDelete(comment_seq);
      return "redirect:/viewContent/"+article_seq;
   }   

   // Comment 수정 후 DB에 업데이트
   @RequestMapping("viewContent/commUp/{comment_seq}/{article_seq}")
   public String commentUpdate(Comment cvo, @PathVariable("article_seq") int article_seq,
         @PathVariable("comment_seq") int comment_seq) {      
      cmapper.commentUpdate(cvo);
      return "redirect:/viewContent/"+ article_seq;
   }
   
}