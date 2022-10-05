package fr.terraApp.beans;

public class AdresseEntreesBean {

	private int id;
	private int id_Zone_Chalandise;
	private String moyensAcces;
	private String moyensCommunication;
	private ZoneChalandiseBean zcB;

	public AdresseEntreesBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdresseEntreesBean(int id, int id_Zone_Chalandise, String moyensAcces, String moyensCommunication,
			ZoneChalandiseBean zcB) {
		super();
		this.setId(id);
		this.setId_Zone_Chalandise(id_Zone_Chalandise);
		this.setMoyensAcces(moyensAcces);
		this.setMoyensCommunication(moyensCommunication);
		this.setZcB(zcB);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_Zone_Chalandise() {
		return id_Zone_Chalandise;
	}

	public void setId_Zone_Chalandise(int id_Zone_Chalandise) {
		this.id_Zone_Chalandise = id_Zone_Chalandise;
	}

	public String getMoyensAcces() {
		return moyensAcces;
	}

	public void setMoyensAcces(String moyensAcces) {
		this.moyensAcces = moyensAcces;
	}

	public String getMoyensCommunication() {
		return moyensCommunication;
	}

	public void setMoyensCommunication(String moyensCommunication) {
		this.moyensCommunication = moyensCommunication;
	}

	public ZoneChalandiseBean getZcB() {
		return zcB;
	}

	public void setZcB(ZoneChalandiseBean zcB) {
		this.zcB = zcB;
	}

	@Override
	public String toString() {
		return "AdresseEntreesBean [id=" + id + ", id_Zone_Chalandise=" + id_Zone_Chalandise + ", moyensAcces="
				+ moyensAcces + ", moyensCommunication=" + moyensCommunication + ", zcB=" + zcB + "]\n";
	}

}