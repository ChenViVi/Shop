package com.keeper.repository;

import com.keeper.model.VideoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2017/7/27.
 */
@Repository
public interface VideoRepository extends JpaRepository<VideoEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update VideoEntity video set video.name=:qName, video.type.id=:qTypeId," +
            " video.comment=:qComment, video.score=:qScore, video.cover=:qCover, video.link=:qLink where video.id=:qId")
    void updateVideo(@Param("qName") String name, @Param("qTypeId") int typeId, @Param("qComment") String comment,
                     @Param("qScore") String score, @Param("qCover") String cover, @Param("qLink") String link, @Param("qId") int id);

    @Modifying
    @Transactional
    @Query("update VideoEntity video set video.type.id=-1 where video.type.id=:qId")
    public void deleteType(@Param("qId") int id);
}
