% ============================================
% Classe: AbnTexUFT.cls
% Autor: Wenes Aquino
% Baseada no seu preâmbulo
% ============================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AbnTexUFT}[2025/12/02 Classe personalizada UFT]

\LoadClass[12pt,a4paper,oneside,oldfontcommands]{memoir}

% ============================================
% 1. PACOTES FUNDAMENTAIS
% ============================================
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{lmodern}
%\setmainfont{XCharter}
%\setmainfont{Times New Roman}
\RequirePackage[brazilian]{babel}
\RequirePackage{lipsum}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage[HTML]{xcolor}
\definecolor{verde}{HTML}{008181}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\usetikzlibrary{calc,positioning,arrows.meta,shapes,decorations.pathreplacing,shadows.blur}
\RequirePackage{titlesec}
\RequirePackage{csquotes}

% ============================================
% 2. LINKS E METADADOS
% ============================================
\RequirePackage[
    colorlinks=true,
    linkcolor=black!100,
    citecolor=black!100,
    urlcolor=black!100
]{hyperref}

\hypersetup{
    pdftitle={Trabalhos Acadêmicos},
    pdfauthor={Wenes Aquino},
    pdfcreator={LaTeX},
    pdfcreationdate={\today}
}

% ============================================
% 3. BIBLIOGRAFIA
% ============================================
\RequirePackage[
    backend=biber,
    style=abnt,
    language=brazil
]{biblatex}
\addbibresource{Arquivos/Referencias.bib}
\AtBeginBibliography{\justifying}
\urlstyle{same}
\AtBeginBibliography{\setlength{\itemsep}{1\baselineskip}}

\defbibheading{referencias_abnt}{%
  \addtocontents{toc}{\protect\addvspace{30pt}} 
  \chapter*{\hfill Referências \hfill}
  \markboth{Referências}{Referências}
  \addcontentsline{toc}{chapter}{\protect\numberline{}Referências}
}

% ============================================
% 4. LAYOUT E MARGENS
% ============================================
\setlrmarginsandblock{3cm}{2cm}{*} 
\setulmarginsandblock{3cm}{2cm}{*} 
\checkandfixthelayout
\OnehalfSpacing % Espacamento entre linhas de 1,5
\setlength{\parindent}{1.25cm} % Recuo do paragrafo 

% ============================================
% 5. SUMÁRIO E LISTAS
% ============================================
\settocdepth{subsection}
\setsecnumdepth{subsection}

\renewcommand{\printtoctitle}[1]{{\bfseries\scshape\centering\huge{#1}\par}}
\renewcommand{\cftpartdotsep}{\cftnodots} 
\renewcommand{\cftchapterdotsep}{\cftdotsep}

\renewcommand{\printloftitle}[1]{{\bfseries\scshape\centering\huge{#1}\par}}
\renewcommand{\printlottitle}[1]{{\bfseries\scshape\centering\huge{#1}\par}}

\setlength{\cftbeforepartskip}{2.25em} 
\setlength{\cftbeforechapterskip}{1em} 
\setlength{\cftbeforesectionskip}{0em} 
\cftsetindents{part}{0pt}{2cm}
\cftsetindents{chapter}{0pt}{2cm}
\cftsetindents{section}{0pt}{2cm}
\cftsetindents{subsection}{0pt}{2cm}
\cftsetindents{figure}{0pt}{2cm}
\cftsetindents{table}{0pt}{2cm}

\AtBeginDocument{\captiondelim{\space--\space}}
\renewcommand{\cftfigurename}{Figura\space}
\renewcommand{\cfttablename}{Tabela\space}
\renewcommand{\cftfigureaftersnum}{\space\space--}
\renewcommand{\cfttableaftersnum}{\space\space--}
\cftsetindents{figure}{0em}{3em}
\cftsetindents{table}{0em}{3em}

% ============================================
% 6. ESTILO DO CAPÍTULO
% ============================================
\makechapterstyle{CapituloEstiloso}{%
  \chapterstyle{default}
  \setlength{\beforechapskip}{-1.1cm} 
  \setlength{\afterchapskip}{1cm} 
  \setlength{\midchapskip}{-15pt} 
  \renewcommand*{\printchaptername}{} 
  \renewcommand*{\chapnumfont}{\normalfont\bfseries\fontsize{35}{35}\selectfont\color{white}}
  \renewcommand*{\printchapternum}{%
     \noindent
     \begin{tikzpicture}
        \node[fill=black!40, text=white, font=\chapnumfont,
              minimum width=2cm, minimum height=1.4cm, anchor=east, inner sep=0pt]
              (numbox) at (\linewidth,0) {\raisebox{-6pt}{\thechapter}};
        \node[anchor=south east, color=black!100, font=\itshape\fontsize{14}{14}\selectfont, inner xsep=8pt, yshift=1pt] 
             at (numbox.west) {\chaptername};
        \draw[line width=0.4pt, color=black!100] (numbox.west) -- (0,0);
        \draw[line width=0.4pt, color=black!100] (0,0) -- (0, -0.8cm);
     \end{tikzpicture}%
  }
  \renewcommand*{\printchaptertitle}[1]{%
    \par
    \raggedright
    \Huge\bfseries\scshape\linespread{1.2}\selectfont
    \textcolor{black!100}{##1}%
  }
  \renewcommand*{\afterchaptertitle}{%
    \par\nobreak\vspace{-25pt}
    {\color{black!100}\rule{\linewidth}{1pt}}
    \par\nobreak\vskip \afterchapskip
  }
}
\chapterstyle{CapituloEstiloso}

\renewcommand{\parttitlefont}{\Huge\bfseries\scshape\centering}

\newcommand{\tituloPreTextual}[1]{%
  \chapter*{\centering\scshape #1}
  \thispagestyle{empty}
}

% ============================================
% 7. ESTILO DE CABEÇALHO
% ============================================
\makepagestyle{meuestilo}
\makeevenhead{meuestilo}{\footnotesize\textit{\thechapter.}\quad\textit{\leftmark}}{}{\footnotesize\thepage}
\makeoddhead {meuestilo}{\footnotesize\textit{\thechapter.}\quad\textit{\leftmark}}{}{\footnotesize\thepage}
\makeheadrule{meuestilo}{\textwidth}{0.3pt}
\pagestyle{meuestilo}
\aliaspagestyle{part}{empty}

\makepsmarks{plain}{\createmark{chapter}{left}{nonumber}{}{}}
\makeoddhead{plain}{}{}{\footnotesize\thepage}
\makeevenhead{plain}{}{}{\footnotesize\thepage}
\makeheadrule{plain}{\textwidth}{0pt}

\makeatletter
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\makeatother

% ============================================
% 8. COMANDOS PERSONALIZADOS
% ============================================
\newcommand{\capituloNaoNumerado}[1]{%
  \chapter*{\centering\scshape #1}
  \markboth{#1}{#1}
  \addcontentsline{toc}{chapter}{\protect\numberline{}#1}
}

\newcommand{\paginaDivisoria}[1]{%
  \clearpage
  \thispagestyle{empty}
  \phantomsection
  \vspace*{8cm}
  \begin{center}
     \textbf{\Huge #1}
  \end{center}
  \addcontentsline{toc}{part}{\protect\numberline{}\large\textbf{#1}}
  \clearpage
}

% ============================================
% 9. APÊNDICES E ANEXOS
% ============================================
\let\oldappendix\appendix
\renewcommand{\appendix}{%
  \addtocontents{toc}{\protect\addvspace{0.2cm}}
  \oldappendix
  \renewcommand{\chaptername}{Apêndice} 
  \makeevenhead{meuestilo}{\footnotesize\textit{APÊNDICE \thechapter.}\quad\textit{\leftmark}}{}{\footnotesize\thepage}
  \makeoddhead {meuestilo}{\footnotesize\textit{APÊNDICE \thechapter.}\quad\textit{\leftmark}}{}{\footnotesize\thepage}
}

\newcommand{\iniciarAnexos}{%
  \clearpage
  \addtocontents{toc}{\protect\addvspace{0.2cm}}
  \par
  \setcounter{chapter}{0}
  \renewcommand{\thechapter}{\Alph{chapter}} 
  \renewcommand{\theHchapter}{anexo.\thechapter} 
  \renewcommand{\chaptername}{Anexo}
  \renewcommand{\appendixname}{Anexo}
  \makeevenhead{meuestilo}{\footnotesize\textit{ANEXO \thechapter.}\quad\textit{\leftmark}}{}{\footnotesize\thepage}
  \makeoddhead {meuestilo}{\footnotesize\textit{ANEXO \thechapter.}\quad\textit{\leftmark}}{}{\footnotesize\thepage}
}

% ============================================
% 7. CONFIGURAÇÕES DE CAPA E FOLHA DE ROSTO 
% ============================================
\makeatletter

% --- Variáveis ---
\providecommand{\imprimirinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\imprimirinstituicao}{#1}}
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

% --- Layout da Capa ---
\newcommand{\imprimircapa}{%
    \begin{titlingpage}
        \centering
            \vspace*{-2cm}
            \includegraphics[width=0.17\textwidth]{Arquivos/LogoUFT.pdf} \\[0.15cm]
            {\scshape\large\imprimirinstituicao\par}
            \vspace{3cm}%
            {\bfseries\LARGE\imprimirtitulo\par}
            \vfill
            {\bfseries\large\imprimirautor\par}
            \vfill
            \begin{center}
                \SingleSpacing
                \large
                \imprimirlocal\\
                \imprimirdata
            \end{center}
    \end{titlingpage}
}

% --- Layout da Folha de Rosto (CORRIGIDO: Instituição e Centralização) ---
\newcommand{\folhaderostocontent}{
  \begin{center}
    {\bfseries\large\imprimirautor\par}
    \vspace*{\fill}\vspace*{\fill}
    {\bfseries\Large\imprimirtitulo\par}
    
    \vspace*{\fill}
    
    % Preâmbulo (Recuado à direita)
    \ifcsvoid{imprimirpreambulo}{}{%
        \hspace{0.45\textwidth}
        \begin{minipage}{0.5\textwidth}
        \SingleSpacing
        \small\imprimirpreambulo
        \end{minipage}%
    }
    
    \vspace*{\fill}
    \ifcsvoid{imprimirinstituicao}{}{\imprimirinstituicao}
    \vspace*{\fill}

    \ifcsvoid{imprimirorientador}{}{{\large\imprimirorientadorRotulo~\imprimirorientador\par}}
    \ifcsvoid{imprimircoorientador}{}{{\large\imprimircoorientadorRotulo~\imprimircoorientador\par}}
    \ifcsvoid{imprimirprofessor}{}{{\large\imprimirprofessorRotulo~\imprimirprofessor\par}}
    \ifcsvoid{imprimirsupervisor}{}{{\large\imprimirsupervisorRotulo~\imprimirsupervisor\par}}
    \ifcsvoid{imprimirtutoronline}{}{{\large\imprimirtutoronlineRotulo~\imprimirtutoronline\par}}
    \ifcsvoid{imprimirtutordopolo}{}{{\large\imprimirtutordopoloRotulo~\imprimirtutordopolo\par}}
    
    \begin{center}
        \SingleSpacing
        \large
        \imprimirlocal\\
        \imprimirdata
    \end{center}
  \end{center}
}

\newcommand{\imprimirfolhaderosto}{%
  \clearpage
  \thispagestyle{empty}
  \folhaderostocontent
  \clearpage
}
\makeatother

% ============================================
% 11. CAPÍTULOS EM MAIÚSCULAS NO SUMÁRIO
% ============================================
\RequirePackage{textcase}
\RequirePackage{etoolbox}
\makeatletter
\let\oldcontentsline\contentsline
\renewcommand\contentsline[4]{%
  \ifboolexpr{
    test {\ifstrequal{#1}{chapter}} or 
    test {\ifstrequal{#1}{part}} or 
    test {\ifstrequal{#1}{appendix}}
  }
    {\oldcontentsline{#1}{\MakeTextUppercase{#2}}{#3}{#4}}
    {\oldcontentsline{#1}{#2}{#3}{#4}}
}
\makeatother
