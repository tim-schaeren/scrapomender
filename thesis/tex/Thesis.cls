%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis LaTeX Template - THESIS CLASS FILE
%
% This class file defines the structure and design of the template. 
%
% Original header:
% This is file `Thesis.cls', based on 'ECSthesis.cls', by Steve R. Gunn
% generated with the docstrip utility.
%
% Created by Steve R. Gunn, modified by Sunil Patel: www.sunilpatel.co.uk
% Further modified by www.latextemplates.com
% Further modified by Michael Stauffer
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Thesis}
              [2007/22/02 v1.0
   LaTeX document class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}

\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}
\usepackage{setspace}
\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\usepackage{vmargin}

\RequirePackage[utf8]{inputenc} % Allows the use of international characters (e.g. Umlauts)

\newcommand{\missingPackages}{04_Packages} % Define folder with missing packages

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------
\setmarginsrb  { 1.5in}  % left margin
                        { 0.6in}  % top margin
                        { 1.0in}  % right margin
                        { 0.8in}  % bottom margin
                        {  20pt}  % head height
                        {0.25in}  % head sep
                        {   9pt}  % foot height
                        { 0.3in}  % foot sep
%----------------------------------------------------------------------------------------
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.

\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\usepackage[centerlast,small,sc]{caption}
\setlength{\captionmargin}{20pt}
\newcommand{\fref}[1]{Figure~\ref{#1}}
\newcommand{\tref}[1]{Table~\ref{#1}}
\newcommand{\eref}[1]{Equation~\ref{#1}}
\newcommand{\cref}[1]{Chapter~\ref{#1}}
\newcommand{\sref}[1]{Section~\ref{#1}}
\newcommand{\aref}[1]{Appendix~\ref{#1}}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage{booktabs}
\usepackage{rotating}
\usepackage{listings}
\usepackage{blindtext}
\usepackage[acronym]{glossaries}
\usepackage{\missingPackages/lstpatch}
\usepackage{booktabs} %nicer tables
\renewcommand{\arraystretch}{1.2} %nicer tables
\lstset{captionpos=b,
        frame=tb,
        basicstyle=\scriptsize\ttfamily,
        showstringspaces=false,
        keepspaces=true}
\lstdefinestyle{matlab} {
        language=Matlab,
        keywordstyle=\color{blue},
        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
        stringstyle=\color[rgb]{0.7,0,0} }
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks=false,linkcolor={black},citecolor={black},urlcolor={black},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
\pdfstringdefDisableCommands{
   \let\\\space
}

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\graphicspath{{03_Figures/}} % Specifies the directory where pictures are stored

% Use the APA (6th) reference package with biblatex
\usepackage[british]{babel} % Internationalisation (hyphenation rules), needed for APA citation
\usepackage{csquotes} % Context-sensitive inline and display quotations, recommended for APA citation

\usepackage[style=apa,sortcites=true,sorting=nyt,backend=biber]{biblatex}
\DeclareLanguageMapping{british}{british-apa}

\addbibresource{Bibliography.bib}
    
\title{\thesisTitle} % Defines the thesis title - don't touch this

\setstretch{1.3} % Line spacing of 1.3

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % New command to make the lines in the title page

% Define the page headers using the FancyHdr package and set up for one-sided printing
\usepackage{fancyhdr}

% Check if layout is double or single side and adapt heading correspondingly
\if@twoside
    \fancyhead{} % clear all header fields
    \fancyhead[LE,RO]{\thepage}
    \fancyhead[RE,LO]{\nouppercase{\leftmark}}
    \fancyfoot{} % clear all footer fields
\else
    \fancyhead{} % clear all header fields
    \fancyhead[RE,RO]{\thepage}
    \fancyhead[LE,LO]{\nouppercase{\leftmark}}
    \fancyfoot{} % clear all footer fields
\fi

 % The page style headers have been "empty" all this time, now use the "fancy" headers as defined before to bring them back
\pagestyle{fancy}

% Make header rule a bit thicker
\renewcommand{\headrulewidth}{0.5pt}

% Override standard chapter mark, do not change or delete this!
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

% Insert empty page if layout is two-sided
\newcommand\fillingPage{
    \if@twoside
        \cleardoublepage
    \fi
}

%----------------------------------------------------------------------------------------   

%----------------------------------------------------------------------------------------
%	DOCUMENT VARIABLES
%----------------------------------------------------------------------------------------

\newcommand*{\supervisor}[1]{\def\supName{#1}}
\newcommand*{\supervisorURL}[1]{\def\supURL{#1}}
\newcommand*{\cosupervisor}[1]{\def\supcoName{#1}}
\newcommand*{\cosupervisorURL}[1]{\def\supcoURL{#1}}
\newcommand*{\thesisTitle}[1]{\def\thesisTitle{#1}}
\newcommand*{\degree}[1]{\def\degreeName{#1}}
\newcommand*{\authors}[1]{\def\authorName{#1}}
\newcommand*{\authorsURL}[1]{\def\authorURL{#1}}
\newcommand*{\addresses}[1]{\def\addressNames{#1}}
\newcommand*{\subject}[1]{\def\subjectName{#1}}
\newcommand*{\keywords}[1]{\def\keywordNames{#1}}
\newcommand*{\university}[1]{\def\fhnw{#1}}
\newcommand*{\UNIVERSITY}[1]{\def\FHNW{#1}}
\newcommand*{\universityURL}[1]{\def\fhnwURL{#1}}
\newcommand*{\faculty}[1]{\def\hsw{#1}}
\newcommand*{\FACULTY}[1]{\def\HSW{#1}}
\newcommand*{\facultyURL}[1]{\def\hswURL{#1}}
\newcommand*{\department}[1]{\def\iwi{#1}}
\newcommand*{\DEPARTMENT}[1]{\def\IWI{#1}}
\newcommand*{\departmentURL}[1]{\def\iwiURL{#1}}

\newif\ifcosupervisor

%-------------------------------------------------  
\universityURL{http://www.fhnw.ch}
%-------------------------------------------------      
\university{\texorpdfstring{\href{http://www.fhnw.ch}
                {University of Applied Sciences and Arts Northwestern Switzerland}}
                {University of Applied Sciences and Arts Northwestern Switzerland}}
%-------------------------------------------------   
\UNIVERSITY{\texorpdfstring{\href{http://www.fhnw.ch}
                {UNIVERSITY OF APPLIED SCIENCES AND ARTS NORTHWESTERN SWITZERLAND}}
                {UNIVERSITY OF APPLIED SCIENCES AND ARTS NORTHWESTERN SWITZERLAND}}
%-------------------------------------------------   
\facultyURL{http://www.fhnw.ch/business}
%-------------------------------------------------                
\faculty{\texorpdfstring{\href{http://www.fhnw.ch/business}
                {School of Business}}
                {School of Business}}
%-------------------------------------------------                
\FACULTY{\texorpdfstring{\href{http://www.fhnw.ch/business}
                {SCHOOL OF BUSINESS}}
                {SCHOOL OF BUSINESS}}
%-------------------------------------------------   
\departmentURL{http://www.fhnw.ch/business/iwi}  
%-------------------------------------------------               
\department{\texorpdfstring{\href{http://www.fhnw.ch/business/iwi}
                {Institute for Information Systems}}
                {Institute for Information Systems}}
%-------------------------------------------------                
\DEPARTMENT{\texorpdfstring{\href{http://www.fhnw.ch/business/iwi}
                {INSTITUTE FOR INFORMATION SYSTEMS}}
                {INSTITUTE FOR INFORMATION SYSTEMS}}            
%----------------------------------------------------------------------------------------    

%----------------------------------------------------------------------------------------
%	TITLE PAGE DESIGN
%----------------------------------------------------------------------------------------
\newenvironment{titlePage}
{
    \begin{titlepage}
    \begin{center}

    % FHNW School of Business Logo
    \href{\hswURL}{\includegraphics[height=1.5cm]{00_Logo/fhnw_hw}}\\[4.5cm]
    
    {\huge \bfseries \thesisTitle}\\[6cm] % Thesis title
    
 
    \begin{minipage}[b][3.8em][t]{0.4\textwidth}
    \begin{flushleft} \large
    \emph{Author:}\\
    \href{\authorURL}{\authorName} % Author name - remove the \href bracket to remove the link
    \end{flushleft}
    \end{minipage}
    \begin{minipage}[b][3.8em][t]{0.4\textwidth}
    \begin{flushright} \large
    \emph{Supervisor:} \\
    \href{\supURL}{\supName} \\
    \ifcosupervisor
        \vspace{0.3cm}
        \emph{Co-Supervisor:} \\
        \href{\supcoURL}{\supcoName}
    \fi 
    \end{flushright}
    \end{minipage}\\[3cm]
 
    \large \textit{A thesis presented to the \hsw{} of the \fhnw{} in partial fulfilment of the requirements for the degree of \degreeName{} }\\[4cm] % University requirement text
 
    {\large \today}\\% Date
 
    \vfill
    \end{center}

    \end{titlepage}
    
    \fillingPage{}
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand\abstractPage{

    \btypeout{Abstract Page}
    
    \addtotoc{Abstract} % Add the "Abstract" page entry to the Contents
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
    
    \markboth{Abstract}{} % Add "Abstract" to fancy header
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand\ackPage{

    \btypeout{Acknowledgements Page}
    
    \addtotoc{Acknowledgements} % Add the "Abstract" page entry to the Contents
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
    
    \markboth{Acknowledgements}{} % Add "Acknowledgements" to fancy header
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS DESIGN
%----------------------------------------------------------------------------------------
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}

\renewcommand{\contentsname}{Table of Contents} % Change the title of ToC from Contents to Table of Contents

\renewcommand\tableofcontents{
    
    \btypeout{Table of Contents}
    
    \addtotoc{Table of Contents}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
    
    % Add filling page in case acknowledgements page was more than a page
    \fillingPage{}
    
    \begin{spacing}{1}{
        \setlength{\parskip}{1pt}
            \if@twocolumn
                \@restonecoltrue\onecolumn
            \else
                \@restonecolfalse
            \fi
        \chapter*{\contentsname
            \@mkboth{
                \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
        \@starttoc{toc}
        \if@restonecol\twocolumn\fi
        \cleardoublepage
    }\end{spacing}
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHY PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand\listOfBibliography{

    \label{Bibliography}

    \btypeout{Bibliography}
    
    \addtotoc{Bibliography}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics

	\printbibliography % This print all references according to used citation style
}

%----------------------------------------------------------------------------------------
%	DECLARATION OF AUTHORSHIP PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand\statementOfAuthenticity{

    \btypeout{Statement of Authenticity}
    
    \addtotoc{Statement of Authenticity}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
    
    \chapter*{Statement of Authenticity}
        
    I, \authorName, hereby confirm that this report was performed autonomously using only the sources, aids and assistance stated in the report, and that quotes are readily identifiable as such.
    
   \vspace*{2cm} 
 
    Signed:\\
    \rule[1em]{25em}{0.5pt} % This prints a line for the signature
 
    Date:\\
    \rule[1em]{25em}{0.5pt} % This prints a line to write the date
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	GLOSSARY DESIGN
%----------------------------------------------------------------------------------------
\newcommand\listOfGlossary{
    \btypeout{Glossary}
    
    \addtotoc{Glossary}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
    
    \printglossary      
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS DESIGN
%----------------------------------------------------------------------------------------
\newcommand\listOfAbbreviation{
    \btypeout{Abbreviations}
    
    \addtotoc{Abbreviations}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
    
    \printglossary[type=\acronymtype, title=Abbreviations]      
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	LIST OF FIGURES DESIGN
%----------------------------------------------------------------------------------------
\newcommand\listOfFigures{
    \btypeout{List of Figures}
    
    \addtotoc{List of Figures}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
        
    \begin{spacing}{1}{
        \setlength{\parskip}{1pt}
        \if@twocolumn
          \@restonecoltrue\onecolumn
        \else
          \@restonecolfalse
        \fi
        \chapter*{\listfigurename
          \@mkboth{\MakeUppercase\listfigurename}
                  {\MakeUppercase\listfigurename}}
        \@starttoc{lof}
        \if@restonecol\twocolumn\fi
        \cleardoublepage
    }\end{spacing}
}
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	LIST OF TABLES DESIGN
%----------------------------------------------------------------------------------------
\newcommand\listOfTables{
    \btypeout{List of Tables}
    
    \addtotoc{List of Tables}
    \addtocontents{toc}{\vspace{1em}} % Add a gap in the Contents, for aesthetics
        
    \begin{spacing}{1}{
        \setlength{\parskip}{1pt}
        \if@twocolumn
          \@restonecoltrue\onecolumn
        \else
          \@restonecolfalse
        \fi
        \chapter*{\listtablename
          \@mkboth{
              \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
        \@starttoc{lot}
        \if@restonecol\twocolumn\fi
        \cleardoublepage
    }\end{spacing}
}
%----------------------------------------------------------------------------------------
%\newcommand\listconstants{Physical Constants}
%\usepackage{longtable}
%\newcommand\listofconstants[2]{
%\btypeout{\listconstants}
%\addtotoc{\listconstants}
%    \chapter*{\listconstants
%      \@mkboth{
%          \MakeUppercase\listconstants}{\MakeUppercase\listconstants}}
%\begin{longtable}[c]{#1}#2\end{longtable}\par
%    \cleardoublepage
%}
%
%\newcommand\listnomenclature{Symbols}
%\usepackage{longtable}
%\newcommand\listofnomenclature[2]{
%\btypeout{\listnomenclature}
%\addtotoc{\listnomenclature}
%    \chapter*{\listnomenclature
%      \@mkboth{
%          \MakeUppercase\listnomenclature}{\MakeUppercase\listnomenclature}}
%\begin{longtable}[c]{#1}#2\end{longtable}\par
%    \cleardoublepage
%}
%
%\newcommand\acknowledgements[1]{
%\btypeout{Acknowledgements}
%\addtotoc{Acknowledgements}
%\thispagestyle{plain}
%\begin{center}{\huge{\textit{Acknowledgements}} \par}\end{center}
%{\normalsize #1}
%\vfil\vfil\null
%}

%\newcommand\dedicatory[1]{
%\btypeout{Dedicatory}
%\thispagestyle{plain}
%\null\vfil
%\vskip 60\p@
%\begin{center}{\Large \sl #1}\end{center}
%\vfil\null
%\cleardoublepage
%}

\renewcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse}
\endinput
