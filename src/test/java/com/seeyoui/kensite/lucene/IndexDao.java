package com.seeyoui.kensite.lucene;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.SortField.Type;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.IOContext;
import org.apache.lucene.store.RAMDirectory;

/**
 * 
 * @author cuichen
 */

public class IndexDao {
	// 源文件
	String filePath1 = "D:\\lucene5.3\\luceneSourceFile\\Ext Tree属性方法.txt";
	String filePath2 = "D:\\lucene5.3\\luceneSourceFile\\oracle创建表空间.txt";
	String filePath3 = "D:\\lucene5.3\\luceneSourceFile\\poi合并单元格.txt";
	// 索引文件
	String indexPath = "D:\\lucene5.3\\luceneIndex";
	// 分词器
	Analyzer analyzer = new SmartChineseAnalyzer();// 词库分词
	// Analyzer analyzer = new SmartChineseAnalyzer();// 词库分词

	/**
	 * 创建索引
	 * 
	 * @throws Exception
	 */
	public void createIndex() throws Exception {
		FSDirectory fsDir = FSDirectory.open(Paths.get(indexPath));
		// 1.启动时读取原有磁盘索引文件
		Directory ramDir = new RAMDirectory(fsDir, new IOContext());

		IndexWriterConfig config = new IndexWriterConfig(analyzer);
		IndexWriter ramIndexWiter = new IndexWriter(ramDir, config);

		// 2. 添加 Document
		Document doc1 = file2Document(filePath1);
		Document doc2 = file2Document(filePath2);
		Document doc3 = file2Document(filePath3);

		// 内存索引添加Document
		ramIndexWiter.addDocument(doc1);
		ramIndexWiter.addDocument(doc2);
		ramIndexWiter.addDocument(doc3);
		ramIndexWiter.close();

		// 2.退出时将内存索引保存到磁盘索引中
		IndexWriterConfig indexConfig = new IndexWriterConfig(analyzer);
		IndexWriter fsIndexWriter = new IndexWriter(fsDir, indexConfig);
		fsIndexWriter.addIndexes(ramDir);
		fsIndexWriter.close();
	}

	/**
	 * 根据关键字删除索引
	 * 
	 * @param term
	 */
	public void delete(Term term) {
		IndexWriterConfig indexConfig = new IndexWriterConfig(analyzer);
		FSDirectory fsDir = null;
		IndexWriter indexWriter = null;
		try {
			fsDir = FSDirectory.open(Paths.get(indexPath));
			indexWriter = new IndexWriter(fsDir, indexConfig);
			indexWriter.deleteDocuments(term);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			try {
				indexWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 根据关键字更新索引
	 * 
	 * <pre>
	 * indexWriter.deleteDocuments(term);
	 * indexWriter.addDocument(doc);
	 * </pre>
	 * 
	 * @param term
	 * @param doc
	 */
	public void update(Term term, Document doc) {
		IndexWriterConfig indexConfig = new IndexWriterConfig(analyzer);
		FSDirectory fsDir = null;
		IndexWriter indexWriter = null;
		try {
			fsDir = FSDirectory.open(Paths.get(indexPath));
			indexWriter = new IndexWriter(fsDir, indexConfig);
			indexWriter.updateDocument(term, doc);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			try {
				indexWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 搜索
	 */
	public void search() {
		IndexReader reader = null;
		try {
			reader = DirectoryReader
					.open(FSDirectory.open(Paths.get(indexPath)));
			IndexSearcher searcher = new IndexSearcher(reader);
			// 排序
			Sort sort = new Sort();
			sort.setSort(new SortField("name", Type.SCORE)); // 默认为升序
			// lucene 5.x不建议使用filter,而使用BooleanQuery来代替
			// Filter filter = new TermFilter(new Term("title", "A"));
			// 2、搜索解析器
			QueryParser parser = new QueryParser("content", analyzer);
			Query query = parser.parse("orcl");
			// lucene 4.x 此方法已经过时，不建议使用filter,而使用BooleanQuery来代替
			// TopDocs topDocs = searcher.search(query, filter,
			// Integer.MAX_VALUE, sort);
			TopDocs topDocs = searcher.search(query, Integer.MAX_VALUE, sort);
			int recordCount = topDocs.totalHits;
			System.out.println("总共有【" + recordCount + "】条匹配结果");
			List<Document> recordList = new ArrayList<Document>();
			// 准备高亮器
			Formatter formatter = new SimpleHTMLFormatter("<font color='red'>",
					"</font>");
			Scorer scorer = new QueryScorer(query);
			Highlighter highlighter = new Highlighter(formatter, scorer);
			// 摘要
			Fragmenter fragmenter = new SimpleFragmenter(50);
			highlighter.setTextFragmenter(fragmenter);
			// 3取出当前页的数据
			int end = Math.min(10, topDocs.totalHits);
			// 循环读出前10条
			for (int i = 0; i < end; i++) {
				ScoreDoc scoreDoc = topDocs.scoreDocs[i];
				int docSn = scoreDoc.doc; // 文档内部编号
				Document doc = searcher.doc(docSn); // 根据编号取出相应的文档
				// 返回高亮后的结果，如果当前属性值中没有出现关键字，会返回 null
				String hc = highlighter.getBestFragment(analyzer, "content",
						doc.get("content"));
				if (hc == null) {
					String content = doc.get("content");
					int endIndex = Math.min(50, content.length());
					hc = content.substring(0, endIndex);// 最多前50个字符
				}
				doc.removeField("content");
				doc.add(new Field("content", hc, TextField.TYPE_STORED));
				recordList.add(doc);
			}
			for (Document document : recordList) {
				System.out.println("------------------------------");
				System.out.println("name     = " + document.get("name"));
				System.out.println("content  = " + document.get("content"));
				System.out.println("size     = " + document.get("size"));
				System.out.println("path     = " + document.get("path"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * //1.将文本转化为doc对象
	 * 
	 * @param path
	 * @return
	 */
	public Document file2Document(String path) {
		File file = new File(path);
		Document doc = new Document();
		doc.add(new Field("name", file.getName(), StringField.TYPE_STORED));
		doc.add(new Field("content", readFileContent(file),
				TextField.TYPE_STORED));
		doc.add(new LongField("size", file.length(), LongField.TYPE_STORED));
		doc.add(new Field("path", file.getAbsolutePath(),
				StringField.TYPE_STORED));
		return doc;
	}

	/**
	 * 读取文件内容
	 */
	public static String readFileContent(File file) {
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(file)));
			StringBuffer content = new StringBuffer();

			for (String line = null; (line = reader.readLine()) != null;) {
				content.append(line).append("\n");
			}
			return content.toString();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) {
		IndexDao indexDao = new IndexDao();
		try {
//			indexDao.createIndex();
			indexDao.search();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
