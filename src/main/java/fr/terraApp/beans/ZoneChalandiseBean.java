package fr.terraApp.beans;

import java.sql.Date;
import java.util.ArrayList;

public class ZoneChalandiseBean {

	private int id;
	private int id_ClientTerra;
	private Date dateEnregistrement;
	private Date dateMAJ;
	private int numero;
	private String indicateur;
	private String voie_type;
	private String voie_nom;
	private String codePostal;
	private String ville;
	private String quartier;
	private String ilot;
	private String pays;
	private Double longitude;
	private Double latitude;
	private int statut;
	private boolean archiver;
	private String commentaire;

	private ArrayList<AdresseEntreesBean> adresseEntrees = new ArrayList<>();
	private ArrayList<AdressePhotosBean> adressePhotos = new ArrayList<>();
	private ArrayList<BatimentBean> batiments = new ArrayList<>();

	public ZoneChalandiseBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ZoneChalandiseBean(int id, int id_ClientTerra, Date dateEnregistrement, Date dateMAJ, int numero,
			String indicateur, String voie_type, String voie_nom, String codePostal, String ville, String quartier,
			String ilot, String pays, Double longitude, Double latitude, int statut, boolean archiver,
			String commentaire) {
		super();
		this.setId(id);
		this.setId_ClientTerra(id_ClientTerra);
		this.setDateEnregistrement(dateEnregistrement);
		this.setDateMAJ(dateMAJ);
		this.setNumero(numero);
		this.setIndicateur(indicateur);
		this.setVoie_type(voie_type);
		this.setVoie_nom(voie_nom);
		this.setCodePostal(codePostal);
		this.setVille(ville);
		this.setQuartier(quartier);
		this.setIlot(ilot);
		this.setPays(pays);
		this.setLongitude(longitude);
		this.setLatitude(latitude);
		this.setStatut(statut);
		this.setArchiver(archiver);
		this.setCommentaire(commentaire);
	}

	// With all agregations
	public ZoneChalandiseBean(int id, int id_ClientTerra, Date dateEnregistrement, Date dateMAJ, int numero,
			String indicateur, String voie_type, String voie_nom, String codePostal, String ville, String quartier,
			String ilot, String pays, Double longitude, Double latitude, int statut, boolean archiver,
			String commentaire, ArrayList<AdresseEntreesBean> adresseEntrees,
			ArrayList<AdressePhotosBean> adressePhotos) {
		super();
		this.setId(id);
		this.setId_ClientTerra(id_ClientTerra);
		this.setDateEnregistrement(dateEnregistrement);
		this.setDateMAJ(dateMAJ);
		this.setNumero(numero);
		this.setIndicateur(indicateur);
		this.setVoie_type(voie_type);
		this.setVoie_nom(voie_nom);
		this.setCodePostal(codePostal);
		this.setVille(ville);
		this.setQuartier(quartier);
		this.setIlot(ilot);
		this.setPays(pays);
		this.setLongitude(longitude);
		this.setLatitude(latitude);
		this.setStatut(statut);
		this.setArchiver(archiver);
		this.setCommentaire(commentaire);
		this.setAdresseEntrees(adresseEntrees);
		this.setAdressePhotos(adressePhotos);
	}

	public ZoneChalandiseBean(int id, int id_ClientTerra, Date dateEnregistrement, Date dateMAJ, int numero,
			String indicateur, String voie_type, String voie_nom, String codePostal, String ville, String quartier,
			String ilot, String pays, Double longitude, Double latitude, int statut, boolean archiver,
			String commentaire, ArrayList<AdresseEntreesBean> adresseEntrees,
			ArrayList<AdressePhotosBean> adressePhotos, ArrayList<BatimentBean> batiments) {
		super();
		this.setId(id);
		this.setId_ClientTerra(id_ClientTerra);
		this.setDateEnregistrement(dateEnregistrement);
		this.setDateMAJ(dateMAJ);
		this.setNumero(numero);
		this.setIndicateur(indicateur);
		this.setVoie_type(voie_type);
		this.setVoie_nom(voie_nom);
		this.setCodePostal(codePostal);
		this.setVille(ville);
		this.setQuartier(quartier);
		this.setIlot(ilot);
		this.setPays(pays);
		this.setLongitude(longitude);
		this.setLatitude(latitude);
		this.setStatut(statut);
		this.setArchiver(archiver);
		this.setCommentaire(commentaire);
		this.setAdresseEntrees(adresseEntrees);
		this.setAdressePhotos(adressePhotos);
		this.setBatiments(batiments);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_ClientTerra() {
		return id_ClientTerra;
	}

	public void setId_ClientTerra(int id_ClientTerra) {
		this.id_ClientTerra = id_ClientTerra;
	}

	public Date getDateEnregistrement() {
		return dateEnregistrement;
	}

	public void setDateEnregistrement(Date dateEnregistrement) {
		this.dateEnregistrement = dateEnregistrement;
	}

	public Date getDateMAJ() {
		return dateMAJ;
	}

	public void setDateMAJ(Date dateMAJ) {
		this.dateMAJ = dateMAJ;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getIndicateur() {
		return indicateur;
	}

	public void setIndicateur(String indicateur) {
		this.indicateur = indicateur;
	}

	public String getVoie_type() {
		return voie_type;
	}

	public void setVoie_type(String voie_type) {
		this.voie_type = voie_type;
	}

	public String getVoie_nom() {
		return voie_nom;
	}

	public void setVoie_nom(String voie_nom) {
		this.voie_nom = voie_nom;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getQuartier() {
		return quartier;
	}

	public void setQuartier(String quartier) {
		this.quartier = quartier;
	}

	public String getIlot() {
		return ilot;
	}

	public void setIlot(String ilot) {
		this.ilot = ilot;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public int getStatut() {
		return statut;
	}

	public void setStatut(int statut) {
		this.statut = statut;
	}

	public boolean isArchiver() {
		return archiver;
	}

	public void setArchiver(boolean archiver) {
		this.archiver = archiver;
	}

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public ArrayList<AdresseEntreesBean> getAdresseEntrees() {
		return adresseEntrees;
	}

	public void setAdresseEntrees(ArrayList<AdresseEntreesBean> adresseEntrees) {
		this.adresseEntrees = adresseEntrees;
	}

	public ArrayList<AdressePhotosBean> getAdressePhotos() {
		return adressePhotos;
	}

	public void setAdressePhotos(ArrayList<AdressePhotosBean> adressePhotos) {
		this.adressePhotos = adressePhotos;
	}

	public ArrayList<BatimentBean> getBatiments() {
		return batiments;
	}

	public void setBatiments(ArrayList<BatimentBean> batiments) {
		this.batiments = batiments;
	}

	@Override
	public String toString() {
		return "ZoneChalandiseBean [id=" + id + ", id_ClientTerra=" + id_ClientTerra + ", dateEnregistrement="
				+ dateEnregistrement + ", dateMAJ=" + dateMAJ + ", numero=" + numero + ", indicateur=" + indicateur
				+ ", voie_type=" + voie_type + ", voie_nom=" + voie_nom + ", codePostal=" + codePostal + ", ville="
				+ ville + ", quartier=" + quartier + ", ilot=" + ilot + ", pays=" + pays + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", statut=" + statut + ", archiver=" + archiver + ", commentaire="
				+ commentaire + ", adresseEntrees=" + adresseEntrees + ", adressePhotos=" + adressePhotos
				+ ", batiments=" + batiments + "]\n";
	}

}