package com.example.springcrudservice;

import com.example.springcrudservice.PlayerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class PlayerDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final String PLAYER_BY_ID = "SELECT id, name, birthyear, club, country, position, mainfoot FROM Player WHERE id = ?";
    private final String PLAYER_ALL = "SELECT * FROM Player";
    private final String DELETE = "DELETE FROM Player WHERE id = ?";
    private final String UPDATE = "UPDATE Player SET name = ?, birthyear = ?, club = ?, country = ?, position = ?, mainfoot = ? WHERE id = ?";
    private final String INSERT = "INSERT INTO Player (name, birthyear, club, country, position, mainfoot) VALUES (?, ?, ?, ?, ?, ?)";
    private final String PLAYER_BY_POSITION = "SELECT id, name, birthyear, club, country, position, mainfoot FROM Player WHERE position = ?";

    public List<PlayerVO> getAllPlayers() {
        return jdbcTemplate.query(PLAYER_ALL, new RowMapper<PlayerVO>() {

            @Override
            public PlayerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                PlayerVO player = new PlayerVO();
                player.setId(rs.getInt("id"));
                player.setName(rs.getString("name"));
                player.setBirthyear(rs.getString("birthyear"));
                player.setClub(rs.getString("club"));
                player.setCountry(rs.getString("country"));
                player.setPosition(rs.getString("position"));
                player.setMainfoot(rs.getString("mainfoot"));
                return player;
            }
        });
    }

    // ID로 플레이어 정보 가져오기
    public PlayerVO getPlayerById(int id) {
        PlayerVO player ;
        player = jdbcTemplate.queryForObject(PLAYER_BY_ID, new Object[]{id}, new BeanPropertyRowMapper<>(PlayerVO.class));
        if(player == null) {
            System.out.println("Player with id " + id + " not found");
        }
        System.out.println(player.getId());
        return player;
    }

    // 플레이어 삭제
    public int deletePlayerById(int id) {
        System.out.println("Deleting player with id " + id);
        return jdbcTemplate.update(DELETE, id);
    }

    // 플레이어 정보 업데이트
    public int updatePlayer(PlayerVO player) {
        System.out.println(player.getId());
        int rowsAffected = jdbcTemplate.update(UPDATE,
                player.getName(),
                player.getBirthyear(),
                player.getClub(),
                player.getCountry(),
                player.getPosition(),
                player.getMainfoot(),
                player.getId());

        System.out.println("Rows affected: " + rowsAffected);

        return rowsAffected;
    }

    // 플레이어 추가
    public int addPlayer(PlayerVO player) {
        return jdbcTemplate.update(INSERT, player.getName(), player.getBirthyear(), player.getClub(), player.getCountry(), player.getPosition(), player.getMainfoot());
    }

    // 특정 포지션의 플레이어 가져오기
    public List<PlayerVO> getPlayersByPosition(String position) {
        return jdbcTemplate.query(PLAYER_BY_POSITION, new Object[]{position}, new RowMapper<PlayerVO>() {
            @Override
            public PlayerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                PlayerVO player = new PlayerVO();
                player.setId(rs.getInt("id"));
                player.setName(rs.getString("name"));
                player.setBirthyear(rs.getString("birthyear"));
                player.setClub(rs.getString("club"));
                player.setCountry(rs.getString("country"));
                player.setPosition(rs.getString("position"));
                player.setMainfoot(rs.getString("mainfoot"));
                return player;
            }
        });
    }
}
