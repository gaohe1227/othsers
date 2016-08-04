package com.doadway.common.util;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.tree.DefaultDocumentType;

/**
 * 
 * @ClassName XmlToolBox 
 * @Description xml工具操作类
 * @author zhoutanxin
 * @date Aug 28, 2013 4:41:16 PM
 * @mail zhoutanxin@xinnet.com
 */
public class XmlToolBox {

	private Document doc = null;

	public Document getDoc() {
		return doc;
	}
	/**
	 * 
	 * @Description 将doc对象注入
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:41:38 PM
	 * @throws
	 */
	public void setDoc(Document doc) {
		this.doc = doc;
	}
	/**
	 * 
	 * @Description 构造方法 实例化对象的时候注入document对象
	 * @param doc
	 */
	public XmlToolBox(Document doc) {
		setDoc(doc);
	}
	/**
	 * 
	 * @Description 构造方法 将xml字符串转换为document对象
	 * @param xmlString
	 * @throws DocumentException
	 */
	public XmlToolBox(String xmlString) throws DocumentException {
		doc = XmlUtils.xmlString2Doc(xmlString);
	}
	/**
	 * 
	 * @Description 构造方法 将文件转换为document对象
	 * @param file
	 * @throws DocumentException
	 */
	public XmlToolBox(File file) throws DocumentException {
		doc = XmlUtils.file2Doc(file);
	}
	/**
	 * 
	 * @Description 构造方法 将流转换成document对象
	 * @param stream
	 */
	public XmlToolBox(InputStream stream) {
		doc = XmlUtils.stream2Doc(stream, false);
	}
	/**
	 * 
	 * @Description 构造方法 空构造方法
	 */
	public XmlToolBox(){
		
	}
	/**
	 * 
	 * @Description 删除某节点下的属性
	 * @param element 节点名称
	 * @param attribute 属性名称 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:49:05 PM
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	public void delAttribute(String element, String attribute) {
		List<Attribute> attrs = doc.selectNodes("//" + element + "/@" + attribute);
		for (Attribute attr : attrs) {
			attr.detach();
		}
	}
	/**
	 * 
	 * @Description 删除节点信息
	 * @param element 节点名称 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:49:54 PM
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	public void delElement(String element) {
		List<Element> els = doc.selectNodes("//" + element);
		for (Element el : els) {
			el.detach();
		}
	}
	/**
	 * 
	 * @Description 获得单一节点属性值
	 * @param element 节点名称
	 * @param attribute 属性名称
	 * @return String 返回某节点下某属性的值
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:50:25 PM
	 * @throws
	 */
	public String getAttributeValue(String element, String attribute) {
		Attribute att = (Attribute) doc.selectSingleNode("//" + element + "/@" + attribute);
		if(att != null)
			return att.getValue();
		else
			return null;
	}
	/**
	 * 
	 * @Description 获得节点信息
	 * @param @param element 节点名称
	 * @return Element 返回节点信息 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:51:38 PM
	 * @throws
	 */
	public Element getElement(String element) {
		return (Element) doc.selectSingleNode("//" + element);
	}
	/**
	 * 
	 * @Description 获得节点集合
	 * @param element 节点名称
	 * @return List<Element> 返回节点集合 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:52:27 PM
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	public List<Element> getElementList(String element) {
		return (List<Element>) doc.selectNodes("//" + element);
	}
	/**
	 * 
	 * @Description 获得节点文本数据
	 * @param element 节点名称
	 * @return String 返回节点文本数据 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:53:02 PM
	 * @throws
	 */
	public String getElementText(String element) {
		return ((Element) doc.selectSingleNode("//" + element)).getText().trim();
	}
	/**
	 * 
	 * @Description 给某个节点下某个属性赋值
	 * @param element 节点名称
	 * @param attribute 属性名称
	 * @param attributeValue 属性值 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:53:46 PM
	 * @throws
	 */
	public void setAttribute(String element, String attribute, String attributeValue) {
		Attribute att = (Attribute) doc.selectSingleNode("//" + element + "/@" + attribute);
		if (att == null) {
			((Element) doc.selectSingleNode("//" + element)).addAttribute(attribute, attributeValue);
		} else {
			att.setValue(attributeValue);
		}
	}
	/**
	 * 
	 * @Description 给某个几点添加文本信息
	 * @param element 节点名称
	 * @param text 文本信息 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:54:36 PM
	 * @throws
	 */
	public void setElementText(String element, String text) {
		if (text == null) {
			text = "";
		}
		//
		Element el = (Element) doc.selectSingleNode("//" + element);
		el.setText(text);
	}
	/**
	 * 
	 * @Description 给某个父节点下的某节点添加文本信息,如果节点为空才创建节点
	 * @param parentElement 父节点名称
	 * @param element 子节点名称
	 * @param text 文本信息 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:55:51 PM
	 * @throws
	 */
	public void setElementText(String parentElement, String element, String text) {
		if (text == null) {
			text = "";
		}
		//
		Element el = (Element) doc.selectSingleNode("//" + parentElement + "/" + element);
		if (el == null) {
			Element parentEl = (Element) doc.selectSingleNode("//" + parentElement);
			el = parentEl.addElement(element);
		}
		//
		el.setText(text);
	}
	/**
	 * 
	 * @Description 添加子节点文本 不管空不空都添加文本
	 * @param parentElement 父节点
	 * @param element 子节点
	 * @param text 文本信息 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 4:59:24 PM
	 * @throws
	 */
	public void addElementText(String parentElement, String element, String text){
		if (text == null) {
			text = "";
		}
		//
		Element parentEl = (Element) doc.selectSingleNode("//" + parentElement);
		Element el = parentEl.addElement(element);
		//
		el.setText(text);
	}
	
	/**
	 * 
	 * @Description 添加节点信息
	 * @param parentElementPath 父节点
	 * @param newElementName 子节点名称
	 * @param attributeMap 属性集合
	 * @param text 文本内容
	 * @author zhoutanxin
	 * @date Aug 28, 2013 5:01:38 PM
	 * @throws
	 */
	public void addElement(String parentElementPath, String newElementName, Map<String, String> attributeMap, String text) {
		Element newElement = DocumentHelper.createElement(newElementName);
		Element parentEl = (Element) doc.selectSingleNode("//" + parentElementPath);
		parentEl.add(newElement);
		//
		if(attributeMap != null){
			Set<Entry<String, String>> entrySet = attributeMap.entrySet();
			for(Entry<String, String> entry:entrySet) {
				newElement.addAttribute(entry.getKey(), entry.getValue());
			}
		}
		//
		if(text != null) {
			newElement.setText(text);
		}
	}
	/**
	 * 
	 * @Description 设置document对象类型
	 * @param elementName 节点名称
	 * @param publicID 公共id
	 * @param systemID 系统id 
	 * @author zhoutanxin
	 * @date Aug 28, 2013 5:03:11 PM
	 * @throws
	 */
	public void setDocType(String elementName, String publicID, String systemID) {
		doc.setDocType(new DefaultDocumentType(elementName, publicID, systemID));
	}
	
	public static void main(String args[]) throws Exception{
		XmlToolBox xmlToolBox = new XmlToolBox();
		xmlToolBox.setDoc(XmlUtils.file2Doc("D:\\a.xml"));
		
		xmlToolBox.addElement("response", "ss", null, "test");
		
		System.out.println(XmlUtils.formatXml(XmlUtils.doc2XmlString(xmlToolBox.getDoc())));
	}
}
