package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.AdresseEntreesBean;

public class AdresseEntreesDao {

	public ArrayList<AdresseEntreesBean> getAll(int id) throws DaoException {

		ArrayList<AdresseEntreesBean> list = new ArrayList<>();
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `adresse_entrees` WHERE id_Zone_Chalandise=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				AdresseEntreesBean o = new AdresseEntreesBean();
				
				o.setId(rs.getInt("id"));
				o.setId_Zone_Chalandise(rs.getInt("id_Zone_Chalandise"));
				o.setMoyensAcces(rs.getString("moyensAcces"));
				o.setMoyensCommunication(rs.getString("moyensCommunication"));
				
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
