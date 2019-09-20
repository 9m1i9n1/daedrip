package app.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import app.bbs.mapper.BbsMapper;
import app.bbs.vo.BbsVO;

@Service
public class BbsService {

  @Autowired
  BbsMapper bbsMapper;

  public BbsVO read(int idx) {
    return bbsMapper.read(idx);
  }
}