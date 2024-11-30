package com.example.springcrudservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class PersonController {
    @Autowired
    PersonService personService;

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String writeForm() {
        return "write";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(PersonVO vo) {
        int i = personService.insertPerson(vo);
        if (i == 0) System.out.println("데이터 추가 실패");
        else System.out.println("데이터 추가 성공!");
        return "redirect:list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String showList(Model model) {
        List<PersonVO> list = personService.getPersonList();
        model.addAttribute("list", list);
        return "list";
    }
}
