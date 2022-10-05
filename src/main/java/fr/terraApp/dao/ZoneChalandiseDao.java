package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.ZoneChalandiseBean;

public class ZoneChalandiseDao {

	public ArrayList<ZoneChalandiseBean> getAllAddresses(int id) throws DaoException {

		ArrayList<ZoneChalandiseBean> list = new ArrayList<>();
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `zone_chalandise` WHERE id_ClientTerra=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				ZoneChalandiseBean o = new ZoneChalandiseBean();
				
				o.setId(rs.getInt("id"));
				o.setId_ClientTerra(rs.getInt("id_ClientTerra"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setNumero(rs.getInt("numero"));
				o.setIndicateur(rs.getString("indicateur"));
				o.setVoie_type(rs.getString("voie_type"));
				o.setVoie_nom(rs.getString("voie_nom"));
				o.setCodePostal(rs.getString("codePostal"));
				o.setVille(rs.getString("ville"));
				o.setQuartier(rs.getString("quartier"));
				o.setIlot(rs.getString("ilot"));
				o.setPays(rs.getString("pays"));
				o.setLongitude(rs.getDouble("longitude"));
				o.setLatitude(rs.getDouble("latitude"));
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

	public ArrayList<ZoneChalandiseBean> getAllFromAddress(int id) throws DaoException {

		ArrayList<ZoneChalandiseBean> list = new ArrayList<>();
		AdresseEntreesDao aeDao = new AdresseEntreesDao();
		AdressePhotosDao apDao = new AdressePhotosDao();
		BatimentDao bDao = new BatimentDao();
		
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `zone_chalandise` WHERE id_ClientTerra=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				ZoneChalandiseBean o = new ZoneChalandiseBean();
				
				o.setId(rs.getInt("id"));
				o.setId_ClientTerra(rs.getInt("id_ClientTerra"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setNumero(rs.getInt("numero"));
				o.setIndicateur(rs.getString("indicateur"));
				o.setVoie_type(rs.getString("voie_type"));
				o.setVoie_nom(rs.getString("voie_nom"));
				o.setCodePostal(rs.getString("codePostal"));
				o.setVille(rs.getString("ville"));
				o.setQuartier(rs.getString("quartier"));
				o.setIlot(rs.getString("ilot"));
				o.setPays(rs.getString("pays"));
				o.setLongitude(rs.getDouble("longitude"));
				o.setLatitude(rs.getDouble("latitude"));
				o.setStatut(rs.getInt("statut"));
				o.setArchiver(rs.getBoolean("archiver"));
				o.setCommentaire(rs.getString("commentaire"));
				
				o.setAdresseEntrees(aeDao.getAll(o.getId()));
				o.setAdressePhotos(apDao.getAll(o.getId()));
				o.setBatiments(bDao.getAllFromBatiment(o.getId()));
				
				list.add(o);
			}
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
	
	public ZoneChalandiseBean getById(int id) throws fr.terraApp.dao.DaoException {

		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ZoneChalandiseBean o = new ZoneChalandiseBean();

		try {
			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT `id`, `id_ClientTerra`, "
					+ "`dateEnregistrement`, `dateMAJ`, `numero`, "
					+ "`indicateur`, `voie_type`, `voie_nom`, `codePostal`, "
					+ "`ville`, `quartier`, `ilot`, `pays`, `longitude`, `latitude`, "
					+ "`statut`, `archiver`, `commentaire` FROM `zone_chalandise` "
					+ "WHERE id=?");
			ps.setInt(1, id);

			rs = ps.executeQuery();
			rs.next();

			o.setId(rs.getInt("id"));
			o.setId_ClientTerra(rs.getInt("id_ClientTerra"));
			o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
			o.setDateMAJ(rs.getDate("dateMAJ"));
			o.setNumero(rs.getInt("numero"));
			o.setIndicateur(rs.getString("indicateur"));
			o.setVoie_type(rs.getString("voie_type"));
			o.setVoie_nom(rs.getString("voie_nom"));
			o.setCodePostal(rs.getString("codePostal"));
			o.setVille(rs.getString("ville"));
			o.setQuartier(rs.getString("quartier"));
			o.setIlot(rs.getString("ilot"));
			o.setPays(rs.getString("pays"));
			o.setLongitude(rs.getDouble("longitude"));
			o.setLatitude(rs.getDouble("latitude"));
			o.setStatut(rs.getInt("statut"));
			o.setArchiver(rs.getBoolean("archiver"));
			o.setCommentaire(rs.getString("commentaire"));

			return o;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données");
		}
	}
}
