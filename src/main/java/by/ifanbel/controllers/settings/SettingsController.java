package by.ifanbel.controllers.settings;

import by.ifanbel.data.database.dto.JspBeanHeterostructure;
import by.ifanbel.data.database.entities.User;
import by.ifanbel.data.database.services.HeterostructureService;
import by.ifanbel.data.database.services.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/settings")
public class SettingsController {

	@Autowired
	UserService userService;

	@Autowired
	HeterostructureService heterostructureService;

	@RequestMapping
	public String settings() {
		return "settings";
	}

	@RequestMapping("/registration/")
	public ModelAndView registration() {
		List<Object[]> listOfUsers = userService.getListOfUsers();
		ModelAndView model = new ModelAndView("registration");
		model.addObject("listOfUsers", listOfUsers);
		return model;
	}

	@RequestMapping("/registration/newUser")
	public ModelAndView registerNewUser(@RequestParam String userLogin, @RequestParam String password, @RequestParam String email, @RequestParam String userRole) {
		User newUser = new User(userLogin, password, email, userRole, true);
		userService.createOrUpdate(newUser);
		List<Object[]> listOfUsers = userService.getListOfUsers();
		ModelAndView model = new ModelAndView("registration");
		model.addObject("listOfUsers", listOfUsers);
		return model;
	}

	@RequestMapping("/data/export")
	public void exportDump(HttpServletResponse response) throws IOException {
		Long currentTime = System.currentTimeMillis();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy_MM_dd HH_mm_ss");
		String timeStamp = simpleDateFormat.format(new Date(currentTime));
		List<JspBeanHeterostructure> exportedData = heterostructureService.exportHeterostructuresDump();
		ObjectMapper mapper = new ObjectMapper();
		response.setHeader("Content-Disposition", "attachment;filename=HSDump " + timeStamp + ".json");
		BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());
		mapper.writeValue(outStream, exportedData);
		outStream.flush();
	}

	@RequestMapping(value="/data/import/", method = RequestMethod.POST)
	public String importDump(@RequestParam MultipartFile file, RedirectAttributes redirectAttributes) {
		ObjectMapper mapper = new ObjectMapper();
		String fileName = file.getOriginalFilename();
		String message;
		try {
			List<JspBeanHeterostructure> importedData = mapper.readValue(file.getInputStream(), new TypeReference<List<JspBeanHeterostructure>>(){});
			long savedNumber = heterostructureService.importHeterostructuresDump(importedData);
			long totalNumber = importedData.size();
			message = String.format("%d of %d heterostructures were successfully imported from %s", savedNumber, totalNumber, fileName);
		} catch (IOException e) {
			message = String.format("The file %s is incorrect...", fileName);
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/settings";
	}

}
