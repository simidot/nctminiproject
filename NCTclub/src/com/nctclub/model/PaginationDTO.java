package com.nctclub.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.nctclub.model.NCTmemberDTO.NCTmemberDTOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaginationDTO {
    private int pg;
    private int total;
    private int allPage;
    private int fromPage;
    private int toPage;
    
    public void calculatePages(int rowSize, int block) {
        this.allPage = (int) Math.ceil(this.total / (double) rowSize);
        int currentBlock = (this.pg - 1) / block + 1; // 현재 블록 번호
        this.fromPage = (currentBlock - 1) * block + 1;
        this.toPage = currentBlock * block;
        if (this.toPage > this.allPage) {
            this.toPage = this.allPage;
        }
    }

    public HashMap<String, Integer> getRangeMap(int rowSize) {
        HashMap<String, Integer> map = new HashMap<>();
        map.put("start", (this.pg * rowSize) - (rowSize - 1));
        map.put("end", this.pg * rowSize);
        return map;
    }

}
