package com.example.SBDemoPrg.Repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
import org.springframework.data.repository.query.Param;

import com.example.SBDemoPrg.Entity.StudentDetailsEntity;

public interface StudentRepo extends JpaRepository<StudentDetailsEntity,Long>{
	
	// Partial (case-insensitive) search
	@Query("SELECT s FROM StudentDetailsEntity s WHERE LOWER(s.name) LIKE LOWER(CONCAT('%', :uname, '%'))")
	List<StudentDetailsEntity> findByPartialName(@Param("uname") String uname);


}
