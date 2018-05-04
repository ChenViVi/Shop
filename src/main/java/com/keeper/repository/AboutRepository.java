package com.keeper.repository;

import com.keeper.model.AboutEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/7/27.
 */
@Repository
public interface AboutRepository extends JpaRepository<AboutEntity, Integer> {

}
