package util;

public class PagingCount {
	int links = 10;
	int limit = 10;
	int totalpage = 0;
	
	public PagingCount() { }
	public PagingCount(int numrows) {
		this.totalpage = ((numrows-1)/limit)+1;
	}
	//links���� ���� �� 
	public PagingCount(int numrows, int links, int limit) {
		this.links = links;
		this.limit = limit;
		this.totalpage = ((numrows-1)/limit)+1;
	}
	//������ ��ȣ ���� ��  ���ȣ ���ϱ�
	public int countOffset(int page) {
		int offset = (page-1)*this.limit;
		return offset;
	}
	
	//��� ����¡
	public String showPaging(int pagelink, String pagename) {
		String str = "<table><tr><td>";
		int bpage, boffset,cpage,coffset,vpage,noffset,loffset = 0;
		//first page
		if(pagelink != 1) {
			str += "[<a href="+pagename+"?pagelink=1&offset=0>"
					+ "<font>ó��</font></a>]";
		}else {
			str += "[<font>ó��</font></a>]";
		}
		//back 10page
		bpage = pagelink-10;
		boffset = countOffset(bpage);
		if(pagelink > links) {
			str += "[<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+">"
					+ "<font>���� 10</font></a>]";
		}else {
			str += "[<font>���� 10</font></a>]";
		}
		//link page
		vpage = pagelink; //������������ �ٸ������� ���
		pagelink = ((pagelink-1)/links)*links+1; //���������� ���ϱ�
		for(cpage=pagelink; cpage<pagelink+links; cpage++) {
			if(cpage>totalpage) break;
			coffset = countOffset(cpage);
			if(cpage!=vpage) {
				str += "[<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+">"
						+ "<font>"+cpage+"</font></a>]";
			}else {
				str += "[<font>"+cpage+"</font></a>]";
			}
		}
		//next 10page
		//for���� ���������� �� cpage�� 1��ŭ �����Ǿ��ֱ� ������ �ٷ� ���
		 noffset = countOffset(cpage);
		 if((totalpage-pagelink) >= links) {
			 str += "[<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+">"
					 + "<font>���� 10</font></a>]";
		 }else {
			 str += "[<font>���� 10</font></a>]";
		 }
		 //last page
		 loffset = countOffset(totalpage);
		 if(vpage != totalpage) {
			 str += "[<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+">"
					+ "<font>������</font></a>]";
		 }else {
			str += "[<font>������</font></a>]";
		 }
		str += "</td></tr></table>";
		return str;
	}
	
	//�˻���� ����¡
	public String showPaging(int pagelink, String pagename, String find, String search) {
		String str = "<table><tr><td>";
		int bpage, boffset,cpage,coffset,vpage,noffset,loffset = 0;
		//first page
		if(pagelink != 1) {
			str += "[<a href="+pagename+"?pagelink=1&offset=0>"
					+ "<font>ó��</font></a>]";
		}else {
			str += "[<font>ó��</font></a>]";
		}
		//back 10page
		bpage = pagelink-10;
		boffset = countOffset(bpage);
		if(pagelink > links) {
			str += "[<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+"&find="+find+"&search="+search+">"
					+ "<font>���� 10</font></a>]";
		}else {
			str += "[<font>���� 10</font></a>]";
		}
		//link page
		vpage = pagelink; //������������ �ٸ������� ���
		pagelink = ((pagelink-1)/links)*links+1; //���������� ���ϱ�
		for(cpage=pagelink; cpage<pagelink+links; cpage++) {
			if(cpage>totalpage) break;
			coffset = countOffset(cpage);
			if(cpage!=vpage) {
				str += "[<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+"&find="+find+"&search="+search+">"
						+ "<font>"+cpage+"</font></a>]";
			}else {
				str += "[<font>"+cpage+"</font></a>]";
			}
		}
		//next 10page
		//for���� ���������� �� cpage�� 1��ŭ �����Ǿ��ֱ� ������ �ٷ� ���
		 noffset = countOffset(cpage);
		 if((totalpage-pagelink) >= links) {
			 str += "[<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+"&find="+find+"&search="+search+">"
					 + "<font>���� 10</font></a>]";
		 }else {
			 str += "[<font>���� 10</font></a>]";
		 }
		 //last page
		 loffset = countOffset(totalpage);
		 if(vpage != totalpage) {
			 str += "[<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"&find="+find+"&search="+search+">"
					+ "<font>������</font></a>]";
		 }else {
			str += "[<font>������</font></a>]";
		 }
		str += "</td></tr></table>";
		return str;
	}
	
}
