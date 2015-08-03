package kr.co.yj.vo;

import java.util.List;

public class FavorPlace {
	
	private String areacode;
	private List<Favor> list;
	
	public String getAreacode() {
		return areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public List<Favor> getList() {
		return list;
	}

	public void setList(List<Favor> list) {
		this.list = list;
	}
	private static class Favor {
		private String name;
		private int value;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getValue() {
			return value;
		}
		public void setValue(int value) {
			this.value = value;
		}
		@Override
		public String toString() {
			return "Favor [name=" + name + ", value=" + value + "]";
		}
	}
}
