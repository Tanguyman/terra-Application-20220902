package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.BatimentPhotosBean;

public class BatimentPhotosDao {

	public ArrayList<BatimentPhotosBean> getAll(int id) throws DaoException {
		ArrayList<BatimentPhotosBean> list = new ArrayList<>();
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `batiment_photos` WHERE id_Batiment=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				BatimentPhotosBean o = new BatimentPhotosBean();

				o.setId(rs.getInt("id"));
				o.setId_Batiment(rs.getInt("id_Batiment"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setCategorie(rs.getString("categorie"));
				o.setUrl(rs.getString("url"));

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
