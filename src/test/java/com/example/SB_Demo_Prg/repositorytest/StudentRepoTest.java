package com.example.SB_Demo_Prg.repositorytest;

import com.example.SBDemoPrg.Entity.StudentDetailsEntity;
import com.example.SBDemoPrg.Repository.StudentRepo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
public class StudentRepoTest {

    @Autowired
    private StudentRepo studentRepo;

    @Test
    public void testSaveAndFindById() {
        StudentDetailsEntity student = new StudentDetailsEntity("John", "R001", "CSE", "8.5", "95");
        StudentDetailsEntity saved = studentRepo.save(student);

        StudentDetailsEntity found = studentRepo.findById(saved.getId()).orElse(null);
        assertThat(found).isNotNull();
        assertThat(found.getName()).isEqualTo("John");
    }

    @Test
    public void testDelete() {
        StudentDetailsEntity student = new StudentDetailsEntity("Alice", "R002", "IT", "9.0", "90");
        StudentDetailsEntity saved = studentRepo.save(student);

        studentRepo.deleteById(saved.getId());

        assertThat(studentRepo.findById(saved.getId()).isEmpty()).isTrue();
    }

    @Test
    public void testFindAll() {
        studentRepo.save(new StudentDetailsEntity("A", "R01", "CSE", "8.0", "90"));
        studentRepo.save(new StudentDetailsEntity("B", "R02", "ECE", "7.5", "80"));

        List<StudentDetailsEntity> all = studentRepo.findAll();
        assertThat(all.size()).isGreaterThanOrEqualTo(2);
    }
}
