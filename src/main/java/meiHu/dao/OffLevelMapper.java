package meiHu.dao;

import meiHu.entity.OffLevel;

public interface OffLevelMapper {
    //某兑换券数量-1
    public int deleteOffByOffid(int offid);

    //获取某兑换券的详细信息
    public OffLevel selectOffLevelByOffid(int offid);
}
