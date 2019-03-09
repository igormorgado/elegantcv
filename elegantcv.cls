\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantcv}[2019/03/06 An elegant CV]
\LoadClassWithOptions{memoir}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{xstring}
\RequirePackage[table]{xcolor}
\RequirePackage{hyperxmp}
\RequirePackage[unicode]{hyperref}

\pagestyle{plain}
\graphicspath{{icons/}}

\setlrmarginsandblock{3cm}{3cm}{*}
\setulmarginsandblock{3cm}{*}{1}
\checkandfixthelayout

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Local Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\name}[2]{
	\def\@name{#1}
	\def\@surname{#2}
	\def\@fullname{#1 #2}
}

\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\github}[1]{\def\@github{#1}}
\newcommand{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}

\newcommand{\address}[6]{
	\def\@addra{#1}
	\def\@neighborhood{#2}
	\def\@city{#3}
	\def\@state{#4}
	\def\@country{#5}
	\def\@zip{#6}
}

\hypersetup{
	linkcolor={red!40!black},
	linkbordercolor={red},
	citecolor={green!40!black},
	citebordercolor={green},
	urlcolor={blue!40!black},
	urlbordercolor={blue!40!black},
	pdfborderstyle={/S/U/W 1}
}


% HOW TO USE THIS HERE WITH VARIABLES?
%\hypersetup{
%	pdftitle={\@fullname:\ Curriculum\ Vitae\ --\ \@tagline},
%	pdfsubject={Curriculum Vitae},
%	pdfauthor={\@fullname},
%	pdfpagemode={UseNone},
%	pdfkeywords={\@keywords},
%	pdfcontactcity={\@city},
%	pdfcontactcountry={\@country},
%	pdfcontactphone={\@phone},
%	pdfcontactemail={\@email},
%	pdfcontacturl={\@website},
%	pdflang={en},
%	pdfmetalang={en}
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UTILS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\doublerule}{%
	\hrule width \hsize height 0.0pt
	\kern 1mm
	\hrule width \hsize height 0.4pt
	\kern 1mm
	\hrule width \hsize height 1pt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\bo{\mbox{\raise .35em \hbox{\underline{\scriptsize o}\ }}}
\def\ba{\mbox{\raise .35em \hbox{\underline{\scriptsize a}\ }}}


\newcommand{\vcenteredhbox}[1]{%
	\begingroup
	\setbox0=\hbox{#1}%
	\parbox{\wd0}{\box0}%
	\endgroup
}

\newcommand{\icon}[3]{%
	\colorbox{#3}{%
		\includegraphics[height=#2]{#1}%
	}%
}

%icon with text shortcut
\newcommand{\icontext}[4]{%
	\vcenteredhbox{\icon{#1}{#2}{#3}}
	\vcenteredhbox{#4}
}

\newcommand\lochref{%
	\StrSubstitute{\@neighborhood+\@city+\@state+\@country}{ }{+}[\first]
	\href{https://www.google.com/maps?q=\first}{\@neighborhood, \@city, \@state \,-- \@country}
}

\def\@phoneparams{\StrSubstitute{\@phone}{ }{}} 		% how to remove the dashes from phone number?

\newcommand{\makecontact}{%
	\begin{center}
		{\Huge{\@fullname}}
		
		\vspace{1.0mm}		
		{\Large{\textit{\@tagline}}}

		\vspace{1.0mm}		
		\makebox[0pt][c]{%
			\icontext{email}{2ex}{white}{\href{mailto:\@email?subject=Contact\%20regarding\%20your\%20CV}{\@email}}
			\enspace
			\icontext{github}{2ex}{white}{\href{https://github.com/\@github}{\@github}}
			\enspace
			\icontext{www}{2ex}{white}{\href{http://\@website}{\@website}}
		}

		\vspace{0.5mm}
		\makebox[0pt][c]{%
			\icontext{map-marker}{2ex}{white}{\lochref} % Why this line fails?
			\enspace
			\icontext{phone}{2ex}{white}{\href{tel://\@phone}{\@phone}}
		}
		\vspace{5mm}
	\end{center}
}

% Parameters are:
% {Role}
% {Institution}
% {Region}
% {Period}
% {Description}
\newcommand{\experience}[5]{%
	\datedsubsection{#1, #2}{#4}
	\vspace{-1.5ex}
	\itshape{\small #3}\par\normalfont
	\vspace{1ex}
	{#5}
}

% Parameters are:
% {Course name}
% {Institution}
% {Location}
% {Hours}
% {Year}
% {Keywords}
\newcommand{\compedu}[6]{%
	\datedsubsection{#1 (#4 hours)}{#5}
	\vspace{-1.5ex}
	\itshape{\small #2, #3}. {\small\scshape Keywords: \normalfont #6}
}


% Parameters
% {authors}
% {title}
% {year}
% {location}
% {publisher}
% {addinfo}
\newcommand{\publication}[6]{%
	\begingroup
	\noindent
	\normalfont
	{\large \scshape{#1}. \textit{#2} \hfill #3}\par
	\noindent\normalfont{\small #4: #5. #6}
	\endgroup
	\vspace{\baselineskip}
}

% Parameters
% {authors}
% {title}
% {year}
% {location}
% {eventname}
% {keywords}
\newcommand{\presentation}[6]{%
	\begingroup
	\noindent
	\normalfont
	{\large \scshape{#1}. \textit{#2} \hfill #3}\par
	\noindent\normalfont{\small #4: #5}. {\small\scshape Keywords: \normalfont #6}
	\endgroup
	\vspace{\baselineskip}
}

% Parameters
% {event name}
% {year}
% {Institution}
% {Location}
\newcommand{\conference}[4]{%
	\begingroup
	\noindent
	\normalfont
	{\large #1 \hfill #2}\par
	\noindent\normalfont{\small #3, #4}.
	\endgroup
	\vspace{\baselineskip}	
}

\newcommand{\thesis}[2]{%
	\begin{description}[%
	topsep=0pt,
	partopsep=1ex,
	itemsep=0pt,
	labelindent=1em,
	font=\normalfont\itshape,
	labelwidth=1.3cm]
		\item [Thesis:]#1
		\item [Advisor:]#2
	\end{description}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENVIRONMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{summary}
{\large\setlength{\parindent}{0cm}\OnehalfSpacing}
{\unskip\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REFORMAT SECTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ruledsec}[1]{\LARGE\scshape#1{\noindent\doublerule}}
\setsecheadstyle{\LARGE\scshape}

\setsubsecheadstyle{\large\mdseries}

%\setaftersubsecskip{1pt}
%\setaftersubsecskip{-1.25ex plus -.5ex minus -.2ex}
%\setbeforesubsecskip{-1.25ex plus -.5ex minus -.2ex}

\setsubsubsecheadstyle{\normalsize\bfseries}
%\setbeforesubsubsecskip{1pt}
%\setaftersubsubsecskip{1pt}

\newcommand{\datedsubsection}[2]{%
	\subsection[#1]{#1 \hfill {\normalfont #2}}
}


\endinput
