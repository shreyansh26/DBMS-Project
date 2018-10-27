package com.dbms;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Productdao;
import com.dbms.dao.Supplierdao;
import com.dbms.dao.Userdao;
import com.dbms.model.Attendance;
import com.dbms.model.Client;
import com.dbms.model.Delivery;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.Invoice;
import com.dbms.model.Order;
import com.dbms.model.Product;
import com.dbms.model.RawMaterial;
import com.dbms.model.Supplier;
import com.dbms.model.User;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
public class LoginController {

	@Autowired
	public Userdao userdao;
	
	@Autowired
	public Productdao productdao;
	
	@Autowired
	public Supplierdao supplierdao;
	
	@Autowired
    ServletContext context;
	
	@RequestMapping(value = "/")
	public String welcome(Model model) {
		model.addAttribute("name", "Home Page");
		// model.addAttribute("description", "unsecured page !");
		return "home";

	}

	@RequestMapping("/admin")
	public String admin(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security Custom Login Demo");
		// model.addAttribute("description", "Protected page !");
		return "admin";
	}	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {

		return "login";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {

		model.addAttribute("message",
				"You have successfully logged off from application !");
		return "logout";

	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);

		return "register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			System.out.println("This is error");
			return "register";
		}
		else {
			if(!user.getPassword().equals(user.getmPassword())) {
				model.addAttribute("error","passwords dont match");
				return "register";
			}
			if(userdao.getUser(user.getUsername())!=null) {
				model.addAttribute("error", "username exists");
				return "register";
			}
			userdao.saveOrUpdate(user);
			return "home";
		}
	}
	
	@RequestMapping(value="/admin/registerEmployee",method=RequestMethod.GET)
	public String registerEmployee(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);

		return "registerEmployee";
	}
	
	@RequestMapping(value="/admin/registerEmployee",method=RequestMethod.POST)
	public String registerEmployeeProcess(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			System.out.println("Error2");
			return "registerEmployee";
		}
		else {
			System.out.println("Error");
			if(!user.getPassword().equals(user.getmPassword())) {
				model.addAttribute("error","passwords dont match");
				return "register";
			}
			if(userdao.getUser(user.getUsername())!=null) {
				model.addAttribute("error", "username exists");
				return "registerEmployee";
			}
			userdao.saveOrUpdate(user);
			return "redirect:/admin";
		}
	}
	
	@RequestMapping("/client")
	public String user(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("client", loggedInUserName);
		model.addAttribute("name", "Spring Security USER Custom Login Demo");
		model.addAttribute("description", "Protected page for user !");
		return "client";
	}
	
	@RequestMapping(value="/client/editProfile", method = RequestMethod.GET)
	public ModelAndView editClientProfile(HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Client client = userdao.getClient(username);
		System.out.println(client.getName());
		ModelAndView model = new ModelAndView("clientEdit");
		model.addObject("client", client);
		return model;
	}
	
	@RequestMapping(value = "/client/saveClientProfile", method = RequestMethod.POST)
	public ModelAndView saveClientProfile(@ModelAttribute Client client) {
		System.out.println("Error3");
		userdao.editClientProfile(client);
	    return new ModelAndView("redirect:/client");
	}
	
	@RequestMapping("/employee")
	public String employee(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("employee", loggedInUserName);
		model.addAttribute("name", "Spring Security USER Custom Login Demo");
		model.addAttribute("description", "Protected page for user !");
		return "employee";
	}
	
	@RequestMapping(value="/employee/editProfile", method = RequestMethod.GET)
	public ModelAndView editEmployeeProfile(HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Employee employee = userdao.getEmployee(username);
		System.out.println(employee.getName());
		ModelAndView model = new ModelAndView("employeeEdit");
		model.addObject("employee", employee);
		return model;
	}
	
	@RequestMapping(value = "/employee/saveEmployeeProfile", method = RequestMethod.POST)
	public ModelAndView saveEmployeeProfile(@ModelAttribute Employee employee) {
		System.out.println("Error3");
		userdao.editEmployeeProfile(employee);
	    return new ModelAndView("redirect:/employee");
	}
	
	@RequestMapping(value = "/client/order", method = RequestMethod.GET)
	public String placeOrder(Model model,Principal principal) {
		String client = principal.getName();
		model.addAttribute("client", client);
		model.addAttribute("order", new Order()); 
		List<List<String>> productsAndPriceList = productdao.getProductsAndPrice();
		model.addAttribute("productsAndPriceList", productsAndPriceList);
		return "placeOrder";
	}
	
	@RequestMapping(value = "/client/placeOrderByClient", method = RequestMethod.POST)
	public ModelAndView placeOrderByClient(@ModelAttribute Order order) throws IOException, DocumentException, ParseException {
		String part1 = UUID.randomUUID().toString();
		long unixTime = System.currentTimeMillis() / 1000L;
		String part2 = String.valueOf(unixTime);
		String id = part1 + part2;
		System.out.println(id);
		order.setOrderid(id);
		productdao.finalPlaceOrder(order);
		List<List<String>> billlist = productdao.getBillPrice(id);
		System.out.println(Arrays.toString(billlist.toArray()));
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		LocalDateTime now = LocalDateTime.now();  
//		System.out.println(dtf.format(now));  
		
		File f = new File("."); // current directory

		File[] files = f.listFiles();
		for (File file : files) {
			if (file.isDirectory()) {
				System.out.print("directory:");
			} else {
				System.out.print("     file:");
			}
			System.out.println(file.getCanonicalPath());
		}
		
		File files2 = new File("./DBMS/shreyansh_final/src/main/webapp/WEB-INF/downloads/txt");
		if (!files2.exists()) {
            if (files2.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		else {
			System.out.println("exists");
		}
		
		File files3 = new File("./DBMS/shreyansh_final/src/main/webapp/WEB-INF/downloads/pdf");
		if (!files3.exists()) {
            if (files2.mkdirs()) {
                System.out.println("Multiple directories are created!");
            } else {
                System.out.println("Failed to create multiple directories!");
            }
        }
		else {
			System.out.println("exists");
		}
			
		PrintWriter writer = new PrintWriter("./DBMS/shreyansh_final/src/main/webapp/WEB-INF/downloads/txt/" + id+".txt", "UTF-8");
		writer.println("Somnath Sevashram");
		writer.println("------------------");
		writer.println("\n");
		writer.println("Invoice for order => " + id);
		writer.println();
		writer.println("Date =>  " + dtf.format(now).toString());
		writer.println();
		Integer sum = 0;
		String clientusername = null;
		if(billlist.size()>0) {
			List<String> temp = billlist.get(0);
			writer.println("Client name => " + temp.get(0));
			clientusername = temp.get(3);
		}
		writer.println("\r\nOrder Summary\r\n");
		writer.println("-------------");
		for(int i=0; i<billlist.size(); i++) {
			List<String> temp = billlist.get(i);
			if(!temp.get(2).equals("0")) {
				writer.println();
				writer.println(temp.get(1) + "    " + temp.get(2));
				writer.println();
				sum += Integer.parseInt(temp.get(2));
			}
		}
		writer.println("------------------------");
		writer.println();
		writer.println("Total                " + Integer.toString(sum));
		writer.close();		
		
		String text = "./DBMS/shreyansh_final/src/main/webapp/WEB-INF/downloads/txt/"+id+".txt";
		String dest = "./DBMS/shreyansh_final/src/main/webapp/WEB-INF/downloads/pdf/"+id+".pdf";
		System.out.println("Done txt!");
		File file = new File(dest);
        file.getParentFile().mkdirs();
    	createPdf(text, dest);
    	Invoice invoice = new Invoice();
    	if(clientusername != null) {		
    		Calendar c = Calendar.getInstance();
    		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    		// Start date
    		String startdate = sdf1.format(c.getTime());
    		java.util.Date startdate2 = sdf1.parse(startdate);
    		java.sql.Date sqlStartDate = new java.sql.Date(startdate2.getTime());
    		
    		c.add(Calendar.DAY_OF_MONTH, 7);
    		// Due date after 7 days
       		String duedate = sdf1.format(c.getTime());
    		java.util.Date duedate2 = sdf1.parse(duedate);
    		java.sql.Date sqlDueDate = new java.sql.Date(duedate2.getTime()); 
    		
    		invoice.setOrderid(id);
    		invoice.setClientusername(clientusername);
    		invoice.setGendate(sqlStartDate);
    		invoice.setDuedate(sqlDueDate);
    		invoice.setAmount(sum);
    		productdao.saveInvoice(invoice);
    	}
    	
		System.out.println("Done pdf!");
		ModelAndView model = new ModelAndView("orderPlaced");
		model.addObject("id", id);
		return model;
	}
	
	@RequestMapping(value = "/client/viewOrders", method = RequestMethod.GET)
	public String viewOrders(Model model, Principal principal) {
		String client = principal.getName();
		List<List<String>> orderdetails = productdao.getOrdersForClient(client);
		model.addAttribute("client", client);
		model.addAttribute("order", new Order());
		model.addAttribute("orderdetails", orderdetails);
		return "viewOrders";
	}
	
	@RequestMapping(value = "/admin/viewEmployees", method = RequestMethod.GET)
	public String viewEmployees(Model model, Principal principal) {
		List<List<String>> employeelist = userdao.getEmployeesList();
		System.out.println(Arrays.toString(employeelist.toArray()));
		model.addAttribute("employeelist", employeelist);
		return "viewEmployees";
	}
	
	@RequestMapping(value = "/admin/viewClients", method = RequestMethod.GET)
	public String viewClients(Model model, Principal principal) {
		List<List<String>> clientslist = userdao.getClientsList();
		System.out.println(Arrays.toString(clientslist.toArray()));
		model.addAttribute("clientslist", clientslist);
		return "viewClients";
	}
	
	@RequestMapping(value = "/admin/viewAllOrders", method = RequestMethod.GET)
	public String viewAllOrders(Model model, Principal principal) {
		List<List<String>> allorderslist = productdao.getAllOrdersList();
		System.out.println(Arrays.toString(allorderslist.toArray()));
		model.addAttribute("allorderslist", allorderslist);
		return "viewAllOrders";
	}
	
	@RequestMapping(value = "/admin/viewSpecificOrder", method = RequestMethod.GET)
	public ModelAndView viewSpecificOrder(HttpServletRequest request) {
		String clientusername = request.getParameter("username");
		List<List<String>> specificOrdersList = productdao.getSpecificOrdersList(clientusername);
		System.out.println(Arrays.toString(specificOrdersList.toArray()));
		ModelAndView model = new ModelAndView("viewSpecificOrder");
		model.addObject("specificOrdersList", specificOrdersList);
		model.addObject("clientusername", clientusername);
		return model;
	}
	
	@RequestMapping(value = "/admin/markAttendance", method = RequestMethod.GET)
	public ModelAndView markAttendance(HttpServletRequest request) {
		List<List<String>> employeesnamelist = userdao.getEmployeesNameList();
		System.out.println(Arrays.toString(employeesnamelist.toArray()));
		ModelAndView model = new ModelAndView("markAttendance");
		model.addObject("attendance", new Attendance()); 
		model.addObject("employeesnamelist", employeesnamelist);
		return model;
	}
	
	@RequestMapping(value = "/admin/attendanceMarked", method = RequestMethod.POST)
	public ModelAndView attendanceMarked(@ModelAttribute Attendance attendance) throws ParseException {
		java.util.Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		attendance.setDate(sqlDate);
		System.out.println(sqlDate);
		userdao.finallyMarkAttendance(attendance);
		return new ModelAndView("redirect:/admin");
	}
	
	@RequestMapping(value = "/admin/viewAllAttendance", method = RequestMethod.GET)
	public String viewAllAttendance(Model model, Principal principal) {
		List<List<String>> allattendancelist = userdao.getAllAttendanceList();
		System.out.println(Arrays.toString(allattendancelist.toArray()));
		model.addAttribute("allattendancelist", allattendancelist);
		model.addAttribute("attendance", new Attendance());
		return "viewAllAttendance";
	}
	
	@RequestMapping(value = "/admin/viewAllAttendance", method = RequestMethod.POST)
	public ModelAndView feedbackSent(@Valid @ModelAttribute("attendance") Attendance attendance,BindingResult result) {
		if(result.hasErrors()) {
			return new ModelAndView("viewAllAttendance");
		}
		else {
			String username = attendance.getEmpusername();
			if(username.equals("")) {
				List<List<String>> allattendancelist = userdao.getAllAttendanceList();
				ModelAndView model = new ModelAndView("viewAllAttendance");
				model.addObject("allattendancelist", allattendancelist);
				return model;
			}
			List<List<String>> allattendancelist = userdao.getUserAttendanceList(username);
			ModelAndView model = new ModelAndView("viewAllAttendance");
			model.addObject("allattendancelist", allattendancelist);
			return model;
		}
	}
	
	@RequestMapping(value = "/employee/viewAttendance", method = RequestMethod.GET)
	public ModelAndView viewAllAttendance(HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		List<List<String>> clientattendancelist = userdao.getClientAttendanceList(username);
		System.out.println(Arrays.toString(clientattendancelist.toArray()));
		ModelAndView model = new ModelAndView("viewAttendance");
		model.addObject("clientattendancelist", clientattendancelist);
		return model;
	}
	
	@RequestMapping(value="/client/submitFeedback")
	public String enterFeedback(Model model, Principal principal) {
		String clientusername = principal.getName();
		Feedback feedback = new Feedback();
		feedback.setClientusername(clientusername);
		model.addAttribute("client", clientusername);
        model.addAttribute("feedback", feedback);
		return "submitFeedback";
	}
	
	@RequestMapping(value="/client/feedbackSent",method=RequestMethod.POST)
	public String feedbackSent(@Valid @ModelAttribute("feedback") Feedback feedback,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "submitFeedback";
		}
		else {
			java.util.Date date = new Date();
	        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			feedback.setDate(sqlDate);
			userdao.saveFeedback(feedback);
			return  "redirect:/client";
		}
	}
	
	@RequestMapping(value = "/admin/viewFeedbacks", method = RequestMethod.GET)
	public String viewFeedbacks(Model model, Principal principal) {
		List<List<String>> submittedfeebacks = userdao.getFeedbacks();
		System.out.println(Arrays.toString(submittedfeebacks.toArray()));
		model.addAttribute("submittedfeebacks", submittedfeebacks);
		return "viewFeedbacks";
	}
	
	@RequestMapping(value = "/admin/addRawMaterials", method = RequestMethod.GET)
	public String addRawMaterials(Model model, Principal principal) {
		model.addAttribute("rawmaterial", new RawMaterial());
		return "addRawMaterials";
	}
	
	@RequestMapping(value = "/admin/rawMaterialAdded", method = RequestMethod.POST)
	public ModelAndView rawMaterialAdded(@ModelAttribute RawMaterial rawmaterial) {
		supplierdao.addRawMaterial(rawmaterial);
		return new ModelAndView("redirect:/admin");
	}
	
	@RequestMapping(value="/registerSupplier")
	public String registerSupplier(Model model) {
		List<String> rawmaterialtypes = supplierdao.getRawMaterials();
		model.addAttribute("rawmaterialtypes", rawmaterialtypes);
		model.addAttribute("supplier", new Supplier());
		return "registerSupplier";
	}
	
	@RequestMapping(value="/supplierRegistered", method = RequestMethod.POST)
	public ModelAndView supplierRegistered(@ModelAttribute Supplier supplier) {
		supplierdao.saveSupplier(supplier);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/admin/viewSuppliers", method = RequestMethod.GET)
	public String viewSuppliers(Model model, Principal principal) {
		List<List<String>> supplierslist = supplierdao.getSuppliersList();
		System.out.println(Arrays.toString(supplierslist.toArray()));
		model.addAttribute("supplierslist", supplierslist);
		return "viewSuppliers";
	}
	
	@RequestMapping(value = "/admin/alterPricings", method = RequestMethod.GET)
	public String alterPricings(Model model, Principal principal) {
		List<String> productslist = productdao.getProducts();
		System.out.println(Arrays.toString(productslist.toArray()));
		model.addAttribute("productslist", productslist);
		model.addAttribute("product", new Product());
		return "alterPricings";
	}
	
	@RequestMapping(value="admin/pricesAltered", method = RequestMethod.POST)
	public ModelAndView pricesAltered(@ModelAttribute Product product) {
		productdao.updatePrices(product);
		return new ModelAndView("redirect:/admin");
	}
	
	@RequestMapping(value = "client/download/pdf/{fileName}", method = RequestMethod.GET)
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("fileName") String fileName) {
	    try {
	        String filePathToBeServed = "./DBMS/shreyansh_final/src/main/webapp/WEB-INF/downloads/pdf/"+fileName+".pdf";
	        File fileToDownload = new File(filePathToBeServed);
	        InputStream inputStream = new FileInputStream(fileToDownload);
	        response.setContentType("application/pdf");
	        response.setHeader("Content-Disposition", "attachment; filename="+fileName+".pdf"); 
	        IOUtils.copy(inputStream, response.getOutputStream());
	        response.flushBuffer();
	        inputStream.close();
	    } catch (Exception e){
	        e.printStackTrace();
	    }
	}
	
	public void createPdf(String text, String dest)
		throws DocumentException, IOException {
	        Document document = new Document();
	        PdfWriter.getInstance(document, new FileOutputStream(dest));
	        document.open();
	        BufferedReader br = new BufferedReader(new FileReader(text));
	        String line;
	        Paragraph p;
	        BaseFont courier = BaseFont.createFont(BaseFont.COURIER, BaseFont.CP1252, BaseFont.EMBEDDED);
//	        Font normal = new Font(FontFamily.TIMES_ROMAN, 12);
	        Font myfont = new Font(courier);
	        Font bold = new Font(courier, 12, Font.BOLD);
	        boolean title = true;
	        while ((line = br.readLine()) != null) {
	            p = new Paragraph(line, title ? bold : myfont);
	            p.setAlignment(Element.ALIGN_JUSTIFIED);
	            title = line.isEmpty();
	            if(!title)
	            	p.add(Chunk.NEWLINE); 
	            document.add(p);
	        }
	        document.close();
	    }
	
	@RequestMapping(value = "/admin/viewInvoices", method = RequestMethod.GET)
	public String viewInvoices(Model model, Principal principal) {
		List<List<String>> invoicelist = productdao.getInvoiceList();
		System.out.println(Arrays.toString(invoicelist.toArray()));
		model.addAttribute("invoicelist", invoicelist);
		return "viewInvoices";
	}
	
	@RequestMapping(value = "/client/viewClientInvoices", method = RequestMethod.GET)
	public String viewClientInvoices(Model model, Principal principal) {
		String username = principal.getName();
		List<List<String>> specificinvoicelist = productdao.getSpecificInvoiceList(username);
		System.out.println(Arrays.toString(specificinvoicelist.toArray()));
		model.addAttribute("specificinvoicelist", specificinvoicelist);
		return "viewClientInvoices";
	}
	
	@RequestMapping(value = "/admin/markAsComplete", method = RequestMethod.GET)
	public String markAsComplete(HttpServletRequest request) {
		String orderid = request.getParameter("id");
		String username = request.getParameter("user");
		String type = request.getParameter("type");
		type = type.replaceAll("'","");
		productdao.updateOrderStatus(orderid, username, type);
		return "redirect:/admin/viewAllOrders";
	}
	
	@RequestMapping(value = "/admin/markSpecificAsComplete", method = RequestMethod.GET)
	public String markSpecificAsComplete(HttpServletRequest request) {
		String orderid = request.getParameter("id");
		String username = request.getParameter("user");
		String type = request.getParameter("type");
		type = type.replaceAll("'","");
		productdao.updateOrderStatus(orderid, username, type);
		return "redirect:/admin/viewSpecificOrder?username="+username;
	}
	
	@RequestMapping(value = "/admin/viewCompletedOrders", method = RequestMethod.GET)
	public String viewCompletedInvoices(Model model, Principal principal) {
		List<List<String>> completedinvoicelist = productdao.getCompletedOrdersList();
		System.out.println(Arrays.toString(completedinvoicelist.toArray()));
		model.addAttribute("invoicelist", completedinvoicelist);
		return "viewCompletedOrders";
	}
	
	@RequestMapping(value = "/admin/updateDeleiveryDetails", method = RequestMethod.GET)
	public ModelAndView updateDeleiveryDetails(HttpServletRequest request) {
		String username = request.getParameter("user");
		String orderid = request.getParameter("orderid");
		String type = request.getParameter("type");
		orderid = orderid.replaceAll("'","");
		type = type.replaceAll("'","");
//		productdao.updateDeliveryStatus(orderid, username);
		ModelAndView model = new ModelAndView("updateDeliveryDetails");
		model.addObject("delivery", new Delivery());
		model.addObject("username", username);
		model.addObject("type", type);
		model.addObject("orderid", orderid);
		return model;
	}
	
	@RequestMapping(value="/admin/deliveryDetailsUpdated",method=RequestMethod.POST)
	public String deliveryDetailsUpdated(@Valid @ModelAttribute("delivery") Delivery delivery,BindingResult result,Model model) {
		System.out.println("In");
		productdao.updateDeliveryDetails(delivery);
		System.out.println("Out");
		return  "redirect:/admin";
	}
	
	@RequestMapping(value="/admin/viewDeliveryDetails",method=RequestMethod.GET)
	public String viewDeliveryDetails(@Valid @ModelAttribute("delivery") Delivery delivery,BindingResult result,Model model) {
		List<List<String>> deliverylist = productdao.getDeliveryList();
		System.out.println(Arrays.toString(deliverylist.toArray()));
		model.addAttribute("deliverylist", deliverylist);
		return "viewDeliveryDetails";
	}
	
	@RequestMapping(value="/client/viewClientDeliveryDetails",method=RequestMethod.GET)
	public String viewClientDeliveryDetails(Model model, Principal principal) {
		String username = principal.getName();
		List<List<String>> clientdeliverylist = productdao.getClientDeliveryList(username);
		System.out.println(Arrays.toString(clientdeliverylist.toArray()));
		model.addAttribute("clientdeliverylist", clientdeliverylist);
		return "viewClientDeliveryDetails";
	}
	
}
