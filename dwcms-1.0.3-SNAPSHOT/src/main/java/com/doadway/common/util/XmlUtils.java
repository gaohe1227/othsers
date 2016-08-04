package com.doadway.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentFactory;
import org.dom4j.DocumentHelper;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.util.StringUtils;




/**
 * 
 * @ClassName XmlUtils 
 * @Description xml工具类
 * @author zhoutanxin
 * @date Aug 28, 2013 2:41:40 PM
 * @mail zhoutanxin@xinnet.com
 */
public class XmlUtils {
	protected static Log log = LogFactory.getLog(XmlUtils.class);
	/**
	 * 
	 * @Description 将文件转换为doc对象
	 * @param filePath 文件路径
	 * @return Document 返回Document对象
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:42:51 PM
	 * @throws
	 */
	public static Document file2Doc(String filePath) throws DocumentException {
		return file2Doc(new File(filePath));
	}
    /**
     * 
     * @Description 将文件转换为doc对象
     * @param file 文件
     * @return Document 返回Document对象
     * @author zhoutanxin
     * @date Aug 28, 2013 2:43:59 PM
     * @throws
     */
	public static Document file2Doc(File file) throws DocumentException {
		SAXReader reader = new SAXReader();
		Document document = reader.read(file);
		return document;
	}
	/**
	 * 
	 * @Description 获取节点属性值
	 * @param @param node 节点名称
	 * @param @param attribute 属性名称
	 * @param @param defaultValue 默认值
	 * @return String 返回节点属性值
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:45:37 PM
	 * @throws
	 */
	public static String getAttributeValue(Node node, String attribute, String defaultValue) {
		String attributeValue = node.valueOf("@" + attribute);
		if (attributeValue == null) {
			attributeValue = defaultValue;
		}
		return attributeValue;
	}
	/**
	 * 
	 * @Description 将流信息转换为Document对象
	 * @param @param stream 输入流信息
	 * @param @param validate 是否验证
	 * @return Document 返回Document对象
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:47:49 PM
	 * @throws
	 */
	public static Document stream2Doc(InputStream stream, boolean validate) {
		Document doc = null;
		try {
			SAXReader reader = new SAXReader(validate);
			doc = reader.read(stream);
		}
		catch (DocumentException ex) {
			log.error("", ex);
			doc = null;
		}
		return doc;
	}
	/**
	 * 
	 * @Description 将doc对象转换为文件
	 * @param @param doc 对象
	 * @param @param file 文件
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:48:48 PM
	 * @throws
	 */
	public static synchronized void doc2File(Document doc, File file) throws Exception {
		doc2File(doc, file, null);
	}
	/**
	 * 
	 * @Description 将doc对象转换为文件
	 * @param @param doc 对象
	 * @param @param file 文件
	 * @param @param encode 编码格式
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:49:25 PM
	 * @throws
	 */
	public static synchronized void doc2File(Document doc, File file, String encode) throws Exception {
		XMLWriter writer = null;
		try {
			//
			if (StringUtils.hasText(encode)) {
				OutputFormat format = OutputFormat.createPrettyPrint();
				format.setEncoding(encode);
				//
				writer = new XMLWriter(new FileOutputStream(file), format);
			}
			else {
				writer = new XMLWriter(new FileOutputStream(file));
			}
			writer.write(doc);
		} catch (Exception ex) {
			throw ex;
		} finally {
			if (writer != null) {
				writer.close();
				writer = null;
			}
		}
	}

	/**
	 * 
	 * @Description 将doc对象转为输出流
	 * @param @param doc 对象
	 * @param @param out 输出流
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:50:26 PM
	 * @throws
	 */
	public static synchronized void doc2OutputStream(Document doc, OutputStream out) throws IOException {
		XMLWriter writer = new XMLWriter(out);
		writer.write(doc);
		writer.close();
	}

	/**
	 * 
	 * @Description 将doc书写
	 * @param @param doc
	 * @param @param out
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:51:10 PM
	 * @throws
	 */
	public static synchronized void doc2Writer(Document doc, Writer out) throws IOException {
		// OutputFormat format = OutputFormat.createPrettyPrint();
		// format.setEncoding(doc.getXMLEncoding());
		XMLWriter writer = new XMLWriter(out);
		writer.write(doc);
		writer.close();
	}

	/**
	 * 
	 * @Description 将doc按xml格式输出
	 * @param @param doc
	 * @return String 返回xml格式的数据 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:51:46 PM
	 * @throws
	 */
	public static synchronized String doc2XmlString(Document doc) {
		return doc.asXML();
	}

	/**
	 * 
	 * @Description 将xml字符串数据转为doc对象
	 * @param @param xmlString
	 * @return Document 返回Document对象 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:56:29 PM
	 * @throws
	 */
	public static synchronized Document xmlString2Doc(String xmlString) throws DocumentException {
		return DocumentHelper.parseText(xmlString);
	}

	public static void main(String args[]) {
		Document doc = DocumentFactory.getInstance().createDocument();
		System.out.println(doc.asXML());
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<display-name>123</display-name>");
		sb.append("<welcome-file-list>");
		sb.append("<welcome-file>index.jsp</welcome-file>");
		sb.append("</welcome-file-list>");
		System.out.println(sb.toString());;
		//doc = stream2Doc(new ByteArrayInputStream(sb.toString().getBytes()),false);
	
		
	}
	/**
	 * 
	 * @Description 格式化xml文件
	 * @param @param str 
	 * @param @return
	 * @param @throws Exception 设定文件 
	 * @return String 返回类型 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 2:59:06 PM
	 * @throws
	 */
	public static String formatXml(String str) throws Exception {
		Document doc = new SAXReader().read(new StringReader(str.trim()));
		OutputFormat formater = OutputFormat.createPrettyPrint();
		formater.setEncoding("utf-8");

		StringWriter strWriter = new StringWriter();
		XMLWriter writer = new XMLWriter(strWriter, formater);
		writer.write(doc);
		writer.close();
		return (strWriter.toString());
	}
	/**
	 * 
	 * @Description 将xml文件转换为javabean对象
	 * @param @param object 对象
	 * @param @param inputStream 流信息
	 * @param @return
	 * @param @throws JAXBException 设定文件 
	 * @return Object 返回类型 
	 * @author zhoutanxin
	 * @date Oct 9, 2013 4:22:35 PM
	 * @throws
	 */
	public static Object xml2java(Class object,InputStream inputStream) throws JAXBException{
    	JAXBContext context = JAXBContext.newInstance(object);   
        Unmarshaller unmarshaller = context.createUnmarshaller(); 
        
        //File file = new File("src/people.xml");  
        
        return unmarshaller.unmarshal(inputStream);   
    }
	

}
