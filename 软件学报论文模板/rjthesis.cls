\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rjthesis}[2019/11/13 Software journal paper]


%%%%%%%%%%%%%%%%%%%%%%%%%加载类
\LoadClass[twoside, UTF8]{ctexart}  % twoside可以设计奇偶不一样的页眉

%%%%%%%%%%%%%%%%%%%%%%%%%加载包
\RequirePackage{geometry}        % 定制页边距
\RequirePackage{fancyhdr}        % 设置页眉页脚
\RequirePackage{CJK, CJKnumb}    % 引入中文支持
\RequirePackage{titlesec }       % 设置各级标题的样式
\RequirePackage{ifthen}          % 用来进行判断的宏包
\RequirePackage{enumitem}        % 设置enumerate/itemize等的item距离




%%%%%%%%%%%%%%%%%%%%%%%%%设置字体
\newcommand{\song}{\CJKfamily{song}}    % 宋体   (Windows自带simsun.ttf)
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体 (Windows自带simfs.ttf)
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体   (Windows自带simkai.ttf)
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体   (Windows自带simhei.ttf)
\newcommand{\li}{\CJKfamily{li}}        % 隶书   (Windows自带simli.ttf)



%%%%%%%%%%%%%%%%%%%%%%%%%定义字号
\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}


%%%%%%%%%%%%%%%%%%%%%%%%%定义一些变量
\newcommand{\@rjtitle}{}
\newcommand{\@rjauthor}{}
\newcommand{\@rjinfor}{}

\newcommand{\rjtitle}[1]{\renewcommand{\@rjtitle}{#1}}
\newcommand{\rjauthor}[1]{\renewcommand{\@rjauthor}{#1}}
\newcommand{\rjinfor}[1]{\renewcommand{\@rjinfor}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%定义一些命令
\newcommand{\rj}{软件学报}

\newcommand{\rjmaketitle}{%
	\begin{flushleft}
	    ~\par\vspace{1em}
		{\sihao\hei\@rjtitle}\\
		\vspace{8pt}
		{\xiaosihao\fs{\@rjauthor}}\\
		\vspace{12pt}
		{\zihao{8}\song\@rjinfor}
	\end{flushleft}}

\newcommand{\rjkeywords}[1]{\xiaowuhao {\hei关键词:}\hspace{1em}{\kai#1}\vspace{2em}}


%%%%%%%%%%%%%%%%%%%%%%%%%定义环境

\newenvironment{rjabstract}{
%	 \setlength{\baselineskip}{20pt}  %设置行间距
	 \renewcommand{\baselinestretch}{1.0}  % 设置行间距为单倍
	 \begin{flushleft}\xiaowuhao {\hei 摘\hspace{2em}要:} \kai}
{\end{flushleft}\xiaowuhao}



%%%%%%%%%%%%%%%%%%%%%%%%%定义计数器


%%%%%%%%%%%%%%%%%%%%%%%%%重新定义一下内置命令，例如section/subsection等命令
% \@startsection{name}{level}{indent}{beforskip}{afterskip}
\renewcommand\section{\@startsection{section}{1}{\z@}%
	{8pt}%
	{8pt}%
	{\heiti\wuhao}}

\renewcommand\subsection{\@startsection{subsection}{1}{\z@}%
	{4.5pt}%
	{4.5pt}%
	{\heiti\xiaowuhao}}

\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

\renewcommand{\theenumi}{(\arabic{enumi})}




%%%%%%%%%%%%%%%%%%%%%%%%%开始设置页眉和页脚
\pagestyle{fancy}
\fancyhf{}                            % 清除页眉页脚
%\fancyhead[LO]{\kai\xiaowuhao 陈翔 等:静态软件缺陷预测方法研究}
%\fancyhead[RO]{\thepage}   % 设置奇数页右边页眉
\fancyhead[RE]{\xiaowuhao\textit{\xiaowuhao Journal of Software} \kai软件学报}  
\fancyhead[LE]{\thepage}              % 设置偶数页左边页眉
\renewcommand{\headrulewidth}{0pt}    % 去掉下划线

%\newcommand{\rjhead}[1]{\fancyhead[LO]{\xiaowuhao\kai #1}}
% 设置首页跟其他页面不一样
\fancyhead[RO]{\ifthenelse{\value{page}=1}{\setlength{\lineskip}{5pt}\liuhao\song E-mail: jos@iscas.ac.cn\\http://www.jos.org.cn\\Tel: +86-10-62562563}{\thepage}}
\newcommand{\rjhead}[1]{%
	\fancyhead[LO]{\ifthenelse{\value{page}=1}{\setlength{\lineskip}{0pt}\liuhao\song 软件学报ISSN 1000-9825, CODEN RUXUEW\\Journal of Software, [doi: 10.13328/j.cnki.jos.000000]\\©中国科学院软件研究所版权所有.}{\xiaowuhao\kai #1}}}

\setlength{\headheight}{13pt}
\setlength{\linespread}{1}  % 设置文本行间距为单倍
\setlist{nosep}
