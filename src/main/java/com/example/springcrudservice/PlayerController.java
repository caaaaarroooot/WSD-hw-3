package com.example.springcrudservice;

import com.example.springcrudservice.PlayerService;
import com.example.springcrudservice.PlayerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class PlayerController {
    @Autowired
    PlayerService playerService;

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String writeForm() {
        return "write";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(PlayerVO vo) {
        System.out.println(vo.getName());
        int i = playerService.insertPlayer(vo);
        if (i == 0) System.out.println("데이터 추가 실패");
        else System.out.println("데이터 추가 성공!");
        return "redirect:list";
    }
    @GetMapping("/list")
    public String listPlayers(@RequestParam(value = "position", required = false) String position, Model model) {
        List<PlayerVO> players;
        players = playerService.getPlayers(position);

        model.addAttribute("list", players);  // 모델에 결과 추가
        return "list";  // 결과를 표시할 JSP 페이지
    }
    @GetMapping("/view")
    public String viewPlayer(@RequestParam("id") int id, Model model) {
        PlayerVO player = playerService.getPlayerById(id);
        model.addAttribute("player", player);  // player 객체를 모델에 추가
        return "view";  // 'view'는 JSP 파일명 (예: view.jsp)
    }
    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
    public String deletePostOK(@PathVariable("id") int id) {
        int i = playerService.deletePlayerById(id);
        if(i == 0){
            System.out.println("데이터 삭제 실패");
        } else{
            System.out.println("데이터 삭제 success");
        }
        return "redirect:../list";
    }
    // GET 요청 처리: 데이터를 불러와서 수정 폼을 렌더링
    @GetMapping("/edit")
    public String editGet(@RequestParam("id") String playerId, Model model) {
        int id = Integer.parseInt(playerId);
        // playerId에 해당하는 플레이어 데이터를 가져옵니다.
        PlayerVO player = playerService.getPlayerById(id);

        if (player == null) {
            // 플레이어를 찾을 수 없는 경우, 에러 페이지로 리디렉션하거나 적절한 메시지 전달
            return "redirect:/error";
        }

        model.addAttribute("player", player);
        return "edit";  // edit.jsp 또는 edit.html을 반환
    }

    @PostMapping("/editok")
    public String editPostOK(PlayerVO vo) {
        System.out.println(vo.getName());
        int i = playerService.updatePlayer(vo);

        if (i == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공!");
        }

        return "redirect:list";  // 수정 후 리스트 페이지로 리디렉션
    }
}
