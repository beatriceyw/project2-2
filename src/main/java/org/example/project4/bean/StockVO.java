package org.example.project4.bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public class StockVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    private String stockCode;
    private String stockName;
    private Double pbr;
    private Double per;
    private LocalDateTime createDate;   // DB 컬럼 create_date 대응

    public StockVO() {}

    public StockVO(Long id, String stockCode, String stockName,
                   Double pbr, Double per, LocalDateTime createDate) {
        this.id = id;
        this.stockCode = stockCode;
        this.stockName = stockName;
        this.pbr = pbr;
        this.per = per;
        this.createDate = createDate;
    }

    /* ===== GETTERS ===== */
    public Long getId() { return id; }
    public String getStockCode() { return stockCode; }
    public String getStockName() { return stockName; }
    public Double getPbr() { return pbr; }
    public Double getPer() { return per; }
    public LocalDateTime getCreateDate() { return createDate; }

    public String getCreateDateText() {
        if (createDate == null) return "";
        return createDate.format(
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        );
    }

    /* ===== SETTERS ===== */
    public void setId(Long id) { this.id = id; }

    public void setStockCode(String stockCode) {
        this.stockCode = (stockCode == null ? null : stockCode.trim());
    }

    public void setStockName(String stockName) {
        this.stockName = (stockName == null ? null : stockName.trim());
    }

    public void setPbr(Double pbr) { this.pbr = pbr; }
    public void setPer(Double per) { this.per = per; }
    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StockVO)) return false;
        StockVO other = (StockVO) o;
        return Objects.equals(stockCode, other.stockCode);
    }

    @Override
    public int hashCode() {
        return Objects.hash(stockCode);
    }

    @Override
    public String toString() {
        return String.format("[%s] %s (%s) PBR=%s, PER=%s, created=%s",
                id,
                stockName,
                stockCode,
                pbr == null ? "-" : pbr,
                per == null ? "-" : per,
                createDate == null ? "-" : getCreateDateText());
    }
}
