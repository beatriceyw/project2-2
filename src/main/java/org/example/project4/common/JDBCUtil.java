package org.example.project4.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {

    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {

                // Driver 로드 (MariaDB)
                Class.forName("org.mariadb.jdbc.Driver");

                // → 여기에 본인 walab DB 정보 입력!
                String url  = "jdbc:mariadb://walab.handong.edu:3306/W25_22201030";
                String user = "W25_22201030";
                String pass = "Nich8A";

                conn = DriverManager.getConnection(url, user, pass);
                System.out.println("DB 연결 성공!");
            }

        } catch (Exception e) {
            System.out.println("DB 연결 오류: " + e.getMessage());
        }

        return conn;
    }

}
