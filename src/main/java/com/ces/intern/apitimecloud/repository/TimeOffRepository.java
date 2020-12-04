package com.ces.intern.apitimecloud.repository;

import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TimeOffRepository extends JpaRepository<TimeOffEntity, Integer> {
    List<TimeOffEntity> getAllTimeOffByUserId(Integer userId);
}
