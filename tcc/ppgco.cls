%% facom.tex v1.0, lásaro.
% adaptado de  eesc.cls, v1.0 athila
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% facom: Modelo de Trabalho Acadêmico (tese de doutorado, dissertação de
% mestrado e trabalhos monográficos em geral) em conformidade com 
% ABNT NBR 14724:2011. Esta classe estende as funcionalidades da classe
% abnTeX2 elaborada de forma a adequar os parâmetros exigidos pelas 
% normas UFU e do FACOM.
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

%========================================================================
% Identificação
%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgco}[2014/11/05 v1.0 Classe Tese PPGCO - FEMEC-UFU]

%========================================================================
% Declaração de opções
%========================================================================
% Opções:
% 	tesedr:     Formata documento para tese de doutorado
%	qualidr:    Formata documento para qualificação de doutorado
% 	dissertmst: Formata documento para dissertação de mestrado
% 	qualimst:   Formata documento para qualificação de mestrado
% -----------------------------------------------------------------------
\DeclareOption{tesedr}{
\def\@tipotrabalho{Trabalho de conclusão de curso}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{trabalh}
}

\DeclareOption{qualidr}{
\def\@tipotrabalho{Qualifica\c{c}\~ao de doutorado}
\def\@worktype{Ph.D. Qualification Exam}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{dissertmst}{
\def\@tipotrabalho{Disserta\c c\~ao de mestrado}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{disserta\c{c}\~ao}
}

\DeclareOption{qualimst}{
\def\@tipotrabalho{Qualifica\c{c}\~ao de mestrado}
\def\@worktype{Master Qualification Exam}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{disserta\c{c}\~ao}
}

\ProcessOptions\relax

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\LoadClass[a4paper,12pt,twoside,openright]{abntex2}

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	% Citações padrão ABNT
\RequirePackage{color}	% Controle das cores
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}


\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

\newsubfloat{figure}






% ---
% Configurações de aparência do PDF final

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
		%bookmarks=true,         		% show bookmarks bar?
		pdftitle={\@title}, 
		pdfauthor={\@author},
    	pdfsubject={\imprimirpreambulo},
		pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	    pdfproducer={LaTeX with abnTeX2}, 	% producer of the document
	    pdfcreator={\@author},
    	colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=black,
		bookmarksdepth=4
}
% ---
\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

% Comandos de dados - título do documento em português e inglês
\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

% Comandos de dados - autor e autorbib
\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
\renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}}

% --------------------------------
% Definição Geral

\newcommand{\arquivofichacatalografica}{}
\newcommand{\inserirfichacatalografica}[1]{\renewcommand{\arquivofichacatalografica}{#1}}

\newcommand{\arquivofolhaaprovacao}{}
\newcommand{\inserirfolhaaprovacao}[1]{\renewcommand{\arquivofolhaaprovacao}{#1}}

\renewcommand{\maketitle}{%
	% Capa
	\imprimircapa

	% Ficha catalográfica
	\ifthenelse{\not\equal{\arquivofichacatalografica}{}}
	{
		\imprimirfolhaderosto*{} 
		\begin{fichacatalografica}
			\includepdf[pages={1}]{\arquivofichacatalografica}
		\end{fichacatalografica}
	}
	{
		\imprimirfolhaderosto{}
	}
	
	% Folha de aprovação
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
	{
		\begin{folhadeaprovacao}
		 	\includepdf[pages={1}]{\arquivofolhaaprovacao}
		\end{folhadeaprovacao}
	}
	{
	}
}

%========================================================================
% Definição da capa, folha de rosto e folha de aprovação.
%========================================================================
% --- Definições de comprimento
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}

\instituicao
{%
\parbox[c][4em][c]{\textwidth}{
	\center
    \includegraphics[width=2in]{figs/logo-ufu2}
	\par
	Universidade Federal de Uberlândia
    \par
	Faculdade de Engenharia Mecânica
    \par
	Programa de Graduação em Engenharia Aeronáutica
}
}

\preambulo{
	Trabalho de conclusão de curso apresentado ao Programa de Graduação 
	da Faculdade de Engenharia Mecânica da Universidade Federal de Uberlândia como parte dos requisitos para a obtenção do título de bacharel em engenharia aeronáutica.
}

% ---
% Impressão da Capa
\renewcommand{\imprimircapa}{%
	\thispagestyle{empty}
	\noindent
  	\begin{capa}%
    	\center
    	\parbox[b]{\textwidth}
	{
		\centering
		\vbox to \titlepagewinvoffset
		{
            \rule{1.2\titlepagewinwidth}{0.4pt}
			\@formatatitulocapa
            \rule{1.2\titlepagewinwidth}{0.4pt}
			\vfill
			\@formataautorcapa
            \vfill
            \scshape\imprimirinstituicao
		}
	}
	
	\vfill
  	\centerline{\imprimirlocal}
	\centerline{\@date}
    
  	\end{capa}
}

\def\@formataautorcapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
				{\large\textbf{\imprimirautor}}
      		\vspace*{\fill}
    		}
   	}

}

\def\@formatatitulocapa{%

	\parbox[b]{1.2\titlepagewinwidth}
	{%
    	\centering
		\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
      			{\Large{\textbf{\imprimirtitulo}}\par}
			\vspace*{\fill}
   		}
   	}

}
% ---

% ---
% Conteudo padrao da Folha de Rosto

% Comandos de dados - Área de concentração
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}{Área de concentração: #1}}

\makeatletter

\renewcommand{\folhaderostocontent}{


\newlength{\tampar}
\setlength{\tampar}{0.5\textwidth}
\newlength{\tamconcetracao}
\settowidth{\tamconcetracao}{\imprimirareaconcentracao}
\newlength{\tamorientador}
\settowidth{\tamorientador}{\imprimirorientadorRotulo~\imprimirorientador}
\newlength{\tamcoorientador}
\settowidth{\tamcoorientador}{\imprimircoorientadorRotulo~\imprimircoorientador}

\ifthenelse{\lengthtest{\tamconcetracao > \tampar}}{\setlength{\tampar}{\the\tamconcetracao}}{}
\ifthenelse{\lengthtest{\tamorientador>\tampar}}{\setlength{\tampar}{\the\tamorientador}}{}
\ifthenelse{\lengthtest{\tamcoorientador>\tampar}}{\setlength{\tampar}{\the\tamcoorientador}}{}


  \begin{center}

	
    \@formataautorcapa

    \@formatatitulocapa

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
  		\hspace*{\fill}
  		\makebox[\tampar][l]
  		{%
    			\parbox[b]{\tampar}
    			{
    				\imprimirpreambulo\\
    				\par\imprimirareaconcentracao\\

    {\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    			}
    		}
    		\vfill
    }%

  	\centerline{\imprimirlocal}
	\centerline{\@date}
	% Folha de aprovação
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
	{
%		\scriptsize\textbf{Trata-se da versão corrigida da \@niveltrabalho. A versão %original se encontra disponível na FACOM/UFU que aloja o Programa de Pós-Graduação em %Ciência da Computação.}
	}
	{
	}
  \end{center}
}
% ---


% ---
% Dedicatória
% ---
\newcommand{\imprimirdedicatoria}[1]{
	\begin{dedicatoria}
   		\vspace*{\fill}
   		\centering
   		\noindent
   		\textit{#1}
   		\vspace*{\fill}
	\end{dedicatoria}
}
% ---

% ---
% Agradecimentos
% ---
\newcommand{\imprimiragradecimentos}[1]{
	\begin{agradecimentos}
		#1
	\end{agradecimentos}
}
% ---

% ---
% Epígrafe
% ---
\newcommand{\imprimirepigrafe}[1]{
\begin{epigrafe}
    \vspace*{\fill}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
\end{epigrafe}
}
% ---


%========================================================================
% Listas e Sumário
%========================================================================

% ---
% Lista de ilustrações
% ---
\newcommand{\listailustracoes}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}
% ---

% ---
% Lista de tabelas
% ---
\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}
% ---

% ---
% Lista de abreviaturas
% ---
\newcommand{\listasiglas}[1]{
	\thispagestyle{empty}
	\pagestyle{empty}
	\pdfbookmark[0]{Lista de siglas}{Lista de siglas} 
	\chapter*{Lista de siglas}
	\input{#1}
	\cleardoublepage
}

\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de algoritmos}
\newcommand{\cftalgorithmname}{\algorithmname\space} 
\newcommand{\listaalgoritmos}{
	\pdfbookmark[0]{\listalgorithmname}{loa}
	\thispagestyle{empty}
	\pagestyle{empty}
	\listofalgorithms
	\cleardoublepage
}

\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de símbolos}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}
% ---

% ---
% Sumário
% ---
\newcommand{\sumario}{%
	\chapter*{\contentsname}
	\pdfbookmark[0]{\contentsname}{toc}
	\thispagestyle{empty}
	\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage}
% ---

%========================================================================
% Resumo e Abstract
%========================================================================

% ---
% Resumo
% ---
\renewenvironment{resumo}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Resumo}\par%
	\pdfbookmark[0]{Resumo}{Resumo} 
	
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}

% ---

% ---
% Abstract
% ---
\renewenvironment{abstract}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Abstract}\par%
	\pdfbookmark[0]{Abstract}{Abstract} 
%	\@authorbib~ \textbf{\@engtitle}. \pageref{LastPage}~p.~\@worktype~ -- ~Faculty of %Computing, Federal University of Uberlândia, \thedate.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}
% ---

%=======================================================================
% Ajuste do cabeçalho e rodapé
%=======================================================================

\makepagestyle{eescchaplast}
\makeevenhead{eescchaplast}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{eescchaplast}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{eescchaplast}{\textwidth}{\normalrulethickness}


\makepagestyle{eescpartlast}
\makeoddhead{eescpartlast}{}{}{\ABNTEXfontereduzida\thepage}
\makeevenhead{eescpartlast}{\ABNTEXfontereduzida\thepage}{}{}


\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 


\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  \aliaspagestyle{cleared}{eescchaplast}
  \aliaspagestyle{part}{eescchaplast}
  \nouppercaseheads
}% Configura layout para elementos pós-textuais

\renewcommand{\postextual}{
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{eescchaplast}
  \aliaspagestyle{part}{eescpartlast}
\aliaspagestyle{afterpart}{eescpartlast}

}
\renewcommand{\backmatter}{\postextual}

% ---

%=========================================================================
% Nomes Constantes
%=========================================================================
%\renewcommand{\chaptername}{Capítulo}
%\renewcommand{\partname}{Parte}

%=========================================================================
% Configurações
%=========================================================================
% --- 
\chapterstyle{madsen}

% --- 
\renewcommand*{\figureautorefname}{Figura}
\renewcommand*\footnoteautorefname{Nota de Rodapé}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{Tabela}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Apêndice}%
\renewcommand*\chapterautorefname{Capítulo}%
\renewcommand*\sectionautorefname{Seção}%
\renewcommand*\subsectionautorefname{Subseção}%
\renewcommand*\subsubsectionautorefname{Subseção}%
\renewcommand*\paragraphautorefname{Parágrafo}%
\renewcommand*\subparagraphautorefname{Subparágrafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{Página}%
% --- 


% ---
% Fonte padrão section, subsection e subsubsection
\renewcommand{\ABNTEXchapterfont}{\huge\bfseries}

% Tipo de trabalho para classe abntex2 (ficha catalográfica)
% ---
\tipotrabalho{\@tipotrabalho}

% --- 
% Espaçamentos entre linhas e parágrafos 
% --- 

%%% O tamanho do parágrafo é dado por:
%\setlength{\parindent}{0.5cm}

% Controle do espaçamento entre um parágrafo e outro:
%\setlength{\parskip}{0.2cm}  % tente também \onelineskip