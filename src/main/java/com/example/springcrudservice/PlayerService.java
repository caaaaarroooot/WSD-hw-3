package com.example.springcrudservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayerService {
    @Autowired
    PlayerDAO playerDao;
    public int insertPlayer(PlayerVO playerVO) {
        return playerDao.addPlayer(playerVO);
    }
    public List<PlayerVO> getPlayers(String s) {
        List<PlayerVO> players;
        if (s == null || s == "") {
            players = playerDao.getAllPlayers();
        } else {
            players = playerDao.getPlayersByPosition(s);
        }
        return players;
    }

    public PlayerVO getPlayerById(int id) {
        return playerDao.getPlayerById(id);
    }

    public int deletePlayerById(int id) {
        return playerDao.deletePlayerById(id);
    }

    public int updatePlayer(PlayerVO playerVO) {
        System.out.println(playerVO.getName());
        return playerDao.updatePlayer(playerVO);
    }
}
