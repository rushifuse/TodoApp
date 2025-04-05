package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Todo;
import com.demo.service.TodoService;

@RestController
public class TodoController 
{
		@Autowired
		private TodoService ts;
	
		@GetMapping("/")
		public ModelAndView showHomePage(ModelAndView m) {
		    List<Todo> list = ts.findAll();  // Fetch all todos
		    m.addObject("list", list);
		    m.setViewName("index.jsp"); // Return JSP view
		    return m;
		}

		
		@PostMapping("/save")
		public ModelAndView addTodo(ModelAndView m, String description, int id , String b1) {
			String b = b1;
		    if(b.equalsIgnoreCase("add"))
		    {
		    	  Todo t = new Todo();
				    t.setId(id);
				    t.setDescription(description);

				    t = ts.save(t);
				    if (t != null) {
				        m.addObject("msg", "Item added successfully to the list");
				    } else {
				        m.addObject("msg", "Item not added to the list");
				    }
		    }
		    else if(b.equalsIgnoreCase("delete"))	
		    {
		    	 int  a = ts.deleteById(id);
		    	 if (a !=0) {
				        m.addObject("msg", "Item delete successfully to the list");
				    } else {
				        m.addObject("msg", "Item not found to the list");
				    }
		    }


		  return showHomePage(m);
		}
		
		
}
