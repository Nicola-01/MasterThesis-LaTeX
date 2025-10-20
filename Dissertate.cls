% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[Dissertate Class]
\LoadClass[12pt, twoside, openright, a4paper]{book}

%
% Options
%
\RequirePackage{etoolbox}
\RequirePackage[a-2b,mathxmp]{pdfx}[\today]

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\toggletrue{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[outer=1.2in, inner=1.2in, twoside, a4paper]{geometry}
\usepackage{ragged2e}
%\RaggedRight
\RequirePackage{graphicx}
\usepackage{graphicx}
\usepackage{tabularx}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}
\RequirePackage{mathtools}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{hyperref}
\usepackage[acronym,automake]{glossaries-extra}
\usepackage[acronym,toc]{glossaries}
% Fonts.
\RequirePackage{color}


\renewcommand{\chapterautorefname}{Chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Subsection}
\RequirePackage{url}
\Urlmuskip = 0mu plus 1mu


\RequirePackage{mathspec}
\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={justified},
                justification={RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\arabic{footnote}}
\RequirePackage{microtype}

% Tikz
%\usepackage[table,xcdraw]{xcolor}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest} 
\pgfplotsset{plot coordinates/math parser=false} 
\newlength\fheight
\newlength\fwidth
\usepackage{booktabs}
\usepackage{multirow}
%\usepackage{multicolumn}
\usepackage{subcaption}
\usetikzlibrary{patterns,decorations.pathreplacing,backgrounds,calc}
\usetikzlibrary{positioning,fit,arrows.meta,calc}
\usepackage{afterpage}
\usepackage{tabulary}
\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}
%\usepackage[table,xcdraw]{xcolor}

% Pseudocode
\usepackage{algorithm}
\usepackage{algorithmic}
\renewcommand\algorithmicthen{}
\renewcommand\algorithmicdo{}
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter
\usepackage{lscape}
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}% Algorithm # is <chapter>.<algorithm>
\newcommand{\algorithmautorefname}{Algorithm}

% Abbreviations
\newcommand{\abbrlabel}[1]{\makebox[3cm][l]{\textbf{#1}\ \dotfill}}
\newenvironment{abbreviations}{\begin{list}{}{\renewcommand{\makelabel}{\abbrlabel}}}{\end{list}}

% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[medium, md, sc]{titlesec} % format for the title of the sections
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
%\RequirePackage[super,comma,numbers]{natbib}
\RequirePackage[comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}
\bibliographystyle{IEEEtran}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\mastername#1{\gdef\@mastername{#1}}
\def\studentId#1{\gdef\@studentId{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
%\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\coadvisorsUniversity#1{\gdef\@coadvisorsUniversity{#1}}
\def\academicYear#1{\gdef\@academicYear{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}

% School color 
% \definecolor{SchoolColor}{rgb}{0.71, 0, 0.106} % UNIPD red
\definecolor{SchoolColor}{HTML}{9c0015} % UNIPD red
\definecolor{chaptergrey}{rgb}{0.61, 0, 0.09} % dialed back a little
\definecolor{midgrey}{rgb}{0.4, 0.4, 0.4}

\definecolor{linkGray}{gray}{0.3}

\hypersetup{
    colorlinks,
    %citecolor=SchoolColor,
    %citecolor=linkGray,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    %urlcolor=SchoolColor,
    urlcolor=linkGray,
}

\renewcommand{\frontmatter}{
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\maketitle
	\frontispiece
	\dedicationpage
	\abstractpage
	\tableofcontents
	\phantomsection
	\clearpage

	% figure listing - required if you have any figures
	\phantomsection
	\addcontentsline{toc}{chapter}{List of figures}
	\listoffigures	
	\cleardoublepage

	% table listing - required if you have any tables
	\phantomsection
	\addcontentsline{toc}{chapter}{List of tables}
	\listoftables
	\cleardoublepage

	\acronyms

	\cleardoublepage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}

\newcommand{\cover}{
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\makecover
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\setcounter{page}{1}
	\begin{center}
	\vbox to0pt{\vbox to\textheight{\vfill \includegraphics[width=11.5cm]{resources/unipd-light} \vfill}\vss}
	%\vspace*{\fill}
	\begin{figure}
	\centering
  		\includegraphics[height=2.5cm]{resources/unipd-bn}\hspace{2cm}\includegraphics[height=2.5cm]{resources/math_unipd.png}
	\end{figure}

	\setstretch{1.5}

	\scshape{\huge{\bfseries{\@university}}} \\
	\line(1, 0){400} \\
	\scshape{\large{Department of \@department}} \\
	\vspace{3pt}
	\scshape{\large{\textit{Master Thesis in \@mastername}}} \\

	\vspace{2pt}

	\setstretch{2.5}

	\vspace{10pt}
	\scshape{\LARGE{\bfseries{\textcolor{SchoolColor}{\thetitle}}}} \normalsize \\
	\vspace{15pt}
	
	\setstretch{1.2}

	\vfill
	\begin{normalsize}
	\begin{flushleft}
	  \textit{Supervisor} \hfill \textit{Master Candidate}\\
	  \vspace{1pt}
	  \@advisor \hfill \@author\\
	  \@university \\
	  \vspace{6pt}
	  \textit{Co-supervisor} \hfill \textit{Student ID}\\
	  \@coadvisorOne \hfill \@studentId \\
	  %\@coadvisorTwo \\
	  \@coadvisorsUniversity \\
	\vspace{30pt}
	\centering
	\large{\textit{Academic Year} \\ \@academicYear}
	\end{flushleft}
	\end{normalsize}
	
	\end{center}
	\vspace*{\fill}
	\singlespacing
	\cleardoublepage
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{25pt}
	\begin{center}
	\scshape \noindent \small \copyright \  \small  \theauthor \\
	all rights reserved, \@degreeyear
	\end{center}
	\newpage
	\rm
}

\newcommand{\frontispiece}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	\end{center}
	\vspace*{\fill}
}

\newcommand{\dedicationpage}{
	\phantomsection
	\setcounter{page}{3}
	\vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill}
	\cleardoublepage
	\rm
}

\newcommand{\acknowledgments}{
	\phantomsection
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} \newpage
}

\newcommand{\acronyms}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Listing of acronyms}
	\chapter*{Listing of acronyms}
	\input{frontmatter/abbr.tex}
}

\newcommand{\abstractpage}{
	\phantomsection
	\setcounter{page}{5}
	\addcontentsline{toc}{chapter}{Abstract}
	\chapter*{Abstract}
	\input{frontmatter/abstract}
}

\renewcommand{\backmatter}{
    \begin{appendices}
        \include{chapters/appendixA}
    \end{appendices}
    \input{endmatter/personalize}
    \clearpage
    \bibliography{references}
    \addcontentsline{toc}{chapter}{References}
    \bibliographystyle{apalike2}
    \include{endmatter/colophon}
}

% Listing
\usepackage{listings}

\begin{comment}
    \lstdefinelanguage{json}{
    string=[s]{"}{"},
    stringstyle=\color{SchoolColor},
    comment=[l]{:},
    commentstyle=\color{black},
    basicstyle=\normalfont\ttfamily,
    numbers=left,
    numberstyle=\scriptsize,
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    breaklines=true,
    frame=lines
}
\end{comment}

\definecolor{CodeGray}{gray}{0.3}
\definecolor{backcolour}{HTML}{F7F7F2}
\definecolor{vscFg}{HTML}{D4D4D4}
\definecolor{vscPurple}{HTML}{C586C0} % keywords
\definecolor{vscTeal}{HTML}{4EC9B0}   % types / classes
\definecolor{vscOrange}{HTML}{CE9178} % strings
\definecolor{vscGreen}{HTML}{6A9955}  % comments
\definecolor{vscYellow}{HTML}{DCDCAA} % function/decl names (optional)
\definecolor{vscGutter}{HTML}{858585} % line numbers
\definecolor{keyword1}{HTML}{363457} % line numbers
% \definecolor{keyword2}{HTML}{363457} % line numbers
\definecolor{keyword2}{HTML}{383F51} % line numbers
\definecolor{keyword3}{HTML}{E05A13} % line numbers
\definecolor{stringColor}{HTML}{363457} % line numbers

\lstdefinestyle{code}{
    basicstyle=\small\ttfamily,
    numbers=left,
    numberstyle=\scriptsize\color{CodeGray},
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    tabsize=2,
    breaklines=true,
    frame=lines,
    rulecolor=\color{black!20},
    backgroundcolor=\color{backcolour}, 
    keywordstyle=\bfseries\color{SchoolColor},      % classica keyword
    keywordstyle=[2]\bfseries\color{keyword2},     % tipi / classi
    keywordstyle=[3]\bfseries\color{keyword3},   % nomi funzione (se marcati)
    stringstyle=\color{stringColor},
    commentstyle=\itshape\color{CodeGray},
    captionpos=b,
    keepspaces=true
}

\lstdefinelanguage{Java+JNI}[]{Java}{
    deletekeywords={int,double,boolean,long,short,byte,char,float,void,native},
    morekeywords={native,System,package,import},
    morekeywords=[2]{int,double,boolean,long,short,byte,char,float,void,
                   String,Object,Class},
    morekeywords=[3]{module,requires,open,opens,uses,provides,transitive,record,var,
                native,System,loadLibrary},
}

\lstdefinelanguage{C+JNI}[]{C++}{
    deletekeywords={int,double,boolean,long,short,byte,char,float,void,native},
    morekeywords=[2]{JNIEnv,jobject,jint,jdouble,jstring,JNIEXPORT,JNICALL},
}

\lstdefinelanguage{json}{
  string=[s]{"}{"},
  stringstyle=\color{SchoolColor},
  comment=[l]{:},
  commentstyle=\color{black},
  basicstyle=\small\ttfamily,
  numbers=left,
  numberstyle=\scriptsize,
  stepnumber=1,
  numbersep=8pt,
  showstringspaces=false,
  breaklines=true,
  frame=lines
}

\lstset{style=code}

\definecolor{cSystem}{RGB}{0,188,212}
\definecolor{cJava}{RGB}{139,195,74}
\definecolor{cNative}{RGB}{156,107,197}
\definecolor{cRuntime}{RGB}{255,193,7}
\definecolor{cHAL}{RGB}{116, 208, 219}
\definecolor{cKernel}{RGB}{244,81,30}
\definecolor{cPM}{RGB}{244,81,30}

\tikzset{
  layer/.style={
    rounded corners=3pt,
    draw=black!30,
    align=center,
    minimum height=7mm
  }
}


% \usepackage{svg}
\usepackage{caption}
\usepackage{pgf-umlsd}
%\usepackage{forest}
\captionsetup{justification=centering, singlelinecheck=false}

\usepackage[edges]{forest}

%\definecolor{foldercolor}{RGB}{124,166,198}
\definecolor{foldercolor}{gray}{0.8}

\tikzset{pics/folder/.style={code={%
    \node[inner sep=0pt, minimum size=#1, xshift=6.5pt] (-foldericon) {};
    \node[folder style, inner sep=0pt, minimum width=0.45*#1, minimum height=0.6*#1, above right, xshift=0.05*#1, yshift=-0.85] at (-foldericon.west) {};
    \node[folder style, inner sep=0pt, minimum width=#1, minimum height=0.75*#1] at (-foldericon.center) {};
}}, 
pics/folder/.default={20pt}, % Larghezza di default per la cartella
folder style/.style={draw=foldercolor!80!black, top color=foldercolor!40, bottom color=foldercolor} % Stile della cartella
}

\forestset{is file/.style={edge path'/.expanded={%
        ([xshift=\forestregister{folder indent}]!u.parent anchor) |- (.child anchor)},
        inner sep=0.7pt},
    is root/.style={edge path'/.expanded={%
        ([xshift=100*\forestregister{folder indent}]!u.parent anchor) |- (.child anchor)},
        inner sep=0.7pt},
    this folder size/.style={edge path'/.expanded={%
        ([xshift=\forestregister{folder indent}]!u.parent anchor) |- (.child anchor) pic[solid]{folder=#1}}, inner xsep=1.3*#1},
    folder tree indent/.style={before computing xy={l=#1}},
    folder icons/.style={folder, this folder size=#1, folder tree indent=3*#1},
    folder icons/.default={10pt},
}
