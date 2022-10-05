package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.BALBean;

public class BALDao {

	public ArrayList<BALBean> getAllByBatiment(int id) throws DaoException {
		
		ArrayList<BALBean> list = new ArrayList<>();
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `bal` WHERE id_Batiment=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				BALBean o = new BALBean();
				
				o.setId(rs.getInt("id"));
				o.setId_Batiment(rs.getInt("id_Batiment"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setTitreBAL(rs.getString("titreBAL"));
				o.setNumeroBAL(rs.getInt("numeroBAL"));
				o.setStopPub(rs.getBoolean("stopPub"));
				o.setProfessionnel(rs.getBoolean("professionnel"));
				o.setParticulier(rs.getBoolean("particulier"));
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
}
