@echo off
chcp 65001 >nul

REM Pandoc latex转换docx
pandoc -s main.tex ^
    --filter pandoc-crossref ^
    --bibliography ref/refs.bib ^
    --citeproc --csl china-national-standard-gb-t-7714-2015-numeric.csl ^
    -M pandoc-crossref.yaml ^
    -M reference-section-title=参考文献 ^
    --reference-doc template.docx ^
    -o out.docx 
echo Convert：out.docx

del /q *.aux 2>nul
del /q *.idx 2>nul
del /q *.glo 2>nul
del /q *.hd  2>nul
del /q *.log 2>nul
del /q *.out 2>nul
del /q *.bcf 2>nul
del /q *.blg 2>nul
del /q *.bbl 2>nul
del /q *.run.xml 2>nul
del /q *.synctex.gz 2>nul

echo clean over
pause