package com.endava.learning.model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "questions")
public class Question implements Comparable{

    @Id
    @Column(name = "question_id", updatable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "topic_id")
    private Topic topic;

    @Column(name = "question_text")
    private String question_text;

    @Column(name = "start_date")
    private String start_date;

    @Column(name = "end_date")
    private String end_date;

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public String getQuestion_text() {
        return question_text;
    }

    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

	@Override
	public int compareTo(Object question) {
		if(!(question instanceof Question)){
			throw new ClassCastException();
		}
		else{
			if(((Question)question).getId() == this.id){
				return 0;
			}
			else{
				if(this.id < ((Question)question).getId()){
					return -1;
				}
				else{
					return 1;
				}
			}
		}
	}

}
