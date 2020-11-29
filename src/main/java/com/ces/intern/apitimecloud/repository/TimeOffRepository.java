package com.ces.intern.apitimecloud.repository;

import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeOffRepository extends JpaRepository<TimeOffEntity, Integer> {

}
