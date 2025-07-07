package com.example.SBDemoPrg.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.SBDemoPrg.Entity.LoginDetailsEntity;

public interface LoginRepo extends JpaRepository<LoginDetailsEntity,Integer>{
	
	LoginDetailsEntity findByusername(String username);
}
