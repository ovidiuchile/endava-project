package com.endava.learning.controller;

import com.endava.learning.model.Answer;
import com.endava.learning.service.AnswerService;
import com.endava.learning.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class AnswerController {

    @Autowired
    private AnswerService answerService;

    @Autowired
    private QuestionService questionService;

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/selectedAnswers", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpEntity<Resources<Resource<Float>>> getScore(@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id,
                                                                        @RequestParam(value = "selectedAnswers") String selectedAnswers){
        List<Float> correctAnswers = new ArrayList<>();
        List<Answer> answers = answerService.getSelectedAnswers(selectedAnswers);
        Float score = answerService.getScore(answers);
        correctAnswers.add(score);
        correctAnswers.addAll(answerService.getCorrectAnswers());
;        Resources<Resource<Float>> answerResource = Resources.wrap(correctAnswers);

        return new ResponseEntity<>(answerResource, HttpStatus.OK);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}/answers", method = RequestMethod.GET)
    public HttpEntity<Resources<Resource<Answer>>> getAnswersByQuestion(@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id,
                                                                       @PathVariable("question_id") Long question_id){
        List<Answer> answers = answerService.getAnswersByQuestionId(question_id);
        Resources<Resource<Answer>> answerResource = Resources.wrap(answers);

        return new ResponseEntity<>(answerResource, HttpStatus.OK);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}/answers", method = RequestMethod.POST, consumes = "application/json")
    public HttpEntity<Resource<Answer>> addAnswer(@PathVariable Long technology_id, @PathVariable Long topic_id, @PathVariable Long question_id, @RequestBody Answer answer){

        answer.setQuestion(questionService.getQuestionById(question_id));
        answer.setId(((long)(Math.random()*1000000000)));
        Answer createdAnswer = answerService.addAnswer(answer);

        Resource<Answer> answerResource = new Resource<>(createdAnswer);
        return new ResponseEntity<>(answerResource, HttpStatus.CREATED);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}/answers/{answer_id}", method = RequestMethod.PUT, consumes = "application/json")
    public HttpEntity<Resource<Answer>> updateAnswer(@PathVariable Long technology_id, @PathVariable Long topic_id,
                                                         @PathVariable Long question_id, @PathVariable Long answer_id, @RequestBody Answer answer){

        Answer existingAnswer = answerService.getAnswerById(answer_id);

        if(answer.getId() == null){
            answer.setId(answer_id);
        }
        if(answer.getQuestion() == null){
            answer.setQuestion(existingAnswer.getQuestion());
        }
        if(answer.getAnswer_text() == null){
            answer.setAnswer_text(existingAnswer.getAnswer_text());
        }
        if(answer.isCorrect() == null){
            answer.setCorrect(existingAnswer.isCorrect());
        }

        Answer updatedAnswer = answerService.updateAnswer(answer);

        Resource<Answer> answerResource = new Resource<>(updatedAnswer);
        return new ResponseEntity<>(answerResource, HttpStatus.OK);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}/answers/{answer_id}", method = RequestMethod.DELETE, consumes = "application/json")
    public HttpEntity<Resource<Answer>> deleteAnswer(@PathVariable Long technology_id, @PathVariable Long topic_id,
                                                         @PathVariable Long question_id, @PathVariable Long answer_id){
        answerService.deleteAnswer(answer_id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
