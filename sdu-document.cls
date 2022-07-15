% sdu-document.cls
%
%    A LaTex class for writing official documents.
%    本LaTex Class用于正式文件的写作。
%    
%    作者：   J.QI
%    邮箱：   j.qi@sdu.edu.cn
%    All right reserved. 未经许可不可公开。 
%
%    Version
%    --------------
%
%    2022/06/23    1.0    First attempt to create this cls file. 
%
%    没有解决的问题：
%    1. 标题上方的距离如何增加
%    2. \xiaobiaosong 和 \fontsize{30pt} 同时使用的时候，不能加粗，而且还报错 Missing number, treated as zero.



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sdu-document}[2020/11/29 \space v1.0 \space SDU Technic Report]

%使用ctexart这个class进行编辑
\LoadClass[a4paper,30pt]{ctexart} % 中文支持，使用article 模板进行修改





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页面布局详细属性/PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% ---------------------- -------------------%
\RequirePackage[
paper=a4paper,
top=3.7cm,
bottom=3.5cm,
left=3.8cm,
right=3.8cm]
%bindingoffset=0cm,
%headsep=6mm,      % header separation, above text body
%footskip=6mm]     % footer skip, below text body
{geometry}
% \setlength{\parskip}{3mm plus2mm minus1mm}
%\setlength{\belowcaptionskip}{12pt}
%\setlength{\abovecaptionskip}{12pt}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 多种需求的包/MISCELLANEOUS PACKAGES.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{siunitx} % 方便使用SI单位
%\RequirePackage{graphicx}
\RequirePackage[english]{babel} % For language-specific hyphenation.
%\RequirePackage{cite} % Automatically sort and range citations numbers.
%\RequirePackage{environ} % For easy definition of environments.
%\RequirePackage{rotating} % For rotating objects.
\RequirePackage{setspace}
\RequirePackage{xeCJK}
\RequirePackage{tabularx}
\RequirePackage{indentfirst} %用来设置首行缩进的宏包
\setlength{\parindent}{2em} %设置首行缩进

%\RequirePackage{ccaption} %使用中文表头
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF文件输出/PDF OUTPUT.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PDF settings and properties.
%\RequirePackage{hyperref}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 颜色/COLORS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[usenames]{color} % For colors.
\definecolor{RED}{RGB}{255,0,0} % 正红色




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 特殊字段/SPECIAL COMMANDS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\issueNumber}[1]{\gdef\@issueNumber{#1}}
\newcommand{\pressDate}[1]{\gdef\@pressDate{#1}}
\newcommand{\schoolName}[1]{\gdef\@schoolName{#1}}


 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FONTS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fontspec}
%\defaultfontfeatures{Mapping=tex-text} % to support TeX conventions like "---".
\RequirePackage{xunicode} % Unicode support for LaTeX character names (accents, European chars, etc.).
% 设置英文字体
\setmainfont{Times New Roman}    %衬线字体  
\setmonofont{Courier New}        %无衬线字体
\setsansfont{Arial}              %等宽字体，一般是打印机字体(中文都是等宽的)
 

% 将方正小标宋简体定义成xiaobiaosong, 并将\xiaobiaosong关联成这个字体
\setCJKfamilyfont{xiaobiaosong}[AutoFakeBold]{方正小标宋简体}
\setCJKmainfont[AutoFakeBold=2]{FangSong}
\newcommand*{\xiaobiaosong}{\CJKfamily{xiaobiaosong}}


\setCJKfamilyfont{kaiti}{楷体}
\newcommand*{\kaiti}{\CJKfamily{kaiti}}



%定议章节标题格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTION HEADINGS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\sectionmark}[1]{\markright{#1}}
% Section heading fonts.
\RequirePackage[explicit]{titlesec} % 设计章节题目


\titlespacing*{\section}%
{0em}% left
{2em}% vertical space before title
{1em}% vertical space after title
[0em]% right

\titleformat{\section}
[hang]
{\rmfamily\Large\bfseries\raggedright}
{\rmfamily\fangsong\Large\bfseries~\thesection}
{0pt}
{\Large\quad#1}
[]


%------行距------
\linespread{1.4}
\addtolength{\parskip}{.3ex}
%------行距------





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页眉页脚/SECTION HEADINGS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 设置页眉页脚需要使用fancyhdr 这个宏包。
%

%------页眉页脚------
\RequirePackage{fancyhdr}
%----清除设置----
\pagestyle{fancy}
%\fancypagestyle{plain}%
%\fancypagestyle{plain}
\fancyhead{} % clear all fields
\fancyfoot{}
\fancyfoot[c]{}
\fancyhf{}
%----清除设置----
%----页眉划线----
%将页眉划线设置为0

\renewcommand{\headrulewidth}{0pt}

%----页眉划线----

%----眉脚内容----
% ----------页眉----------
\pagestyle{fancyplain}
%\fancyhf{}
% ----------页脚----------
%\cfoot{--{~\thepage~}--}  % 页码居中显示
\fancyhead{} % clear all fields
\fancyfoot[RO]{--{~\thepage~}--}   % 页码居外侧显示
%----眉脚内容----
%------页眉页脚------






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Command to create a title page
%如果是会议纪要
\newcommand{\frontMatterMeeting}{%
%\thispagestyle{empty}% 这个地方一定要用 thispagestyle,壁面覆盖其他而面的格式
% 题目
%{\vrule width 0cm height 0cm}
        % \end{center}
\begin{center}
        \begin{spacing}{4}%使用spacing命令调整行间距
        \vspace{15pt}
                {\xiaobiaosong\bfseries\color{RED}\@title} 
        \vspace{12pt}
        \end{spacing}
{\Large\fangsong{（第~\@issueNumber~期）}}\\ 
\vspace{1.0cm}
{\Large\kaiti{\@schoolName~~~~~\@pressDate}}\\ 
%\vspace{0.2cm}
\noindent\color{RED}\rule{\textwidth}{1.0pt}
%{\color{RED}\bfseries{------------------------------------------------------------------------------------------------------------------}}\\
\end{center}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%如果是正式汇报报告

\newcommand{\frontMatterDocument}{
\begin{center}
\begin{spacing}{1.5}
     \xiaobiaosong\zihao{2}\@title
\end{spacing}
\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Command to create a distribution page
%
\newcommand{\distributionpage}{%
\begin{center}
\vspace{0.5cm}
{\color{RED}\bfseries{------------------------------------------------------------------------------------------------------------}}\\
\end{center}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








