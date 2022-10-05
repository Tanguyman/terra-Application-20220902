package fr.terraApp.beans;

import java.sql.Date;
import java.util.ArrayList;

public class BatimentBean {

	private int id;
	private int id_Zone_Chalandise;
	private int id_Categorie_batiment;
	private Date dateEnregistrement;
	private Date dateMAJ;
	private String nom;
	private Date anneeConstruction;
	private String typeConstruction;
	private int nombreEtage;
	private String infosComplementaires;
	private int statut;
	private boolean archiver;
	private String commentaire;

	private ArrayList<BatimentEntreesBean> batimentEntrees;
	private ArrayList<BatimentPhotosBean> batimentPhotos;
	private ArrayList<BALBean> balBean;

	public BatimentBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BatimentBean(int id, int id_Zone_Chalandise, int id_Categorie_batiment, Date dateEnregistrement,
			Date dateMAJ, String nom, Date anneeConstruction, String typeConstruction, int nombreEtage,
			String infosComplementaires, int statut, boolean archiver, String commentaire,
			ArrayList<BatimentEntreesBean> batimentEntrees, ArrayList<BatimentPhotosBean> batimentPhotos,
			ArrayList<BALBean> balBean) {
		super();
		this.setId(id);
		this.setId_Zone_Chalandise(id_Zone_Chalandise);
		this.setId_Categorie_batiment(id_Categorie_batiment);
		this.setDateEnregistrement(dateEnregistrement);
		this.setDateMAJ(dateMAJ);
		this.setNom(nom);
		this.setAnneeConstruction(anneeConstruction);
		this.setTypeConstruction(typeConstruction);
		this.setNombreEtage(nombreEtage);
		this.setInfosComplementaires(infosComplementaires);
		this.setStatut(statut);
		this.setArchiver(archiver);
		this.setCommentaire(commentaire);
		this.setBatimentEntrees(batimentEntrees);
		this.setBatimentPhotos(batimentPhotos);
		this.setBalBean(balBean);
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

	public int getId_Categorie_batiment() {
		return id_Categorie_batiment;
	}

	public void setId_Categorie_batiment(int id_Categorie_batiment) {
		this.id_Categorie_batiment = id_Categorie_batiment;
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

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Date getAnneeConstruction() {
		return anneeConstruction;
	}

	public void setAnneeConstruction(Date anneeConstruction) {
		this.anneeConstruction = anneeConstruction;
	}

	public String getTypeConstruction() {
		return typeConstruction;
	}

	public void setTypeConstruction(String typeConstruction) {
		this.typeConstruction = typeConstruction;
	}

	public int getNombreEtage() {
		return nombreEtage;
	}

	public void setNombreEtage(int nombreEtage) {
		this.nombreEtage = nombreEtage;
	}

	public String getInfosComplementaires() {
		return infosComplementaires;
	}

	public void setInfosComplementaires(String infosComplementaires) {
		this.infosComplementaires = infosComplementaires;
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

	public ArrayList<BatimentEntreesBean> getBatimentEntrees() {
		return batimentEntrees;
	}

	public void setBatimentEntrees(ArrayList<BatimentEntreesBean> batimentEntrees) {
		this.batimentEntrees = batimentEntrees;
	}

	public ArrayList<BatimentPhotosBean> getBatimentPhotos() {
		return batimentPhotos;
	}

	public void setBatimentPhotos(ArrayList<BatimentPhotosBean> batimentPhotos) {
		this.batimentPhotos = batimentPhotos;
	}

	
	public ArrayList<BALBean> getBalBean() {
		return balBean;
	}

	public void setBalBean(ArrayList<BALBean> balBean) {
		this.balBean = balBean;
	}

	@Override
	public String toString() {
		return "BatimentBean [id=" + id + ", id_Zone_Chalandise=" + id_Zone_Chalandise + ", id_Categorie_batiment="
				+ id_Categorie_batiment + ", dateEnregistrement=" + dateEnregistrement + ", dateMAJ=" + dateMAJ
				+ ", nom=" + nom + ", anneeConstruction=" + anneeConstruction + ", typeConstruction=" + typeConstruction
				+ ", nombreEtage=" + nombreEtage + ", infosComplementaires=" + infosComplementaires + ", statut="
				+ statut + ", archiver=" + archiver + ", commentaire=" + commentaire + ", batimentEntrees="
				+ batimentEntrees + ", batimentPhotos=" + batimentPhotos + ", balBean=" + balBean + "]\n";
	}

}