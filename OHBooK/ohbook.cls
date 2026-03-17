%%
%% This is file `ohbook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ohbook.dtx  (with options: `cls')
%% This is a generated file of ohbook.cls.
%% ...
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{ohbook}
[2025/12/08 v1.0 OpenHarmony Book]
\LoadClass[zihao=5,openright]{ctexbook}
\RequirePackage{indentfirst}  % 章节标题后首段缩进
\RequirePackage{setspace}     % 行距控制
\RequirePackage{geometry}     % 页面尺寸
\RequirePackage{fancyhdr}     % 页眉页脚
\pagestyle{empty}             % 取消所有页眉页脚
\geometry{
    a4paper,
    left=3.18cm,
    right=3.18cm,
    top=2.54cm,
    bottom=2.54cm
}
\setlength{\parskip}{0.5em}   % 段落间距
\setlength{\parindent}{2em}   % 首行缩进
\setstretch{1.5}              % 1.5 倍行距
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Courier New}
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  citecolor=blue
}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\captionsetup{
  labelsep=space,
  labelformat=simple
}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{xcolor}
\RequirePackage{makecell}
\RequirePackage{colortbl}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\newlist{myenum}{enumerate}{3}
\setlist[myenum]{
  label=(\arabic*),
  leftmargin=2em,
  labelsep=0.5em,
  itemsep=3pt,
  parsep=0pt,
  topsep=5pt,
  partopsep=0pt
}
\newlist{myitem}{itemize}{2}
\setlist[myitem]{
  label=•,
  leftmargin=1.5em,
  itemsep=0pt,
  parsep=0pt,
  topsep=0pt,
  partopsep=0pt
}
\RequirePackage{underscore}
\RequirePackage{listings}
\RequirePackage{xcolor}
\lstset{
    language=C,
    basicstyle=\tt,
    numbers=left,
    rulesepcolor=\color{red!20!green!20!blue!20},
    escapeinside=``,
    xleftmargin=2em, xrightmargin=2em,
    aboveskip=1em,
    framexleftmargin=1.2mm,
    frame=shadowbox,
    backgroundcolor=\color[RGB]{245,245,244},
    keywordstyle=\color{blue}\bfseries,
    identifierstyle=\bf,
    numberstyle=\color[RGB]{0,192,192},
    commentstyle=\it\color[RGB]{96,96,96},
    stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},
    showstringspaces=false,
    tabsize=4,
    breaklines=true,
    breakatwhitespace=true,
    columns=fullflexible
}
\RequirePackage{titlesec}
\titleformat{\chapter}[hang]
  {\centering\bfseries\fontsize{22pt}{22pt}\selectfont}
  {单元\thechapter}
  {0.2em}
  {}
\titlespacing*{\chapter}
  {0pt}{-30pt}{0.5\baselineskip}
\renewcommand{\thesection}{\chinese{section}}
\titleformat{\section}[hang]
  {\centering\bfseries\fontsize{16pt}{16pt}\selectfont}
  {任务\thesection}
  {0.2em}
  {}
\titlespacing*{\section}
  {0pt}{13pt}{0.5\baselineskip}
\titleformat{\subsection}[hang]
  {\bfseries\fontsize{10.5pt}{10.5pt}\selectfont}
  {\chinese{subsection}、}
  {0.2em}
  {}
\titlespacing*{\subsection}
  {0pt}{0pt}{0.5\baselineskip}
\RequirePackage[backend=biber,style=gb7714-2015,gbpub=false]{biblatex}
\newcommand{\addbibresourcecmd}[1]{\addbibresource{#1}}   % 加载 bib 文件
\newcommand{\printbibliographycmd}{\printbibliography}     % 打印参考文献
\endinput
%%
%% End of file `ohbook.cls'.
