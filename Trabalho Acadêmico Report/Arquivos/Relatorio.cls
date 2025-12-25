\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Relatorio}[2025/12/18 v1.0 Wenes Aquino]
\RequirePackage{babel}



%=============================================
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\if@compatibility\else
  \DeclareOption{a4paper}
     {\setlength\paperheight {297mm}%
      \setlength\paperwidth  {210mm}}
  \DeclareOption{a5paper}
     {\setlength\paperheight {210mm}%
      \setlength\paperwidth  {148mm}}
  \DeclareOption{b5paper}
     {\setlength\paperheight {250mm}%
      \setlength\paperwidth  {176mm}}
  \DeclareOption{letterpaper}
     {\setlength\paperheight {11in}%
      \setlength\paperwidth  {8.5in}}
  \DeclareOption{legalpaper}
     {\setlength\paperheight {14in}%
      \setlength\paperwidth  {8.5in}}
  \DeclareOption{executivepaper}
     {\setlength\paperheight {10.5in}%
      \setlength\paperwidth  {7.25in}}
  \DeclareOption{landscape}
     {\setlength\@tempdima   {\paperheight}%
      \setlength\paperheight {\paperwidth}%
      \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
  \DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
  \DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
  \DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
  \DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
  \DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
    \renewcommand\newblock{\par}}%
}
%=============================================
% Os ajuste sempre depois desse bloco
%=============================================
\ProcessOptions
\input{size1\@ptsize.clo}
%=============================================
% AJUSTE DE MARGENS
%=============================================
% 3cm esquerda | 2cm direita | 3cm topo | 2cm inferior
%=============================================
\setlength{\oddsidemargin}{4.6mm}   % 30mm - 25.4mm
\setlength{\evensidemargin}{4.6mm}

\setlength{\topmargin}{4.6mm}       % 30mm - 25.4mm

\setlength{\headheight}{12pt}
\setlength{\headsep}{12pt}

\setlength{\textwidth}{160mm}       % 210 - 30 - 20
\setlength{\textheight}{247mm}      % 297 - 30 - 20

\RequirePackage{fontspec}
\setmainfont{CMU Serif}
%=============================================



%=============================================
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
\if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
\else
  \newcommand\maketitle{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
      \newpage
        \global\@topnum\z@   % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
  }
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{5}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \thispagestyle{empty}
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\hb@xt@4.2em{\thepart\hfil}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \Huge\scshape \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge\scshape #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{-30\p@}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \ifnum \c@secnumdepth >\m@ne
      \Huge \thechapter\hspace{0.75em}{\scshape #1}\par\nobreak
    \else
      \Huge\bfseries{\scshape #1}\par\nobreak
    \fi
    \vskip 40\p@
  }}

\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{-30\p@}%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M
    \Huge{\scshape #1}\par\nobreak
    \vskip 40\p@
  }}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\scshape}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\scshape}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\scshape}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\scshape}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\scshape}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi  {\labelitemfont \textbullet}
\newcommand\labelitemii {\labelitemfont \bfseries \textendash}
\newcommand\labelitemiii{\labelitemfont \textasteriskcentered}
\newcommand\labelitemiv {\labelitemfont \textperiodcentered}
\newcommand\labelitemfont{\normalfont}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}




\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
  \newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
  \newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{5}




%=============================================
\newcommand\tableofcontents{%
    \clearpage
    \pagestyle{empty}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \clearpage
    \pagestyle{cabecalho}
    }
%=============================================




\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries \MakeUppercase{#1}\hfil 
       \hb@xt@\@pnumwidth{\hss #2%
                          \kern-\p@\kern\p@}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
  
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
    \MakeUppercase{#1}\nobreak
    {\def\@dotsep{0.5}%
     \leaders\hbox{.\kern\@dotsep em}\hfill}%
    \nobreak\hb@xt@\@pnumwidth{\hss #2%
                               \kern-\p@\kern\p@}\par
    \penalty\@highpenalty
    \endgroup
  \fi}

\newcommand*\l@section{\@dottedtocline{1}{0em}{5em}}
\newcommand*\l@subsection{\@dottedtocline{2}{0em}{5em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{0em}{5em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{0em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{0em}{5em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%=============================================
%-------- AJUSTE E ADAPTAÇÕES DAQUI ----------
%=============================================


%---------------------------------------------
% Parágrafo
%---------------------------------------------
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm}
%=============================================
\RequirePackage{titling}
\RequirePackage{setspace}
\RequirePackage{lastpage}
\RequirePackage{booktabs}
\RequirePackage{csquotes}
\RequirePackage[hypertexnames=false]{hyperref}
\RequirePackage{ragged2e}
\RequirePackage[backend=biber,style=abnt]{biblatex}



%=============================================
% Comandos de dados
%=============================================
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}
%=============================================



%=============================================
%---CONFIGURAÇÕES DE CAPA E FOLHA DE ROSTO----
%=============================================

\ExplSyntaxOn
\seq_new:N \g_instituicao_seq
\NewDocumentCommand{\instituicao}{m}{
    \seq_set_split:Nnn \g_instituicao_seq { \\ } { #1 }
}
\NewDocumentCommand{\imprimirinstituicaocapa} {}{
    \seq_use:Nn \g_instituicao_seq { \\ }
}
\NewDocumentCommand{\imprimirinstituicaoficha} {}{
    \seq_use:Nn \g_instituicao_seq { ,\space }
}
\ExplSyntaxOff


\makeatletter
\providecommand{\imprimirpreambulo}{}
\newcommand{\preambulo}[1]{\renewcommand{\imprimirpreambulo}{#1}}
\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

\newcommand{\titulo}[1]{\title{#1}}\newcommand{\imprimirtitulo}{\thetitle}
\newcommand{\autor}[1]{\author{#1}}\newcommand{\imprimirautor}{\theauthor}
\newcommand{\data}[1]{\date{#1}}\newcommand{\imprimirdata}{\thedate}

% --- Responsáveis ---
\providecommand{\imprimirorientadorRotulo}{} \providecommand{\imprimirorientador}{}
\newcommand{\orientador}[2][Orientador:]{%
  \renewcommand{\imprimirorientadorRotulo}{#1}\renewcommand{\imprimirorientador}{#2}}

\providecommand{\imprimircoorientadorRotulo}{} \providecommand{\imprimircoorientador}{}
\newcommand{\coorientador}[2][Coorientador:]{%
  \renewcommand{\imprimircoorientadorRotulo}{#1}\renewcommand{\imprimircoorientador}{#2}}

\providecommand{\imprimirsupervisorRotulo}{} \providecommand{\imprimirsupervisor}{}
\newcommand{\supervisor}[2][Prof. Supervisor:]{%
  \renewcommand{\imprimirsupervisorRotulo}{#1}\renewcommand{\imprimirsupervisor}{#2}}

\providecommand{\imprimirtutoronlineRotulo}{} \providecommand{\imprimirtutoronline}{}
\newcommand{\tutoronline}[2][Tutor Online:]{%
  \renewcommand{\imprimirtutoronlineRotulo}{#1}\renewcommand{\imprimirtutoronline}{#2}}

\providecommand{\imprimirtutordopoloRotulo}{} \providecommand{\imprimirtutordopolo}{}
\newcommand{\tutordopolo}[2][Tutor do Polo:]{%
  \renewcommand{\imprimirtutordopoloRotulo}{#1}\renewcommand{\imprimirtutordopolo}{#2}}

\providecommand{\imprimirprofessorRotulo}{} \providecommand{\imprimirprofessor}{}
\newcommand{\professor}[2][Professor:]{%
  \renewcommand{\imprimirprofessorRotulo}{#1}\renewcommand{\imprimirprofessor}{#2}}



%=============================================
%-------------- Folha de Rosto ---------------
%=============================================
\newcommand{\folhaderosto}{%
    \begin{titlingpage}%
        \begin{center}
            \vspace*{-2cm}
            \includegraphics[width=0.17\textwidth]{Arquivos/LogoUFT.pdf} \\
            {\linespread{1.1}\selectfont\scshape\large\imprimirinstituicaocapa\par}%
            \vfill\vspace*{-2em}
            {\bfseries\large\imprimirautor\par}
            \vfill
            %\includegraphics[width=0.5\textwidth]{Arquivos/LogoUABC.pdf} \\
            {\bfseries\scshape\LARGE\imprimirtitulo\par}
            \vfill\vfill\vfill\vfill
            \large\imprimirlocal\\
            \imprimirdata
        \end{center}
    \end{titlingpage}
}


%=============================================
%--------------- Contracapa ------------------
%=============================================
\newcommand{\contracapa}{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        {\bfseries\large\imprimirautor\par}
        \vfill\vfill
        {\bfseries\scshape\Large\imprimirtitulo\par}
        \vfill
        \ifcsvoid{imprimirpreambulo}{}{%
            \hspace{0.45\textwidth}
            \begin{minipage}{0.5\textwidth}%
            \singlespacing
            \imprimirpreambulo
            \end{minipage}}%
        \vfill
        \ifcsvoid{imprimirinstituicaocapa}{}{\imprimirinstituicaocapa}%
        \vfill
        \ifcsvoid{imprimirorientador}{}{%
            {\large\imprimirorientadorRotulo~\imprimirorientador\par}%
        }
        \ifcsvoid{imprimircoorientador}{}{%
            {\large\imprimircoorientadorRotulo~\imprimircoorientador\par}%
        }
        \ifcsvoid{imprimirprofessor}{}{%
            {\large\imprimirprofessorRotulo~\imprimirprofessor\par}%
        }
        \ifcsvoid{imprimirsupervisor}{}{%
            {\large\imprimirsupervisorRotulo~\imprimirsupervisor\par}%
        }
        \ifcsvoid{imprimirtutoronline}{}{%
            {\large\imprimirtutoronlineRotulo~\imprimirtutoronline\par}%
        }
        \ifcsvoid{imprimirtutordopolo}{}{%
            {\large\imprimirtutordopoloRotulo~\imprimirtutordopolo\par}%
        }
        \vfill
        \large\imprimirlocal\\
        \imprimirdata
    \end{center}
    \clearpage
}
\makeatother
%=============================================









%=============================================
% Ficha Catalografica: Inverter nome do autor-
%=============================================
\newcommand{\tituloficha}[1]{\def\@tituloficha{#1}}
\newcommand{\imprimirtituloficha}{\@tituloficha}
%=============================================
\ExplSyntaxOn
\tl_new:N \l_autor_bruto_tl
\RenewDocumentCommand{\autor}{m}{
    \tl_set:Nn \l_autor_bruto_tl { #1 }
    \author{#1}
}
\newcommand{\imprimirautorinvertido}{%
    \seq_set_split:NnV \l_tmpa_seq { ~ } \l_autor_bruto_tl
    \seq_pop_right:NN \l_tmpa_seq \l_tmpb_tl
    \l_tmpb_tl ,~ \seq_use:Nn \l_tmpa_seq { ~ }
}
\ExplSyntaxOff
%=============================================
%------------Ficha Catalografica--------------
%=============================================
\makeatletter
\newcommand{\fichaPaginas}[1]{\def\@fichaPaginas{#1}}
\newcommand{\fichaAssuntos}[1]{\def\@fichaAssuntos{#1}}

\fichaPaginas{}
\fichaAssuntos{}

\newcommand{\fichacatalografica}{{%
    \thispagestyle{empty}
    \singlespacing
    \sffamily
    \small
    \vspace*{\fill}
    \begin{center}
    \fbox{%
        \begin{minipage}[c][7cm]{12.5cm}%
        \imprimirautorinvertido
        
        \hspace{0.5cm}\imprimirtituloficha\ /\ \imprimirautor.\ -- \imprimirlocal, \imprimirdata.
        
        \hspace{0.5cm}\pageref{LastPage} p. : il. ; 30 cm.\\
        
        \hspace{0.5cm}\imprimirorientadorRotulo~\imprimirorientador \\
        
        \hspace{0.5cm}\imprimirtipotrabalho~--~\imprimirinstituicaoficha, \imprimirdata.\\
        
        \hspace{0.35cm}\@fichaAssuntos
        \end{minipage}}
    \end{center}
    }%
}
\makeatother
%=============================================










%=============================================
%---------Inserir folha de aprovação----------
%=============================================
\newcommand{\assinatura}[1]{%
    \begin{center}
        \vspace*{0.5em}
        \rule{8cm}{0.8pt}\\
        #1
    \end{center}
}
%---------------------------------------------
\newcommand{\folhadeaprovacao}[1]{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        {\bfseries\large\imprimirautor\par}
        \vspace*{\fill}\vspace*{\fill}
        {\bfseries\Large\imprimirtitulo\par}

        \vspace*{\fill}

        \hspace{.45\textwidth}
        \begin{minipage}{.5\textwidth}
            \singlespacing
            \imprimirpreambulo
        \end{minipage}%
        \vspace*{\fill}
    \end{center}

    Trabalho aprovado. \imprimirlocal, #1:
    
    \vspace*{1.5em}
    \assinatura{\textbf{\imprimirorientador}\\Orientador}
    \assinatura{\textbf{Professor}\\ Convidado 1}
    \assinatura{\textbf{Professor}\\ Convidado 2}

    \begin{center}
    \vfill
    \large\imprimirlocal\\
    \imprimirdata
    \end{center}
}
%=============================================








%=============================================
% ---------------Dedicatoria------------------
%=============================================
\newenvironment{dedicatoria}{%
    \clearpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
        \begin{minipage}{0.65\textwidth}
            \centering
            \itshape}{%
        \end{minipage}
    \end{center}
    \vspace*{\fill}
}

%=============================================






%=============================================
% ---------------Epígrafe---------------------
%=============================================
\newenvironment{epigrafe}{%
    \clearpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{flushright}
        \itshape
        \setlength{\parskip}{0.5em}}{%
    \end{flushright}
}
%=============================================







%=============================================
\newcommand{\resumoname}{Resumo}
\newcommand{\abstractnameEN}{Abstract}
  \newenvironment{resumo}{%
    \setlength{\parindent}{0pt}%
    \chapter*{\resumoname}%
    \thispagestyle{empty}%
    \def\palavraschave##1{%
      \par\nobreak
      \vspace{1.5em}%
      \noindent\textbf{Palavras-chave:} ##1%
    }%
  }{%
    \par
  }
  \newenvironment{abstract}{%
  \setlength{\parindent}{0pt}%
    \chapter*{\abstractnameEN}%
    \thispagestyle{empty}%
    
    \def\keywords##1{%
      \par\nobreak
      \vspace{1.5em}%
      \noindent\textbf{Keywords:} ##1%
    }%
  }{%
    \par
  }
%=============================================
  
  

  
  
  
%=============================================
% Exibir nome (Figuras, Tabelas) na lista 
%=============================================
\makeatletter
\newcommand*\@l@figtab[3]{%
  \begingroup
  \renewcommand\numberline[1]{##1\space--\space}%
  \@dottedtocline{1}{1.5em}{3.0em}{#1~#2}{#3}%
  \endgroup
}

\renewcommand*\l@figure[2]{\@l@figtab{\figurename}{#1}{#2}}
\renewcommand*\l@table [2]{\@l@figtab{\tablename}{#1}{#2}}
\makeatother
%=============================================
  


  
  
%=============================================
% Ambiente de símbolos (PT-BR)
%=============================================
\newenvironment{siglas}{%
    \begin{list}{}{%
        \setlength{\labelsep}{1.7cm}%     Espaço entre sigla e texto
        \setlength{\itemindent}{2.12cm}%  Recuo interno do rótulo
        \setlength{\itemsep}{-0.4em}%     Espaço vertical entre itens
        \renewcommand{\makelabel}[1]{%
            \makebox[\labelwidth][l]{##1}%
        }%
    }%
}{%
\end{list}%
}
%=============================================
% Ambiente de siglas (PT-BR)
%=============================================
\newenvironment{simbolos}{%
    \begin{list}{}{%
        \setlength{\labelsep}{1cm}%       Espaço entre sigla e texto
        \setlength{\itemindent}{1.42cm}%  Recuo interno do rótulo
        \setlength{\itemsep}{-0.4em}%     Espaço vertical entre itens
        \renewcommand{\makelabel}[1]{%    Sigla alinhada à esquerda, dentro da caixa
            \makebox[\labelwidth][l]{##1}%
        }%
    }%
}{%
\end{list}%
}
%=============================================




 
  
  
  
%=============================================

\newcommand{\capituloNaoNumerado}[1]{%
    \chapter*{#1}%
     \addcontentsline{toc}{chapter}{\protect\numberline{}#1}%
}

%=============================================
\makeatletter
\let\@oddfoot\@empty   % páginas ímpares sem rodapé
\let\@evenfoot\@empty  % páginas pares sem rodapé
\makeatother


\RequirePackage{truncate}
%=============================================
%------Cabeçalho de paginas sem titulo--------
%=============================================
\makeatletter
\renewcommand{\chaptermark}[1]{%
  \markboth{\thechapter.\ #1}{}%
}
\def\ps@cabecalho{%
  \def\@oddhead{%
    \vbox{%
    \hbox to \textwidth{%
      \truncate{0.96\textwidth}{\footnotesize\textit{\leftmark}}%
      \hfil
      \footnotesize\thepage}%   
      \vskip 2pt
      \hrule height 0.4pt
    }%
  }%
  \let\@evenhead\@oddhead
}
\makeatother
%=============================================
% 2. Cabeçalho de pagina com titulo
%=============================================
\makeatletter
\def\ps@plain{%
  \def\@oddhead{%
    \vbox{%
      \vskip 0.5pt % ← mesmo ajuste do outro
      \hbox to \textwidth{\hfil\footnotesize\thepage}%
    }%
  }%
}
\makeatother
%=============================================



%=============================================
\pagestyle{cabecalho}

% cabeçalho
\setlength{\topmargin}{-17.7pt} % aproxima do topo
\setlength{\headheight}{0pt}    % altura real do cabeçalho
\setlength{\headsep}{30pt}      % distância cabeçalho ↔ texto

% espaçamento entre linha
\renewcommand{\baselinestretch}{1.3}
\normalsize
%=============================================





%=============================================
\newcommand{\referencias}{%
    \chapter*{Referências}%
    \addtocontents{toc}{\protect\vskip1em}%
    \addcontentsline{toc}{chapter}{\protect\numberline{}Referências}%
    \addtocontents{toc}{\protect\vskip1em}%
    \printbibliography[heading=none]%
}
\AtBeginBibliography{\justifying}
\urlstyle{same}
%=============================================




%=============================================
\newcommand{\paginaDivisoria}[1]{%
  \clearpage
  \thispagestyle{empty}
  \phantomsection % Cria âncora para o link 
  \vspace*{8cm}
  \begin{center}
     \Huge #1
  \end{center}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\large{#1}}
  \clearpage
}
%=============================================


%=============================================
\makeatletter
\def\ABNT@appendix@chapterhead#1{%
  \vspace*{-30\p@}%
  {\parindent\z@
   \centering
   \normalfont\Huge\scshape
   \MakeUppercase{\@chapapp~\thechapter\space--}\space #1\par\nobreak
   \vskip 40\p@
  }%
}
\makeatother
%=============================================


%=============================================
%Cria condições:
%\ifestilocapitulo      % TESTE (if)
%\estilocapitulotrue    % LIGA
%\estilocapitulofalse   % DESLIGA
\newif\ifestilocapitulo
\estilocapitulofalse % padrão: estilo DESLIGADO
%=============================================



%=============================================
\makeatletter
\AtBeginDocument{%
  \ifestilocapitulo
    % estilo ativo → não faz nada
  \else
    % estilo desligado → fallback
    \let\orig@appendix\appendix
    \renewcommand{\appendix}{%
      \orig@appendix
      \let\@makechapterhead\ABNT@appendix@chapterhead
    }
  \fi
}
\makeatother
%=============================================
\newcommand{\apendices}{%
  \renewcommand{\appendixname}{Apêndice}%
  \appendix
}
%=============================================
\makeatletter
\newcommand{\anexos}{%
  \renewcommand{\appendixname}{Anexo}%
  \appendix
  \renewcommand{\theHchapter}{anexo.\thechapter}%
}
\makeatother
%=============================================


%=============================================
\makeatletter
\newif\if@shownumber
\@shownumbertrue

\let\orig@thepage\thepage
\renewcommand{\thepage}{%
  \if@shownumber
    \orig@thepage
  \fi
}
\makeatother
%=============================================



%=============================================
\makeatletter
\newcommand{\pretextual}{%
    \clearpage
    \@shownumberfalse
}
\makeatother


\makeatletter
\newcommand{\textual}{%
  \clearpage
  \@shownumbertrue
}
\makeatother
%=============================================


\RequirePackage{xspace}
\newcommand{\WenesTex}{%
    Wenes%
    \raisebox{0ex}{T}\kern-0.168em%
    \raisebox{-0.5ex}{E}\kern-0.124em%
    \raisebox{0ex}{X}%
    \xspace
}
\endinput
%=============================================
