%%
%%Copyright 2018 Rickard Verner Hultgren
%%Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
%%1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
%%2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
%%THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


\version "2.18.2"
 
%%\include "svenska.ly"
%%\include "english.ly"

swing = \mark \markup { 
  \line \general-align #Y #DOWN { 
  \score { \new Staff \with {
    fontSize = #-2
    \override StaffSymbol #'line-count = #0 
    \override VerticalAxisGroup #'Y-extent = #'(0 . 0)
  }
  \relative { 
    \stemUp 
    \override Score.SpacingSpanner 
      #'common-shortest-duration = #(ly:make-moment 3 16)
    \override Beam #'positions = #'(2.5 . 2.5)
  }}
  
  }
}

date = #(strftime "%d-%m-%Y" (localtime (current-time)))

italic = {
  \override Lyrics.LyricText.font-shape = #'italic
  
}

bold = {

  \override Lyrics.LyricText.font-series = #'bold
}

normal = {
  \revert Lyrics.LyricText.font-shape
  \revert Lyrics.LyricText.font-series
}


\header {
  title = \markup {  \fontsize #4"Motivational Romanesca"}
  subtitle = \markup {  "romanesca motivational" \date }
  poet = "lyrics: Rickard Verner Hultgren"
  composer = "music: Rickard Verner Hultgren"
  copyright = "Creative Commons Attribution-ShareAlike 4.0"
}

keyTime = { \key c \major \time 3/4 }
ManualOneVoiceOneMusic = \relative c' {

      
  		%r2 r4 r8 d'8
  		r2 r8 f'8
  		e8 e e4 e4  
  		d2 r8 d8
                c8 c8 c4 c
                b2 r8 b8
                %b2 r8 b8
		c8 c8 c4 c
		%b2.
		b2 r8 b8
		a8 a a gis gis gis
                a b gis a4 r8 ||

        	
		
}


ManualTwoTwoMusic = \relative c {
 <b d f g>1 <c d f a >1  <c e g>1 <b d f g>1 <c e g>1 <c e g>1 <c e g>1 <c e g>1 <c d f a>1 <c d f a>1 <c e g>1 <c e g>1 \bar ":|"
}



\layout {
  \context {
    \Score
    proportionalNotationDuration = #(ly:make-moment 1 4)
    
  }
}

\score {
  <<  % PianoStaff and Pedal Staff must be simultaneous
    \new PianoStaff <<
      \chords { c2. c2. g2. a2.:m e2. c2. g2. a4.:m e4. a2.:m}
      \new Staff = "ManualOne" <<
\textLengthOn
s1*6^\markup {  }
\keyTime  % set key and time signature
        \clef "treble"
        \new Voice {
          \swing
          \voiceOne
         
          \ManualOneVoiceOneMusic
          \bar "||"
        }
        \addlyrics {
          \set stanza = #"2nd person's perspective: "
        Fee -- lings a -- bout what? Why? \set stanza = #"Reality: " Threats, flouts. Far ways. con -- firm. \set stanza = #"Execution plan: " Com -- pare, slice, no 'what ifs'. \set stanza = #"1st person showing of intention: " Pro -- mi -- ses cause fee -- lings to which you resp -- ond.
        Threats, break rules, op -- tions close -- ness and con -- firm, com -- pare. Frame, rank, slice, no 'what ifs'. Pro -- mi -- ses cause fee -- lings to which you resp -- ond.
        Judge opp -- ort -- un -- it -- ies, threats and con -- firm, com -- pare. Frame, rank, slice, no 'what ifs'. Pro -- mi -- ses cause fee -- lings to which you resp -- ond.
        Judge threats, con -- firm, com -- pare. How to man -- age dead -- lines? Chunk down, rule out 'what ifs'. Pro -- mi -- ses cause fee -- lings to which you resp -- ond.
        Si -- tu -- a -- tion of now. Con -- fir -- ma -- tion of views. How to make an imp -- act? Pro -- mi -- ses cause fee -- lings to which you resp -- ond.
        What I praise and blame, de -- ter -- mines the fair roles. See dares, mu -- tua -- lize, and re -- ass -- ay what to do first.
        [Name]'s role is to ---. The fair goal is to ---. Cre -- ate a win win game. Re -- ass -- ay what to do first.
        } 
      >>  % end ManualOne Staff context
      %%\new Staff = "ManualTwo" \with {

      
      %%} <<
      %%  \keyTime
      %%  \clef "bass"
      %%  \new Voice {
      %%    \ManualTwoTwoMusic
      %%   \bar "||"
      %%  }
       
      %%>>   % end ManualTwo Staff context
      
    >>
>>    
\layout {}
\midi {\tempo 4 = 90}
}
    
    




#(define-markup-list-command (paragraph layout props args) (markup-list?)
  (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\markuplist {
    \vspace #2
    \paragraph { \smallCaps{Comments}}
    \vspace #.75
    \paragraph {Imagine an interaction with another person or a future you. The difference between noradrenaline is time.}
    \paragraph {1 Promisis cause feelings - are there any feelings? Others decide what I promise.}
    \paragraph {2 Why are there such feelings? Ask.}
    \paragraph {3 Scan for real broken rules and threats}
    \paragraph {4 Confirm potential threats $\equiv$ Acknowledge}
    \paragraph {5 Compare with your view and with what is benign. Compere $\equiv$ normalize}
    \paragraph {6 REFLECT: Execute by options $=$ framing, closeness/distance=rank, slice into manageble chunks with common goal and eliminating what ifs.}
  }
  
