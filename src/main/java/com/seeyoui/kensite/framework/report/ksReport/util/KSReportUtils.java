package com.seeyoui.kensite.framework.report.ksReport.util;

import java.util.List;

import com.seeyoui.kensite.framework.report.ksReport.domain.KSReportCell;

public class KSReportUtils {
	//报表数组行数
	private static final int ROW_SIZE = 99;
	//报表数组列数
	private static final int COL_SIZE = 99;
	
	/**
	 * cell重新布局，以便往excel里面铺数据
	 * @param cellList
	 */
	public static void cellReLayout(List<KSReportCell> cellList) {
		KSReportCell[][] cellArray = new KSReportCell[ROW_SIZE][COL_SIZE];
		for(KSReportCell ksReportCell : cellList) {
			int row = ksReportCell.getRow();
			int col = ksReportCell.getCol();
			cellArray[row][col] = ksReportCell;
		}
		int[] maxRowSize = new int[ROW_SIZE];
		int[] maxColSize = new int[COL_SIZE];
		maxCellRowSize(maxRowSize, maxColSize, cellArray);
		reLocation(maxRowSize, maxColSize, cellArray);
	}
	
	/**
	 * 同行最大列及同列最大行，数量计算
	 * @param maxRowSize
	 * @param maxColSize
	 * @param cellArray
	 */
	public static void maxCellRowSize(int[] maxRowSize, int[] maxColSize, KSReportCell[][] cellArray) {
		for(int i=0; i<ROW_SIZE; i++) {
			int colSize = maxColSize[i];
			for(int j=0; j<COL_SIZE; j++) {
				if(cellArray[i][j] != null && cellArray[i][j].getDirection()==2 && cellArray[i][j].getCellValueSize() > colSize) {
					maxColSize[i] = cellArray[i][j].getCellValueSize()-1;
				}
			}
		}
		KSReportCell[][] cellArrayTurn = new KSReportCell[ROW_SIZE][COL_SIZE];
		for(int i=0 ; i<ROW_SIZE; i++){
			for(int j=0; j<COL_SIZE; j++){
				cellArrayTurn[j][i] = cellArray[i][j];
			}
		}
		for(int i=0; i<COL_SIZE; i++) {
			int rowSize = maxRowSize[i];
			for(int j=0; j<COL_SIZE; j++) {
				if(cellArrayTurn[i][j] != null && cellArrayTurn[i][j].getDirection()==1 && cellArrayTurn[i][j].getCellValueSize() > rowSize) {
					maxRowSize[i] = cellArrayTurn[i][j].getCellValueSize()-1;
				}
			}
		}
	}
	
	/**
	 * 单元格按照最大行与列重新放置位置
	 * @param maxRowSize
	 * @param maxColSize
	 * @param cellArray
	 */
	public static void reLocation(int[] maxRowSize, int[] maxColSize, KSReportCell[][] cellArray) {
		for(int i=0; i<ROW_SIZE; i++) {
			for(int j=0; j<COL_SIZE; j++) {
				KSReportCell ksReportCell = cellArray[i][j];
				if(ksReportCell == null) {
					continue;
				}
				int rowAdd = getSumSize(maxColSize, i);
				int colAdd = getSumSize(maxRowSize, j);
				int row = ksReportCell.getRow();
				int col = ksReportCell.getCol();
				ksReportCell.setRow(row + rowAdd);
				ksReportCell.setCol(col + colAdd);
			}
		}
	}
	
	//按照下标获取左或上，的最大行列扩展数
	public static int getSumSize(int[] size, int index) {
		int sum = 0;
		for(int i=0; i<index; i++) {
			sum += size[i];
		}
		return sum;
	}
}
