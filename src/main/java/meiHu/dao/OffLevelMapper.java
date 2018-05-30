package meiHu.dao;

import meiHu.entity.OffLevel;

public interface OffLevelMapper {
    /**
     * 查询所有优惠信息
     * @return 所有优惠信息
     */
    public OffLevel getAll() ;

    /**
     * 根据优惠olid查询优惠信息
     * @param olid  执行select的优惠券olid
     * @return
     */
    public OffLevel selectOffLevelByOlid(int olid) ;
}
