package org.joonzis.service;

public class LanguageServiceImpl implements LanguageService {
    @Override
    public String executeEnglish() {
        return "Hello World!";
    }
    @Override
    public String executeHangeul() {
        return "안녕하세요!";
    }
}