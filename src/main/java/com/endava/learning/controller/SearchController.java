package com.endava.learning.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.endava.learning.model.Material;
import com.endava.learning.service.SearchService;


@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @RequestMapping(value = "/searchResults", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpEntity<Resources<Resource<Material>>> showResults(@RequestParam(value = "s") String s) {
        List<Material> results = searchService.getSearchResults(s);

        Resources<Resource<Material>> materialsResources = Resources.wrap(results);
        return new ResponseEntity<>(materialsResources, HttpStatus.OK);
    }

    @RequestMapping(value = "/advancedSearchResults", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpEntity<Resources<Resource<Material>>> showAdvancedResults(@RequestParam(value = "s", required = false) String s,
                                                                         @RequestParam(value = "type", required = false) Integer type, @RequestParam(value = "startDate", required = false) String startDate,
                                                                         @RequestParam(value = "finishDate", required = false) String finishDate, @RequestParam(value = "contentEditor", required = false) String contentEditor) {
        System.out.println("ctrl");
        List<Material> results = searchService.getAdvancedSearchResults(s, type, startDate, finishDate, contentEditor);

        Resources<Resource<Material>> materialsResources = Resources.wrap(results);

        return new ResponseEntity<>(materialsResources, HttpStatus.OK);
    }

}
