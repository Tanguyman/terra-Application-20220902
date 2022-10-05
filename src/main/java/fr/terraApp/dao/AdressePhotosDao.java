package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fr.terraApp.beans.AdressePhotosBean;

public class AdressePhotosDao {

	public ArrayList<AdressePhotosBean> getAll(int id) throws DaoException {
		ArrayList<AdressePhotosBean> list = new ArrayList<>();
		Connection connexion = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connexion = Database.connexion;
			ps = connexion.prepareStatement("SELECT * FROM `adresse_photos` WHERE id_Adresse=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				AdressePhotosBean o = new AdressePhotosBean();

				o.setId(rs.getInt("id"));
				o.setId_Adresse(rs.getInt("id_Adresse"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
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
