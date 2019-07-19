package generalOperation;

import adminOperation.adminOperationSubject;
import bean.Bbs;
import util.DB;

public class generalOperationSubject {
	public boolean generalInsertSubject(Bbs bbs){
		adminOperationSubject genealGrade = new adminOperationSubject();
		if(genealGrade.adminInsertSubject(bbs)){
			return true;
		}else {
			return false;
		}
	}

	public boolean generalUpdateSubject(Bbs bbs){
		String sqlUpdateBbs = "update bbs_bbs set bbscontent=? where bbsid=? ";
		DB db = new DB();
		int count = db.update(sqlUpdateBbs, new String[]{bbs.getBbscontent(),bbs.getBbsid()});
		try {
			if(count > 0){
				return true;
			}else {
				return false;
			}
		}finally{
			db.close();
		}
	}
	
	public boolean genealDeleteSubject(Bbs bbs){
		String sqlDeleteBbs = "delete from bbs_bbs where bbsid=?";
		DB db = new DB();
		int count = db.delete(sqlDeleteBbs, new String[]{bbs.getBbsid()});
		try {
			if(count > 0){
				return true;
			}else {
				return false;
			}
		}finally{
			db.close();
		}
	}
	
}
