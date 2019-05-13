package com.Banking.appointment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String TopicPage(Model model) {

		return "appointment_topic";
	}

	@RequestMapping(value = "/appointment_topic", method = RequestMethod.POST)
	public String TopicPage2(Model model) {

		return "appointment_topic";
	}

	@RequestMapping(value = "/database_employee_holiday", method = RequestMethod.GET)
	public String holidayDB(Model model) {

		return "database_employee_holiday";
	}

	@RequestMapping(value = "/database_employee_location", method = RequestMethod.GET)
	public String locationDB(Model model) {

		return "database_employee_location";
	}

	@RequestMapping(value = "/database_employee_location_OOS", method = RequestMethod.GET)
	public String locationOOSDB(Model model) {

		return "database_employee_location_OOS";
	}

	@RequestMapping(value = "/database_employee_location_service", method = RequestMethod.GET)
	public String locationServiceDB(Model model) {

		return "database_employee_location_service";
	}

	@RequestMapping(value = "/database_employee_location_appointment_time", method = RequestMethod.GET)
	public String locationAppointmentTimeDB(Model model) {

		return "database_employee_appointment_time";
	}

	@RequestMapping(value = "/database_employee_location_active_appointment", method = RequestMethod.GET)
	public String locationActiveAppointmentDB(Model model) {

		return "database_employee_active_appointment";
	}

	@RequestMapping(value = "/appointment_location", method = RequestMethod.POST)
	public String TransferToLocation(HttpServletRequest httpServletRequest, Model model) {

		String topic = httpServletRequest.getParameter("topic");
		model.addAttribute("topic", topic);

		return "appointment_location";
	}

	@RequestMapping(value = "/appointment_date_time", method = RequestMethod.POST)
	public String TransferToDateTime(HttpServletRequest httpServletRequest, Model model) {

		String topic = httpServletRequest.getParameter("topic");
		String location = httpServletRequest.getParameter("location");

		model.addAttribute("topic", topic);
		model.addAttribute("location", location);

		return "appointment_data_time";
	}

	@RequestMapping(value = "/appointment_detail", method = RequestMethod.POST)
	public String TransferToDetail(HttpServletRequest httpServletRequest, Model model) {

		String topic = httpServletRequest.getParameter("topic");
		String location = httpServletRequest.getParameter("location");
		String date = httpServletRequest.getParameter("date");
		String time = httpServletRequest.getParameter("time");

		model.addAttribute("topic", topic);
		model.addAttribute("location", location);
		model.addAttribute("date", date);
		model.addAttribute("time", time);

		return "appointment_detail";
	}

	@RequestMapping(value = "/appointment_confirmation", method = RequestMethod.POST)
	public String TransferToConfirmation(HttpServletRequest httpServletRequest, Model model) {

		String topic = httpServletRequest.getParameter("topic");
		String location = httpServletRequest.getParameter("location");
		String date = httpServletRequest.getParameter("date");
		String time = httpServletRequest.getParameter("time");
		String customerName = httpServletRequest.getParameter("customerName");
		String customerPhone = httpServletRequest.getParameter("customerPhone");
		String customerEmail = httpServletRequest.getParameter("customerEmail");

		model.addAttribute("topic", topic);
		model.addAttribute("location", location);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("customerName", customerName);
		model.addAttribute("customerPhone", customerPhone);
		model.addAttribute("customerEmail", customerEmail);

		return "appointment_confirmation";
	}
	
	@RequestMapping(value = "/appointment_final_confirmation", method = RequestMethod.POST)
	public String TransferToFinalConfirmation(HttpServletRequest httpServletRequest, Model model) {

		String topic = httpServletRequest.getParameter("topic");
		String location = httpServletRequest.getParameter("location");
		String date = httpServletRequest.getParameter("date");
		String time = httpServletRequest.getParameter("time");
		String customerName = httpServletRequest.getParameter("customerName");
		String customerPhone = httpServletRequest.getParameter("customerPhone");
		String customerEmail = httpServletRequest.getParameter("customerEmail");

		model.addAttribute("topic", topic);
		model.addAttribute("location", location);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("customerName", customerName);
		model.addAttribute("customerPhone", customerPhone);
		model.addAttribute("customerEmail", customerEmail);

		return "appointment_final_confirmation";
	}
}
