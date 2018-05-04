package com.keeper.repository;

import com.keeper.model.MusicEntity;
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
public interface MusicRepository extends JpaRepository<MusicEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update MusicEntity msuic set msuic.name=:qName, msuic.type.id=:qTypeId," +
            " msuic.comment=:qComment, msuic.score=:qScore, msuic.cover=:qCover, msuic.link=:qLink where msuic.id=:qId")
    void updateItem(@Param("qName") String name, @Param("qTypeId") int typeId, @Param("qComment") String comment,
                    @Param("qScore") String score, @Param("qCover") String cover, @Param("qLink") String link, @Param("qId") int id);

    @Modifying
    @Transactional
    @Query("update MusicEntity music set music.type.id=-1 where music.type.id=:qId")
    public void deleteType(@Param("qId") int id);
}
