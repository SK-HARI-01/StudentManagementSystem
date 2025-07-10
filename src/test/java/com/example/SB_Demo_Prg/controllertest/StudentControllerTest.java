package com.example.SB_Demo_Prg.controllertest;

import com.example.SBDemoPrg.Controllers.StudentController;
import com.example.SBDemoPrg.Entity.StudentDetailsEntity;
import com.example.SBDemoPrg.Repository.StudentRepo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Optional;
import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(StudentController.class)

public class StudentControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private StudentRepo studentRepo;

    @Test
    public void testViewAllStudents() throws Exception {
        when(studentRepo.findAll()).thenReturn(List.of(
                new StudentDetailsEntity("A", "R01", "CSE", "9.0", "92")));

        mockMvc.perform(get("/student-details/Student-db-details"))
                .andExpect(status().isOk())
                .andExpect(view().name("StdViewDetails"))
                .andExpect(model().attributeExists("students"));
    }

    @Test
    public void testUpdateFormView() throws Exception {
        StudentDetailsEntity student = new StudentDetailsEntity("A", "R01", "CSE", "9.0", "92");
        student.setId(1L);

        when(studentRepo.findById(1L)).thenReturn(Optional.of(student));

        mockMvc.perform(get("/student-details/update-form?id=1"))
                .andExpect(status().isOk())
                .andExpect(view().name("StdUpdateForm"))
                .andExpect(model().attributeExists("student"));
    }

    @Test
    public void testUpdateStudent() throws Exception {
        StudentDetailsEntity student = new StudentDetailsEntity("A", "R01", "CSE", "9.0", "92");
        student.setId(1L);

        when(studentRepo.findById(1L)).thenReturn(Optional.of(student));

        mockMvc.perform(post("/student-details/update")
                .param("id", "1")
                .param("name", "Updated Name")
                .param("rollNo", "R01")
                .param("dept", "IT")
                .param("cgpa", "8.0")
                .param("attprecent", "85"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/student-details/Student-db-details"));
    }

    @Test
    public void testDeleteStudent() throws Exception {
        mockMvc.perform(post("/student-details/delete")
                .param("id", "1"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/student-details/Student-db-details"));
    }
}
