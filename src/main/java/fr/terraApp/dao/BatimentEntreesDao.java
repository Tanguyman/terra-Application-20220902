package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.BatimentEntreesBean;

public class BatimentEntreesDao {

	public ArrayList<BatimentEntreesBean> getAll(int id) throws DaoException {

		ArrayList<BatimentEntreesBean> list = new ArrayList<>();
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `batiment_entrees` WHERE id_Batiment=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				BatimentEntreesBean o = new BatimentEntreesBean();
				
				o.setId(rs.getInt("id"));
				o.setId_Batiment(rs.getInt("id_Batiment"));
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
