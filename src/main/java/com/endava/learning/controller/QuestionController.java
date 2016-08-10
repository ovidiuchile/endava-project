package com.endava.learning.controller;

import java.util.List;

import javax.mail.MethodNotSupportedException;
import javax.servlet.http.HttpServletRequest;

import com.endava.learning.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.Answer;
import com.endava.learning.model.Question;
import com.endava.learning.service.AnswerService;
import com.endava.learning.service.QuestionService;
import com.endava.learning.service.TopicService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private TopicService topicService;

	@Autowired
	private AnswerService answerService;

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Question>>> getQuestionsByTopic(
			@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id) {
		List<Question> questions = questionService.getQuestionsByTopic(topic_id);
		Resources<Resource<Question>> questionResource = Resources.wrap(questions);

		return new ResponseEntity<>(questionResource, HttpStatus.OK);
	}

    @RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}", method = RequestMethod.GET)
    public HttpEntity<Resource<Question>> getQuestionById(
            @PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id, @PathVariable("question_id") Long question_id) {
        Question questions = questionService.getQuestionById(question_id);
        Resource<Question> questionResource = new Resource<>(questions);

        return new ResponseEntity<>(questionResource, HttpStatus.OK);
    }

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions", method = RequestMethod.POST, consumes = "application/json")
	public HttpEntity<Resource<Question>> addQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id,
			@RequestBody Question question) {

		question.setTopic(topicService.getTopicByID(topic_id));
		question.setId(((long) (Math.random() * 1000000000)));
		Question createdQuestion = questionService.addQuestion(question);

		Resource<Question> questionResource = new Resource<>(createdQuestion);
		return new ResponseEntity<>(questionResource, HttpStatus.CREATED);
	}

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}", method = RequestMethod.DELETE, consumes = "application/json")
	public HttpEntity<Resource<Question>> deleteQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id,
			@PathVariable Long question_id) {
		questionService.deleteQuestion(question_id);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(value = "add_question", method = RequestMethod.GET)
	public ModelAndView getAdd_question() {
		ModelAndView model = new ModelAndView();
		model.setViewName("add_question");
		return model;
	}

	@RequestMapping(value = "add_question", method = RequestMethod.POST)
	public ModelAndView addQuestion(HttpServletRequest request) {

		boolean existsCorrectAnswer = false;
		int numberOfAnswers = 0;
		for (int i = 0; i < 5; i++) {
			if (request.getParameter("answer " + (i + 1)) != null) {
				numberOfAnswers++;

				if (request.getParameter("answer" + (i + 1)).equals("correct")) {
					existsCorrectAnswer = true;
				}
			}
		}
		if (existsCorrectAnswer && numberOfAnswers >= 2) {

			Question question = new Question();
			question.setQuestion_text(request.getParameter("question"));
			question.setStart_date(request.getParameter("start_date"));
			question.setEnd_date(request.getParameter("end_date"));

			try {
				this.addQuestion(Long.parseLong(request.getParameter("technology")),
						Long.parseLong(request.getParameter("topic")), question);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			question = questionService.getQuestionById(question.getId());
			Answer answer;
			for (int i = 0; i < 5; i++) {
				answer = new Answer();
				if (request.getParameter("answer " + (i + 1)) != null) {
					answer.setAnswer_text(request.getParameter("answer " + (i + 1)));
					answer.setQuestion(question);
					answer.setId(((long) (Math.random() * 1000000000)));
					if (request.getParameter("answer" + (i + 1)).equals("correct")) {
						answer.setCorrect(true);
					} else {
						answer.setCorrect(false);
					}
					answerService.addAnswer(answer);
				}
			}
			request.setAttribute("error", null);
            request.setAttribute("success", "Question added");
		}
		else{
			request.setAttribute("error", "Your question must have at least 1 correct answer");
            request.setAttribute("success", null);
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("add_question");
		return model;
	}

	@RequestMapping(value = "update_question", method = RequestMethod.GET)
	public ModelAndView selectQuestionToBeUpdated() {

        ModelAndView model = new ModelAndView();
        model.setViewName("update_question");
        return model;
	}

    @RequestMapping(value = "update_question", method = RequestMethod.POST)
    public ModelAndView updateQuestion(HttpServletRequest request){

        if(request.getParameter("_method").equals("PUT")) {

            Question existingQuestion = questionService.getQuestionById(Long.parseLong(request.getParameter("question")));

            existingQuestion.setTopic(topicService.getTopicByID(Long.parseLong(request.getParameter("topic"))));
            existingQuestion.setQuestion_text(request.getParameter("edited_question"));
            existingQuestion.setStart_date(request.getParameter("start_date"));
            existingQuestion.setEnd_date(request.getParameter("end_date"));

            Question updatedQuestion = questionService.updateQuestion(existingQuestion);

            List<Answer> answers = answerService.getAnswersByQuestionId(Long.parseLong(request.getParameter("question")));
            int nrOfAnswers = answers.size();
            answers.get(0).setQuestion(updatedQuestion);
            answers.get(0).setAnswer_text(request.getParameter("answer 1"));
            if ("correct".equals(request.getParameter("answer1"))) {
                answers.get(0).setCorrect(true);
            } else {
                answers.get(0).setCorrect(false);
            }
            Answer updatedAnswer = answerService.updateAnswer(answers.get(0));
            answers.get(1).setQuestion(updatedQuestion);
            answers.get(1).setAnswer_text(request.getParameter("answer 2"));
            if ("correct".equals(request.getParameter("answer2"))) {
                answers.get(1).setCorrect(true);
            } else {
                answers.get(1).setCorrect(false);
            }
            updatedAnswer = answerService.updateAnswer(answers.get(1));
            if (nrOfAnswers >= 3) {
                answers.get(2).setQuestion(updatedQuestion);
                answers.get(2).setAnswer_text(request.getParameter("answer 3"));
                if ("correct".equals(request.getParameter("answer3"))) {
                    answers.get(2).setCorrect(true);
                } else {
                    answers.get(2).setCorrect(false);
                }
                updatedAnswer = answerService.updateAnswer(answers.get(2));
            }
            if (nrOfAnswers >= 4) {
                answers.get(3).setQuestion(updatedQuestion);
                answers.get(3).setAnswer_text(request.getParameter("answer 4"));
                if ("correct".equals(request.getParameter("answer4"))) {
                    answers.get(3).setCorrect(true);
                } else {
                    answers.get(3).setCorrect(false);
                }
                updatedAnswer = answerService.updateAnswer(answers.get(3));
            }
            if (nrOfAnswers >= 5) {
                answers.get(4).setQuestion(updatedQuestion);
                answers.get(4).setAnswer_text(request.getParameter("answer 5"));
                if ("correct".equals(request.getParameter("answer5"))) {
                    answers.get(4).setCorrect(true);
                } else {
                    answers.get(4).setCorrect(false);
                }
                updatedAnswer = answerService.updateAnswer(answers.get(4));
            }


        }
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/update_question");
        return model;
    }

	@RequestMapping(value = "delete_question", method = RequestMethod.GET)
	public ModelAndView deleteQuestion() {
		ModelAndView model = new ModelAndView();
		model.setViewName("delete_question");
		return model;
	}

	@RequestMapping(value = "delete_question", method = RequestMethod.POST)
	public ModelAndView deleteQuestion(@RequestParam("technology") String technologyId,
			@RequestParam("topic") String topicId, @RequestParam("question") String questionId,
			@RequestParam("_method") String method) {
		if (method.equals("DELETE")) {
			questionService.deleteQuestion(Long.parseLong(questionId));
		} else {
			try {
				throw new MethodNotSupportedException();
			} catch (MethodNotSupportedException e) {
				e.printStackTrace();
			}
		}

		ModelAndView model = new ModelAndView();
		model.setViewName("delete_question");
		return model;

	}

}
