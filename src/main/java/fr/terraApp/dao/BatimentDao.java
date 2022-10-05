package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.BatimentBean;

public class BatimentDao {

	public ArrayList<BatimentBean> getAll(int id) throws DaoException {
		
		ArrayList<BatimentBean> list = new ArrayList<>();
		
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `batiments` WHERE id_Zone_Chalandise=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				BatimentBean o = new BatimentBean();
				
				o.setId(rs.getInt("id"));
				o.setId_Zone_Chalandise(rs.getInt("id_Zone_Chalandise"));
				o.setId_Categorie_batiment(rs.getInt("id_Categorie_batiment"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setNom(rs.getString("nom"));
				o.setAnneeConstruction(rs.getDate("anneeConstruction"));
				o.setTypeConstruction(rs.getString("typeConstruction"));
				o.setNombreEtage(rs.getInt("nombreEtage"));
				o.setInfosComplementaires(rs.getString("infosComplementaires"));
				o.setStatut(rs.getInt("statut"));
				o.setArchiver(rs.getBoolean("archiver"));
				o.setCommentaire(rs.getString("commentaire"));

				list.add(o);
			}

			return list;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
	
	public ArrayList<BatimentBean> getAllFromBatiment(int id) throws DaoException {
		
		ArrayList<BatimentBean> list = new ArrayList<>();
		BatimentEntreesDao beDao = new BatimentEntreesDao();
		BatimentPhotosDao bpDao = new BatimentPhotosDao();
		BALDao balDao = new BALDao();
		
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `batiments` WHERE id_Zone_Chalandise=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				BatimentBean o = new BatimentBean();
				
				o.setId(rs.getInt("id"));
				o.setId_Zone_Chalandise(rs.getInt("id_Zone_Chalandise"));
				o.setId_Categorie_batiment(rs.getInt("id_Categorie_batiment"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setNom(rs.getString("nom"));
				o.setAnneeConstruction(rs.getDate("anneeConstruction"));
				o.setTypeConstruction(rs.getString("typeConstruction"));
				o.setNombreEtage(rs.getInt("nombreEtage"));
				o.setInfosComplementaires(rs.getString("infosComplementaires"));
				o.setStatut(rs.getInt("statut"));
				o.setArchiver(rs.getBoolean("archiver"));
				o.setCommentaire(rs.getString("commentaire"));
				
				o.setBatimentEntrees(beDao.getAll(o.getId()));
				o.setBatimentPhotos(bpDao.getAll(o.getId()));
				o.setBalBean(balDao.getAllByBatiment(o.getId()));

				list.add(o);
			}

			return list;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
}
