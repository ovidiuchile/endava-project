package com.endava.learning.controller;

import com.endava.learning.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @RequestMapping(value = "/searchResults", method = RequestMethod.GET)
    public ModelAndView showResults(@RequestParam(value = "s") String s) {
        ModelAndView model = new ModelAndView("results");

        List<Long> results = searchService.getSearchResults(s);

        model.addObject("results", results);

        return model;
    }

    @RequestMapping(value = "/advancedSearchResults", method = RequestMethod.GET)
    public ModelAndView showAdvancedResults(@RequestParam(value = "s") String s, @RequestParam(value = "param") String param) {
        ModelAndView model = new ModelAndView("results");

        List<Long> results = searchService.getAdvancedSearchResults(s, param);

        model.addObject("results", results);

        return model;
    }

}
