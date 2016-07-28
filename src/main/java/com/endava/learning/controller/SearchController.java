package com.endava.learning.controller;

import com.endava.learning.model.Keyword;
import com.endava.learning.model.Material;
import com.endava.learning.service.SearchService;
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
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


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

    @RequestMapping(value = "/advancedSearchResults", method = RequestMethod.GET)
    public HttpEntity<Resources<Resource<Material>>> showAdvancedResults(@RequestParam(value = "s") String s, @RequestParam(value = "typeB") boolean typeB, @RequestParam(value = "dateB") boolean dateB, @RequestParam(value = "contentEditorB") boolean contentEditorB,
                                            @RequestParam(value = "type") int type, @RequestParam(value = "date") String date, @RequestParam(value = "contentEditor") String contentEditor) {

        List<Material> results = searchService.getAdvancedSearchResults(s, typeB, dateB, contentEditorB, type, date, contentEditor);

        Resources<Resource<Material>> materialsResources = Resources.wrap(results);

        return new ResponseEntity<>(materialsResources, HttpStatus.OK);
    }

}
