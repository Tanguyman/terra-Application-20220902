package fr.terraApp.beans;

import java.sql.Date;

public class BALBean {

	private int id;
	private int id_Batiment;
	private Date dateEnregistrement;
	private Date dateMAJ;
	private String titreBAL;
	private int numeroBAL;
	private boolean stopPub;
	private boolean professionnel;
	private boolean particulier;
	private int statut;
	private boolean archiver;
	private String commentaire;

	public BALBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BALBean(int id, int id_Batiment, Date dateEnregistrement, Date dateMAJ, String titreBAL, int numeroBAL,
			boolean stopPub, boolean professionnel, boolean particulier, int statut, boolean archiver,
			String commentaire) {
		super();
		this.id = id;
		this.id_Batiment = id_Batiment;
		this.dateEnregistrement = dateEnregistrement;
		this.dateMAJ = dateMAJ;
		this.titreBAL = titreBAL;
		this.numeroBAL = numeroBAL;
		this.stopPub = stopPub;
		this.professionnel = professionnel;
		this.particulier = particulier;
		this.statut = statut;
		this.archiver = archiver;
		this.commentaire = commentaire;
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

	public Date getDateMAJ() {
		return dateMAJ;
	}

	public void setDateMAJ(Date dateMAJ) {
		this.dateMAJ = dateMAJ;
	}

	public String getTitreBAL() {
		return titreBAL;
	}

	public void setTitreBAL(String titreBAL) {
		this.titreBAL = titreBAL;
	}

	public int getNumeroBAL() {
		return numeroBAL;
	}

	public void setNumeroBAL(int numeroBAL) {
		this.numeroBAL = numeroBAL;
	}

	public boolean isStopPub() {
		return stopPub;
	}

	public void setStopPub(boolean stopPub) {
		this.stopPub = stopPub;
	}

	public boolean isProfessionnel() {
		return professionnel;
	}

	public void setProfessionnel(boolean professionnel) {
		this.professionnel = professionnel;
	}

	public boolean isParticulier() {
		return particulier;
	}

	public void setParticulier(boolean particulier) {
		this.particulier = particulier;
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

	@Override
	public String toString() {
		return "BALBean [id=" + id + ", id_Batiment=" + id_Batiment + ", dateEnregistrement=" + dateEnregistrement
				+ ", dateMAJ=" + dateMAJ + ", titreBAL=" + titreBAL + ", numeroBAL=" + numeroBAL + ", stopPub="
				+ stopPub + ", professionnel=" + professionnel + ", particulier=" + particulier + ", statut=" + statut
				+ ", archiver=" + archiver + ", commentaire=" + commentaire + "]\n";
	}

}