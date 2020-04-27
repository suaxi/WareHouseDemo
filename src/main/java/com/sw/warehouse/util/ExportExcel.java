package com.sw.warehouse.util;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExportExcel {
    public static Workbook createWorkBook(List<?> lists, String[] keys, String columnNames[], Class<?> clazz) throws Exception {
        List<Map<String, Object>> listMap = initData(lists, clazz);
        // 创建excel工作簿
        //Workbook wb = new HSSFWorkbook();
        // 创建第一个sheet（页），并命名
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet= wb.createSheet(listMap.get(0).get("sheetName").toString());
        // 手动设置列宽，第一个参数表示要为第几列设，第二个参数表示列的宽度，n为列高的像素数。
        for (int i = 0; i < keys.length; i++) {
            sheet.setColumnWidth(i, (int)35.7 * 150);
        }
        // 创建第一行
        Row row = sheet.createRow(0);

        // 创建两种单元格格式
        CellStyle cs = wb.createCellStyle();
        CellStyle cs2 = wb.createCellStyle();

        // 创建两种字体
        Font f = wb.createFont();
        Font f2 = wb.createFont();

        // 创建第一种字体样式（用于列名）
        f.setFontHeightInPoints((short) 14);
        f.setColor(IndexedColors.BLACK.getIndex());
        f.setBoldweight(Font.BOLDWEIGHT_BOLD);

        // 创建第二种字体样式（用于值）
        f2.setFontHeightInPoints((short) 14);
        f2.setColor(IndexedColors.BLACK.getIndex());

        // 设置第一种单元格的样式（用于列名）
        cs.setFont(f);
//        cs.setBorderLeft(CellStyle.BORDER_THIN);
//        cs.setBorderRight(CellStyle.BORDER_THIN);
//        cs.setBorderTop(CellStyle.BORDER_THIN);
//        cs.setBorderBottom(CellStyle.BORDER_THIN);
        cs.setAlignment(CellStyle.ALIGN_CENTER);

        // 设置第二种单元格的样式（用于值）
        cs2.setFont(f2);
//        cs2.setBorderLeft(CellStyle.BORDER_THIN);
//        cs2.setBorderRight(CellStyle.BORDER_THIN);
//        cs2.setBorderTop(CellStyle.BORDER_THIN);
//        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);
        //设置列名
        for (int i = 0; i < columnNames.length; i++) {
            Cell cell = row.createCell(i);
            cell.setCellValue(columnNames[i]);
            cell.setCellStyle(cs);
        }
        //设置每行每列的值
        for (int i = 1; i < listMap.size(); i++) {
            // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
            // 创建一行，在页sheet上
            Row row1 = sheet.createRow(i);
            // 在row行上创建一个方格
            for (int j = 0; j < keys.length; j++) {
                Cell cell = row1.createCell(j);
                cell.setCellValue(listMap.get(i).get(keys[j]) == null ? " " : listMap.get(i).get(keys[j]).toString());
                cell.setCellStyle(cs2);
            }
        }
        return wb;
    }

    private static List<Map<String, Object>> initData(List<?> lists, Class<?> clazz) throws Exception {
        List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("sheetName", "sheet1");
        listmap.add(map);
        Object object;
        Field[] fields = clazz.getDeclaredFields();
        for (int j = 0; j < lists.size(); j++) {
            object = lists.get(j);
            Map<String, Object> mapValue = new HashMap<>();
            mapValue.put("no", j+1);
            for (Field field : fields) {
                field.setAccessible( true );
                mapValue.put(field.getName(), field.get(object));
            }
            listmap.add(mapValue);
        }
        return listmap;
    }

}
