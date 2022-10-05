package fr.terraApp.beans;

public class BatimentEntreesBean {

	private int id;
	private int id_Batiment;
	private String moyensAcces;
	private String moyensCommunication;

	public BatimentEntreesBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BatimentEntreesBean(int id, int id_Batiment, String moyensAcces, String moyensCommunication) {
		super();
		this.id = id;
		this.id_Batiment = id_Batiment;
		this.moyensAcces = moyensAcces;
		this.moyensCommunication = moyensCommunication;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_Batiment() {
		return id_Batiment;
	}

	public void setId_Batiment(int id_Batiment) {
		this.id_Batiment = id_Batiment;
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

	@Override
	public String toString() {
		return "BatimentEntreesBean [id=" + id + ", id_Batiment=" + id_Batiment + ", moyensAcces=" + moyensAcces
				+ ", moyensCommunication=" + moyensCommunication + "]\n";
	}

}