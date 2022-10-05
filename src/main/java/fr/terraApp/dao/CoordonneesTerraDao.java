package fr.terraApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.terraApp.beans.BeanException;
import fr.terraApp.beans.CoordonneesTerraBean;

public class CoordonneesTerraDao {

	// READ / RETRIEVE ONE LINE BY id
		public CoordonneesTerraBean getById( int id ) throws DaoException {
			
			Connection connexion = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			CoordonneesTerraBean o = new CoordonneesTerraBean();
			
			try {
				connexion = Database.connexion;
				ps = connexion.prepareStatement("SELECT * FROM `coordonneesTerra` WHERE id=?");
				ps.setInt(1, id);
				
				rs = ps.executeQuery();
				rs.next();
				
				o.setId(rs.getInt("id"));
				o.setNom(rs.getString("nom"));
				o.setAdresse(rs.getString("adresse"));
				o.setTel(rs.getString("tel"));
				o.setMail(rs.getString("mail"));
				o.setLogoURL(rs.getString("logoURL"));;
				o.setArchiver(rs.getBoolean("archiver"));
				
				return o;
				
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DaoException("Impossible de communiquer avec la base de données");
			} catch (BeanException e) {
				e.printStackTrace();
				throw new DaoException("Les données de la base sont invalides");
			}
		}
}
