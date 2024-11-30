package com.example.springcrudservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PersonDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private final String person_insert = "insert into Person (name, relationship, phone, email, address, birthday) values (?,?,?,?,?,?,)";
    private final String person_update = "UPDATE Person SET name=?, relationship=?, phone=?, email=?, address=?, birthday=? WHERE id=?";
    private final String person_get = "select * from Person where id=?";
    private final String person_list = "select * from Person order by id desc";
    public int insertPerson(PersonVO vo) {
        return jdbcTemplate.update(person_insert, new Object[]{vo.getName(), vo.getRelationship(), vo.getPhone(), vo.getEmail(), vo.getAddress(), vo.getBirthday()});
    }
    public int updatePerson(PersonVO vo) {
        return jdbcTemplate.update(person_update, new Object[]{vo.getName(), vo.getRelationship(), vo.getPhone(), vo.getEmail(), vo.getAddress(), vo.getBirthday(), vo.getId()});
    }
    public PersonVO getPerson(int id) {
        return jdbcTemplate.queryForObject(person_get, new Object[] {id}, new BeanPropertyRowMapper<PersonVO>(PersonVO.class));
    }
    public List<PersonVO> getPersonList() {
        return jdbcTemplate.query(person_list, new RowMapper<PersonVO>() {
            @Override
            public PersonVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                PersonVO one = new PersonVO();
                one.setId(rs.getInt("id"));
                one.setName(rs.getString("name"));
                one.setRelationship(rs.getString("relationship"));
                one.setPhone(rs.getString("phone"));
                one.setEmail(rs.getString("email"));
                one.setAddress(rs.getString("address"));
                one.setBirthday(rs.getString("birthday"));
                return one;
            }
        });

    }
}
