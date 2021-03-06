package page.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadExcelFile {
	public static final int COLUMN_STT = 0;
	public static final int COLUMN_IDUSER = 1;
	public static final int COLUMN_IDDONATION = 2;
	public static final int COLUMN_MONEYDONATE = 3;
	public static final int COLUMN_STATUS = 4;

	public static List<BankList> readExcel(String excelFilePath) throws IOException {
		List<BankList> listTransfer = new ArrayList<>();
		InputStream inputStream = new FileInputStream(new File(excelFilePath));
		Workbook workbook = getWorkbook(inputStream, excelFilePath);

		// Get sheet
		Sheet sheet = workbook.getSheetAt(0);
		Iterator<Row> iterator = sheet.iterator();
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (nextRow.getRowNum() == 0) {
				// Ignore header
				continue;
			}

			Iterator<Cell> cellIterator = nextRow.cellIterator();

			BankList list = new BankList();
			while (cellIterator.hasNext()) {
				// Read cell
				Cell cell = cellIterator.next();
				Object cellValue = getCellValue(cell);
				if (cellValue == null || cellValue.toString().isEmpty()) {
					continue;
				}
				// Set value for book object
				int columnIndex = cell.getColumnIndex();
				switch (columnIndex) {
				case COLUMN_STT:
					list.setStt(((Double) cellValue).intValue());
					break;
				case COLUMN_IDUSER:
					list.setIduser(((Double) getCellValue(cell)).intValue());
					break;
				case COLUMN_IDDONATION:
					list.setIddonation(((Double) cellValue).intValue());
					break;
				case COLUMN_MONEYDONATE:
					list.setMoneydonate(new BigDecimal((double) cellValue));
					break;
				case COLUMN_STATUS:
					list.setStatus((String) getCellValue(cell));
					break;
				default:
					break;
				}
			}
				listTransfer.add(list);
			}
			workbook.close();
			inputStream.close();
			return listTransfer;
	}

	// Get Workbook
	private static Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
		Workbook workbook = null;
		if (excelFilePath.endsWith("xlsx")) {
			workbook = new XSSFWorkbook(inputStream);
		} else if (excelFilePath.endsWith("xls")) {
			workbook = new HSSFWorkbook(inputStream);
		} else {
			throw new IllegalArgumentException("T???p tin n??y kh??ng ph???i excel file");
		}
		return workbook;
	}

	private static Object getCellValue(Cell cell) {
		CellType cellType = cell.getCellTypeEnum();
		Object cellValue = null;
		switch (cellType) {
		case BOOLEAN:
			cellValue = cell.getBooleanCellValue();
			break;
		case FORMULA:
			Workbook workbook = cell.getSheet().getWorkbook();
			FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
			cellValue = evaluator.evaluate(cell).getNumberValue();
			break;
		case NUMERIC:
			cellValue = cell.getNumericCellValue();
			break;
		case STRING:
			cellValue = cell.getStringCellValue();
			break;
		case _NONE:
		case BLANK:
		case ERROR:
			break;
		default:
			break;
		}

		return cellValue;
	}
}