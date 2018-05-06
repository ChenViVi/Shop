package com.keeper.repository;

import com.keeper.model.BannerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/7/27.
 */
@Repository
public interface BannerRepository extends JpaRepository<BannerEntity, Integer> {

}
