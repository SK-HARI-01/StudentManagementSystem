package com.example.SBDemoPrg.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.SBDemoPrg.Entity.DeptEntity;

public interface DeptRepo extends JpaRepository<DeptEntity,Integer> {
	
}
