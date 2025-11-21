package org.example.project4.dao;

import org.example.project4.common.JDBCUtil;
import org.example.project4.bean.StockVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockDao {

    /* ===== 목록 조회 (이름순 정렬) ===== */
    public List<StockVO> findAllOrderByName() {
        String sql = "SELECT id, stock_code, stock_name, pbr, per, create_date " +
                "FROM stocks ORDER BY stock_name ASC";

        List<StockVO> list = new ArrayList<>();

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    /* ===== 목록 조회 (입력순 정렬: 최근 등록순) ===== */
    public List<StockVO> findAllOrderByInserted() {
        String sql = "SELECT id, stock_code, stock_name, pbr, per, create_date " +
                "FROM stocks ORDER BY create_date ASC";

        List<StockVO> list = new ArrayList<>();

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    /* ===== 검색 (코드/이름 LIKE) ===== */
    public List<StockVO> search(String keyword) {
        String sql = "SELECT id, stock_code, stock_name, pbr, per, create_date " +
                "FROM stocks " +
                "WHERE stock_code LIKE ? OR stock_name LIKE ? " +
                "ORDER BY stock_name ASC";

        List<StockVO> list = new ArrayList<>();
        String like = "%" + keyword + "%";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, like);
            ps.setString(2, like);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    /* ===== 단건 조회 (id 기준) ===== */
    public StockVO findById(Long id) {
        String sql = "SELECT id, stock_code, stock_name, pbr, per, create_date " +
                "FROM stocks WHERE id = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    /* ===== 단건 조회 (code 기준) ===== */
    public StockVO findByCode(String code) {
        String sql = "SELECT id, stock_code, stock_name, pbr, per, create_date " +
                "FROM stocks WHERE stock_code = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, code);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    /* ===== insert ===== */
    public void insert(StockVO vo) {
        String sql = "INSERT INTO stocks (stock_code, stock_name, pbr, per) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, vo.getStockCode());
            ps.setString(2, vo.getStockName());

            if (vo.getPbr() != null) ps.setDouble(3, vo.getPbr());
            else ps.setNull(3, Types.DOUBLE);

            if (vo.getPer() != null) ps.setDouble(4, vo.getPer());
            else ps.setNull(4, Types.DOUBLE);

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /* ===== update (id 기준) ===== */
    public boolean updateById(Long id, String code, String name,
                              Double pbr, Double per) {
        String sql = "UPDATE stocks " +
                "SET stock_code = ?, stock_name = ?, pbr = ?, per = ? " +
                "WHERE id = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, code);
            ps.setString(2, name);

            if (pbr != null) ps.setDouble(3, pbr);
            else ps.setNull(3, Types.DOUBLE);

            if (per != null) ps.setDouble(4, per);
            else ps.setNull(4, Types.DOUBLE);

            ps.setLong(5, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /* ===== delete (code 기준) ===== */
    public boolean delete(String code) {
        String sql = "DELETE FROM stocks WHERE stock_code = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, code);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /* ===== 공통 row 매핑 ===== */
    private StockVO mapRow(ResultSet rs) throws SQLException {
        StockVO vo = new StockVO();

        vo.setId(rs.getLong("id"));
        vo.setStockCode(rs.getString("stock_code"));
        vo.setStockName(rs.getString("stock_name"));

        double pbr = rs.getDouble("pbr");
        if (!rs.wasNull()) {
            vo.setPbr(pbr);
        }

        double per = rs.getDouble("per");
        if (!rs.wasNull()) {
            vo.setPer(per);
        }

        // 🔥 컬럼명도 create_date로 맞춤
        Timestamp ts = rs.getTimestamp("create_date");
        if (ts != null) {
            vo.setCreateDate(ts.toLocalDateTime());
        }

        return vo;
    }
}
