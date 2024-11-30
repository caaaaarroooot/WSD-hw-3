package com.example.springcrudservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonService {
    @Autowired
    PersonDAO personDAO;
    PersonVO personVO;
    public int insertPerson(PersonVO vo) {
         return personDAO.insertPerson(vo);
    }
    public List<PersonVO> getPersonList() {
        return personDAO.getPersonList();
    }
}
