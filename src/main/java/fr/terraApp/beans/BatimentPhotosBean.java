package fr.terraApp.beans;

import java.sql.Date;

public class BatimentPhotosBean {

	private int id;
	private int id_Batiment;
	private Date dateEnregistrement;
	private String categorie;
	private String url;
	
	public BatimentPhotosBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BatimentPhotosBean(int id, int id_Batiment, Date dateEnregistrement, String categorie, String url) {
		super();
		this.setId(id);
		this.setId_Batiment(id_Batiment);
		this.setDateEnregistrement(dateEnregistrement);
		this.setCategorie(categorie);
		this.setUrl(url);
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
	public Date getDateEnregistrement() {
		return dateEnregistrement;
	}
	public void setDateEnregistrement(Date dateEnregistrement) {
		this.dateEnregistrement = dateEnregistrement;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "BatimentPhotosBean [id=" + id + ", id_Batiment=" + id_Batiment + ", dateEnregistrement="
				+ dateEnregistrement + ", categorie=" + categorie + ", url=" + url + "]\n";
	}
	
}