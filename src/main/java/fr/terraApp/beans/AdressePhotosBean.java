package fr.terraApp.beans;

import java.sql.Date;

public class AdressePhotosBean {

	private int id;
	private int id_Adresse;
	private Date dateEnregistrement;
	private String url;
	
	
	public AdressePhotosBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AdressePhotosBean(int id, int id_Adresse, Date dateEnregistrement, String url) {
		super();
		this.setId(id);
		this.setId_Adresse(id_Adresse);
		this.setDateEnregistrement(dateEnregistrement);
		this.setUrl(url);
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_Adresse() {
		return id_Adresse;
	}
	public void setId_Adresse(int id_Adresse) {
		this.id_Adresse = id_Adresse;
	}
	public Date getDateEnregistrement() {
		return dateEnregistrement;
	}
	public void setDateEnregistrement(Date dateEnregistrement) {
		this.dateEnregistrement = dateEnregistrement;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "AdressePhotosBean [id=" + id + ", id_Adresse=" + id_Adresse + ", dateEnregistrement="
				+ dateEnregistrement + ", url=" + url + "]\n";
	}
	
	
}
