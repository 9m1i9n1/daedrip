package app.bbs.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import app.bbs.vo.BbsVO;

@Mapper
public interface BbsMapper {
  BbsVO read(@Param("idx") int idx);
}