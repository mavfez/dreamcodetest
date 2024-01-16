package com.dreamcode.dreamcodetestapp.repository;

import com.dreamcode.dreamcodetestapp.dto.Category;
import com.dreamcode.dreamcodetestapp.dto.Keyword;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mauricio Viveros
 */
public class DreamcodeTestRepo {

    public List<Keyword> getKeywords(int categoryId) {

        List<Keyword> lstKeyword = new ArrayList<>();
        String sql = "select "
                + "k.keyword_id, k.description as keyword "
                + "from "
                + "categories c "
                + "left join keywords k on(c.category_id=k.category_id) "
                + "where "
                + "c.category_id=?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://127.0.0.1:5432/dreamcodetest", "postgres", "pgadmin"); PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Keyword kw = new Keyword();
                kw.setKeywordId(resultSet.getInt("keyword_id"));
                kw.setDescription(resultSet.getString("keyword"));
                lstKeyword.add(kw);
            }

        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lstKeyword;
    }

    public List<Category> getLevelCategory() {

        List<Category> lstCats = new ArrayList<>();
        String sql = "select "
                + "c.category_id, c.description as category,  kh.parent_id, kh.level "
                + "from "
                + "categories c "
                + "left join categories_hierarchy kh on(c.category_id=kh.child_id) "
                + "order by c.category_id";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://127.0.0.1:5432/dreamcodetest", "postgres", "pgadmin"); PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Category cat = new Category();
                cat.setCategoryId(resultSet.getInt("category_id"));
                cat.setCategoryDescription(resultSet.getString("category"));
                cat.setLevel(resultSet.getInt("level"));
                lstCats.add(cat);
            }

        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lstCats;
    }
}
