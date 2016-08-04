package com.endava.learning.controller;

import com.endava.learning.model.Question;
import com.endava.learning.service.QuestionService;
import com.endava.learning.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private TopicService topicService;

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions", method = RequestMethod.GET)
    public HttpEntity<Resources<Resource<Question>>> getQuestionsByTopic(@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id){
        List<Question> questions = questionService.getQuestionsByTopic(topic_id);
        Resources<Resource<Question>> questionResource = Resources.wrap(questions);

        return new ResponseEntity<>(questionResource, HttpStatus.OK);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions", method = RequestMethod.POST, consumes = "application/json")
    public HttpEntity<Resource<Question>> addQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id, @RequestBody Question question){

        question.setTopic(topicService.getTopicByID(topic_id));
        question.setId(((long)(Math.random()*1000000000)));
        Question createdQuestion = questionService.addQuestion(question);

        Resource<Question> questionResource = new Resource<>(createdQuestion);
        return new ResponseEntity<>(questionResource, HttpStatus.CREATED);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}", method = RequestMethod.PUT, consumes = "application/json")
    public HttpEntity<Resource<Question>> updateQuestion(@PathVariable Long technology_id,
                                                         @PathVariable Long topic_id, @PathVariable Long question_id, @RequestBody Question question){

        Question existingQuestion = questionService.getQuestionById(question_id);

        if(question.getId() == null){
            question.setId(question_id);
        }
        if(question.getTopic() == null){
            question.setTopic(existingQuestion.getTopic());
        }
        if(question.getQuestion_text() == null){
            question.setQuestion_text(existingQuestion.getQuestion_text());
        }
        if(question.getStart_date() == null){
            question.setStart_date(existingQuestion.getStart_date());
        }
        if(question.getEnd_date() == null){
            question.setEnd_date(existingQuestion.getEnd_date());
        }

        Question updatedQuestion = questionService.updateQuestion(question);

        Resource<Question> questionResource = new Resource<>(updatedQuestion);
        return new ResponseEntity<>(questionResource, HttpStatus.OK);
    }

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}", method = RequestMethod.DELETE, consumes = "application/json")
    public HttpEntity<Resource<Question>> deleteQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id, @PathVariable Long question_id){
        questionService.deleteQuestion(question_id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
