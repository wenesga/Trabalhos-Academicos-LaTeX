% ==========================================================
% Classe: TrabalhoAcademico.cls
% Autor: Wenes Aquino - Copyright © 2025
% ==========================================================
% Núcleo da Classe
% ----------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Arquivos/TrabalhoAcademico}[2025/12/13 v-2.0 TrabalhoAcademico ABNT-UFT]
\LoadClass[12pt,a4paper,oneside]{memoir}
% ==========================================================
% Idioma e Tipografia
% ----------------------------------------------------------
\RequirePackage[brazilian]{babel}
\RequirePackage{fontspec}
\setmainfont{CMU Serif}
% ==========================================================
% Matemática e Símbolos
% ----------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% ----------------------------------------------------------
% Utilidades de Texto
% ----------------------------------------------------------
\RequirePackage{textcase}
\RequirePackage{etoolbox}
\RequirePackage{ragged2e}
% ----------------------------------------------------------
% Gráficos e Diagramas
% ----------------------------------------------------------
\RequirePackage{tikz}
\usetikzlibrary{calc}
% ----------------------------------------------------------
% Hiperligações
% ----------------------------------------------------------
\RequirePackage{hyperref}
% ----------------------------------------------------------
% Referências Bibliográficas
% ----------------------------------------------------------
\RequirePackage{csquotes}
\RequirePackage[style=abnt,backend=biber]{biblatex}
\addbibresource{Arquivos/Referencias.bib}
\AtBeginBibliography{\justifying}
\urlstyle{same}
% ----------------------------------------------------------
% Remove a numeração de páginas de \part
% ----------------------------------------------------------
\aliaspagestyle{part}{empty}
% ----------------------------------------------------------
% Texto de Teste
% ----------------------------------------------------------
\RequirePackage{lipsum} % Gerador de texto
% ==========================================================



% ==========================================================
% Margens e Bloco de Texto
% ----------------------------------------------------------
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
% ----------------------------------------------------------
% Espaçamento Entre Linhas
% ----------------------------------------------------------
\OnehalfSpacing
%\setSpacing{1.35} % 1.3 = 1.5 Real
% ----------------------------------------------------------
% Parágrafo
% ----------------------------------------------------------
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm}
% ==========================================================




% ==========================================================
% ------Marca Tex: WenesTEX - abnTEX-UFT------
% ----------------------------------------------------------
\newcommand{\WenesTex}{%
    Wenes%
    \raisebox{0ex}{T}\kern-0.168em%
    \raisebox{-0.5ex}{E}\kern-0.124em%
    \raisebox{0ex}{X}
}
\newcommand{\abnTexUFT}{%
    abn%
    \raisebox{0ex}{T}\kern-0.168em%
    \raisebox{-0.5ex}{E}\kern-0.124em%
    \raisebox{0ex}{X}%
    \raisebox{0.4ex}{-}%
    \raisebox{0.05ex}{U}\kern-0em
    \raisebox{0.05ex}{F}\kern-0em
    \raisebox{0.05ex}{T}
}
% ==========================================================




% ==========================================================
% Comandos de dados - tipo de trabalho
% ==========================================================
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}
% ==========================================================







% ==========================================================
% 7. CONFIGURAÇÕES DE CAPA E FOLHA DE ROSTO 
% ==========================================================
\makeatletter
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



% ==========================================================
% --- Folha de Rosto ---
% ==========================================================
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


% ==========================================================
% --- Contracapa ---
% ==========================================================
\newcommand{\folhaderostocontent}{%
    \begin{center}
        {\bfseries\large\imprimirautor\par}
        \vfill\vfill
        {\bfseries\scshape\Large\imprimirtitulo\par}
        \vfill
        \ifcsvoid{imprimirpreambulo}{}{%
            \hspace{0.45\textwidth}
            \begin{minipage}{0.5\textwidth}%
            \SingleSpacing
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
}

\newcommand{\contracapa}{%
  \cleardoublepage
  \folhaderostocontent
  \clearpage
}
\makeatother
% ==========================================================










% ==========================================================
% -------Ficha Catalografica: Inverter nome do autor--------
% ==========================================================
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
% ==========================================================
% -------------------Ficha Catalografica--------------------
% ==========================================================
\makeatletter
\newcommand{\fichaPaginas}[1]{\def\@fichaPaginas{#1}}
\newcommand{\fichaAssuntos}[1]{\def\@fichaAssuntos{#1}}

\fichaPaginas{}
\fichaAssuntos{}

\newcommand{\fichaCatalografica}{{%
    \SingleSpacing
    \sffamily
    \small
    \vspace*{\fill}
    \begin{center}
    \fbox{%
        \begin{minipage}[c][7cm]{12.5cm}%
        \imprimirautorinvertido
        
        \hspace{0.5cm}\imprimirtitulo~/~\imprimirautorinvertido.~--~\imprimirlocal, \imprimirdata.
        
        \hspace{0.5cm}\thelastpage p. : il. ; 30 cm.\\
        
        \hspace{0.5cm}\imprimirorientadorRotulo~\imprimirorientador \\
        
        \hspace{0.5cm}\imprimirtipotrabalho~--~\imprimirinstituicaoficha, \imprimirdata.\\
        
        \hspace{0.35cm}\@fichaAssuntos
        \end{minipage}}
    \end{center}
    }%
}
\makeatother
% ==========================================================





% -----------------------------------------------
% --------------------ERRATA---------------------
% -----------------------------------------------
\newcommand{\errataname}{Errata}

\newenvironment{errata}{
    \preTexto{\errataname}
}{
    \cleardoublepage
}
% -----------------------------------------------






% -----------------------------------------------
% --------Inserir folha de aprovação-------------
% -----------------------------------------------
\newcommand{\assinatura}[1]{%
    \begin{center}
        \vspace*{0.5em}
        \rule{8cm}{0.8pt}\\
        #1
    \end{center}
}
% -----------------------------------------------
\newcommand{\folhadeaprovacao}{%
    \cleardoublepage
    \begin{center}
        {\bfseries\large\imprimirautor\par}
        \vspace*{\fill}\vspace*{\fill}
        {\bfseries\Large\imprimirtitulo\par}

        \vspace*{\fill}

        \hspace{.45\textwidth}
        \begin{minipage}{.5\textwidth}
            \SingleSpacing
            \imprimirpreambulo
        \end{minipage}%
        \vspace*{\fill}
    \end{center}

    Trabalho aprovado. \imprimirlocal, 15 de Desembro de 2025:
    
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
% -----------------------------------------------







% ===============================================
% ---------------Dedicatoria---------------------
% ===============================================
\newenvironment{dedicatoria}{%
    \cleardoublepage
    \vspace*{\fill}
    \begin{center}
        \begin{minipage}{0.65\textwidth}
            \centering
            \itshape}{%
        \end{minipage}
    \end{center}
    \vspace*{\fill}
}

% -----------------------------------------------







% ==========================================================
\def\defaultchapterstyle{CapitulosNumerado}

\makeatletter
\newcommand{\capituloCentralizado}{%
  \@ifstar{\capituloCentralizado@star}{\capituloCentralizado@nostar}}
  
% VERSÃO NORMAL – entra no sumário e segue o comportamento atual
\newcommand{\capituloCentralizado@nostar}[1]{%
  \chapterstyle{estiloNaoNumerado}%
  \chapter*{\LARGE\scshape #1}%
  \markboth{#1}{}%
  \addcontentsline{toc}{chapter}{\protect\numberline{}#1}
  \chapterstyle{CapitulosNumerado}%
}

% VERSÃO COM * – sem número de página e FORA do sumário
\newcommand{\capituloCentralizado@star}[1]{%
  \chapterstyle{estiloNaoNumerado}%
  \chapter*{\LARGE\scshape #1}%
  \thispagestyle{empty}%              % sem número de página
  \markboth{#1}{}%
  \chapterstyle{CapitulosNumerado}%
}
\makeatother

% ==========================================================







% ===============================================
% -------------------Epígrafe--------------------
% -----------------------------------------------
\newenvironment{epigrafe}{%
    \cleardoublepage
    \vspace*{\fill}
    \begin{flushright}
        \itshape
        \setlength{\parskip}{0.5em}}{%
    \end{flushright}
}
% ==============================================








% ==========================================================
\newcommand{\ResumoNomePT}{Resumo}
\newcommand{\ResumoNomeEN}{Abstract}

\newenvironment{ResumoBase}[1]{%
    \preTexto{#1}%
    \vspace*{-2\onelineskip}%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{2em}%
}{%
    \clearpage
}
% ----------------------------------------------------------
\newenvironment{resumo}{%
  \begin{ResumoBase}{\ResumoNomePT}%
}{%
  \end{ResumoBase}%
}
% ----------------------------------------------------------
\newenvironment{resumoEN}{%
  \begin{ResumoBase}{\ResumoNomeEN}%
}{%
  \end{ResumoBase}%
}
% ==========================================================






% ==========================================================
% LISTA DE FIGURAS 
% ==========================================================
\newcommand{\listaDeFiguras}{%
  \clearpage
  \chapterstyle{estiloNaoNumerado}%
  \listoffigures*% usa o estilo acima e NÃO entra no sumário
  \thispagestyle{empty}% tira o número da página desta folha
  \chapterstyle{CapitulosNumerado}%
}
% ==========================================================
% LISTA DE TABELAS 
% ==========================================================
\newcommand{\listaDeTabelas}{%
  \clearpage
  \chapterstyle{estiloNaoNumerado}%
  \listoftables*%
  \thispagestyle{empty}%
  \chapterstyle{CapitulosNumerado}%
}
% ==========================================================
% Exibir nome (Figuras, Tabelas) na lista 
% ==========================================================
\renewcommand{\cftfigurename}{Figura\space}
\renewcommand{\cfttablename}{Tabela\space}
% ==========================================================
% Exibir "-" na lista
% ==========================================================
\renewcommand{\cftfigureaftersnum}{\space\space--}
\renewcommand{\cfttableaftersnum}{\space\space--}
% ==========================================================
% Texto do título começa após esses 3em
% ==========================================================
\cftsetindents{figure}{0em}{3em}
\cftsetindents{table}{0em}{3em}
% ==========================================================










% ==========================================================
\newcommand{\preTexto}[1]{%
  \clearpage
  \chapterstyle{estiloNaoNumerado}%
  \chapter*{\scshape #1}%
  \thispagestyle{empty}%
  \chapterstyle{CapitulosNumerado}%
}

% Lista de abreviaturas e siglas
\newcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
\newenvironment{siglas}{%
    \preTexto{\listadesiglasname}
    \begin{symbols}%
        \begin{Spacing}{0.9}
}{%
        \end{Spacing}
    \end{symbols}
    \cleardoublepage
}

% Lista de simbolos
\newcommand{\listadesimbolosname}{Lista de símbolos}
\newenvironment{simbolos}{%
    \preTexto{\listadesimbolosname}
    \begin{symbols}%
        \begin{Spacing}{0.7}
}{%
        \end{Spacing}
    \end{symbols}
    \cleardoublepage
}
% ==========================================================


















% ===============================================================================
% ==========================================================
% Sumário mostra ate subseção
% ==========================================================
\settocdepth{subsection}
\setsecnumdepth{subsection}
% ativar pontilhado nos capítulos no sumário
\renewcommand{\cftchapterdotsep}{\cftdotsep}
% ==========================================================

% ----------------------------------------------------------
% É controle espaço horizontal título Sumário
% ----------------------------------------------------------
\cftsetindents{part}{0pt}{2cm}
\cftsetindents{chapter}{0pt}{2cm}
\cftsetindents{section}{0pt}{2cm}
\cftsetindents{subsection}{0pt}{2cm}
% ----------------------------------------------------------

% ==========================================================
% Defini capítulos para maiúsculas no Sumario
% ==========================================================
\makeatletter
% Salva o comando original que desenha a linha do Sumário
\let\oldcontentsline\contentsline

% Redefine para interceptar e modificar o texto
\renewcommand\contentsline[4]{%
  \ifboolexpr{
    test {\ifstrequal{#1}{chapter}} or 
    test {\ifstrequal{#1}{part}} or 
    test {\ifstrequal{#1}{appendix}} % <--- O SEGREDO: Pega também se for classificado como apêndice
  }
    {\oldcontentsline{#1}{\MakeTextUppercase{#2}}{#3}{#4}} % Se for um dos 3, Caixa Alta
    {\oldcontentsline{#1}{#2}{#3}{#4}} % Se for seção ou outro, mantém normal
}
\makeatother
% ==========================================================

% ==========================================================
% ------------------------sumário---------------------------
% ==========================================================
\makechapterstyle{SumarioStyle}{
  \setlength{\beforechapskip}{-73pt}  % ajuste fino da altura
  \setlength{\afterchapskip}{1\onelineskip}

  \renewcommand{\printchaptername}{}
  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchapternum}{}

  \renewcommand{\printchaptertitle}[1]{%
    \vspace*{2\onelineskip}
    \begin{center}
      \Huge\bfseries\scshape  ##1\par
    \end{center}%
  }
}
% ==========================================================


\newcommand{\Sumario}{
   \clearpage
   \aliaspagestyle{chapter}{empty}
   \chapterstyle{SumarioStyle}  % só para o sumário
   \tableofcontents*
   \cleardoublepage
   \aliaspagestyle{chapter}{plain}
   \chapterstyle{CapitulosNumerado}  % volta ao normal
}

% ==========================================================
% Recuo no Sumário
% ----------------------------------------------------------
\cftsetindents{chapter}{0pt}{2cm}
\cftsetindents{section}{0pt}{2cm}
\cftsetindents{subsection}{0pt}{2cm}
% ==========================================================
% ===============================================================================







% ----------------------------------------------------------
% Títulos de \part ficam em versalete
% ----------------------------------------------------------
\renewcommand{\parttitlefont}{\scshape}
% ----------------------------------------------------------







% ==========================================================
% ------------ESTILOS DE CAPÍTULO (MODULARES)---------------
% ==========================================================
\makechapterstyle{CapitulosNumerado}{%
    \setlength{\beforechapskip}{0.46cm} % Descer estilo de capítulo
    \renewcommand{\printchaptername}{}
    \renewcommand{\chapternamenum}{}
    \renewcommand{\afterchapternum}{}
    \setlength{\midchapskip}{1.3cm} 
    \renewcommand{\afterchapternum}{\par\nobreak\vskip \midchapskip}
    \renewcommand{\printchapternum}{%
        \noindent
        \begin{tikzpicture}[remember picture, overlay]
            \def\numsize{61} % Tamanho do número          
            \def\barwidth{0.8pt} % Espessura da linha      
            \def\leftoffset{2.3cm} % Reta horizontal esquerda
            
            \node[inner sep=0pt, anchor=south west, opacity=0] (num) at (\leftoffset, 0)
             {\fontsize{\numsize}{\numsize}\selectfont\rmfamily\thechapter};
             
            \node[inner sep=0pt, anchor=south west] at (\leftoffset, -1pt)
             {\fontsize{\numsize}{\numsize}\selectfont\rmfamily\thechapter};
            
            \node[inner sep=0pt, anchor=south west, font=\large\rmfamily] (chaptext)
                 at (0pt, -4pt) {\chaptername};
            
            % --- ALTURA FIXA PARA O RETÂNGULO ---
            \def\boxheight{41pt}   % ajuste aqui até ficar perfeito
            
            % --- PONTO ESQUERDO DO L ---
            \coordinate (Lbase) at (0.5*\barwidth,15pt);         % base fixa
            \coordinate (Ltop)  at (0.5*\barwidth,\boxheight);   % topo fixo
            
            % --- DESENHA O L FIXO ---
            % --- AJUSTE: distância horizontal entre o L e o número ---
            \def\Lgap{0.2cm} % ajuste aqui até ficar visualmente perfeito
            
            % --- DESENHO DO L FIXO ---
            \draw[line width=\barwidth]
                (Lbase) -- (Ltop)
                -- ++(\leftoffset - 0.5*\barwidth - \Lgap,0);

            % --- PONTOS DO RETÂNGULO FIXO ---
            \coordinate (NumRightBase) at ($(num.south east)+(0.2cm,0)$);
            \coordinate (NumRightTop)  at ($(NumRightBase)+(0,\boxheight)$);
            
            \coordinate (RightTop)     at (\linewidth,\boxheight);
            \coordinate (RightBase)    at (\linewidth,0);
            
            % --- CAIXA FIXA ---
            \draw[line width=\barwidth]
                (NumRightTop) -- (RightTop)
                              -- (RightBase)
                              -- (NumRightBase);
        \end{tikzpicture}%
    }
    \renewcommand{\printchaptertitle}[1]{%
        \raggedright\LARGE\bfseries\scshape  ##1
    }
}




% ==========================================================
\makechapterstyle{estiloNaoNumerado}{%
  \setlength{\beforechapskip}{-73pt}%
  \setlength{\afterchapskip}{2\onelineskip}%
  \renewcommand{\printchaptername}{}%
  \renewcommand{\chapternamenum}{}%
  \renewcommand{\printchapternum}{}%
  \renewcommand{\printchaptertitle}[1]{%
    \vspace*{2\onelineskip}%
    \begin{center}
      \LARGE\bfseries\scshape ##1\par
      \vspace{-1.5\onelineskip}%
      \rule{\textwidth}{0.4pt}%
    \end{center}%
  }%
}
% ==========================================================




















% ==========================================================
% ---------------CABEÇALHOS E NUMERAÇÃO---------------------
% ==========================================================
\makepagestyle{meuestilo}
\makeevenhead{meuestilo}{\footnotesize\textit{\leftmark}}{}{\footnotesize\thepage}
\makeoddhead {meuestilo}{\footnotesize\textit{\leftmark}}{}{\footnotesize\thepage}
\makeheadrule{meuestilo}{\textwidth}{0.3pt}

\makepagestyle{plain}
\makeoddhead{plain}{}{}{\footnotesize\thepage}
\makeevenhead{plain}{}{}{\footnotesize\thepage}
\makeheadrule{plain}{\textwidth}{0pt}

\makeatletter
\renewcommand{\chaptermark}[1]{%
  \markboth{\thechapter.\ #1}{}%
}
\makeatother



% ==========================================================
% -------------FRONT / MAIN / BACK MATTER-------------------
% ==========================================================
\makeatletter
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \pagestyle{empty}%
  \chapterstyle{estiloNaoNumerado}%
}
\renewcommand{\mainmatter}{%
  \cleardoublepage
  \pagestyle{meuestilo}%
  \chapterstyle{\defaultchapterstyle}%
}
\renewcommand{\backmatter}{%
  \cleardoublepage
  \pagestyle{meuestilo}%
  \chapterstyle{\defaultchapterstyle}%
}
\makeatother




\newcommand{\paginaDivisoria}[1]{%
  \clearpage
  \thispagestyle{empty}
  \phantomsection % Cria âncora para o link 
  \vspace*{8cm}
  \begin{center}
     \textbf{\Huge #1}
  \end{center}
  \addcontentsline{toc}{part}{\protect\numberline{}\large\textbf{#1}}
  \clearpage
}





\newcommand{\inicioApendices}{%
  \appendix
  \setcounter{chapter}{0}%
  \renewcommand{\chaptername}{Apêndice}%
  \renewcommand{\appendixname}{APÊNDICE}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \makeatletter
  \renewcommand{\chaptermark}[1]{%
    \markboth{APÊNDICE~\thechapter.\ ##1}{}%
  }%
  \makeatother
}

\newcommand{\inicioAnexos}{%
  \cleardoublepage
  \setcounter{chapter}{0}%
  \renewcommand{\chaptername}{Anexo}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \makeatletter
  \renewcommand{\chaptermark}[1]{%
    \markboth{ANEXO~\thechapter.\ ##1}{}%
  }%
  \makeatother
}









\endinput % =====================FIM DA CLASSE===================================
