package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CrawlingController {
	@RequestMapping("cgv.json")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> cgvJson() {
		ArrayList<HashMap<String, Object>> array = new ArrayList<>();
		System.setProperty("webdriver.chrome.driver", "d:/spring/chromedriver.exe"); // 드라미버 정의
		ChromeOptions options= new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);
		driver.get("http://www.cgv.co.kr/movies/");
		
		// 더보기버튼 클릭
		WebElement btnMore = driver.findElement(By.className("btn-more-fontbold"));
		btnMore.click();
		System.out.println("----------------------------------------------------------------------------------------------------\n" + driver.getPageSource());
		List<WebElement> listMore = driver.findElement(By.id("movie_more_container")).findElements(By.tagName("li"));
//		System.out.println(listMore.size());
		
		for(WebElement e:listMore) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("title", e.findElement(By.className("title")).getText());
			map.put("image", e.findElement(By.tagName("img")).getAttribute("src"));
			array.add(map);
		}
		
		return array;
	}
}
