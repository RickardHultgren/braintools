%%
%%Copyright 2017 Rickard Verner Hultgren
%%Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
%%1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
%%2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
%%THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


\version "2.18.2"
 
%%\include "svenska.ly"
%%\include "english.ly"

swing = \mark \markup { 
  \line \general-align #Y #DOWN { \score { 
  \new Staff \with {
    fontSize = #-2
    \override StaffSymbol #'line-count = #0 
    \override VerticalAxisGroup #'Y-extent = #'(0 . 0)
  }
  \relative { 
    \stemUp 
    \override Score.SpacingSpanner 
      #'common-shortest-duration = #(ly:make-moment 3 16) 
    \override Beam #'positions = #'(2.5 . 2.5)
    b'8[ b8] 
  }
  \layout {
    ragged-right= ##t
    indent = 0
    \context { 
    \Staff \remove "Clef_engraver" 
    \remove "Time_signature_engraver" }
  }} " ="
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
    \times 2/3 { b'8[ r b8] } 
  }
  \layout {
    ragged-right= ##t
    indent = 0
    \context { 
      \Staff 
      \remove "Clef_engraver" 
      \remove "Time_signature_engraver" }
    }}
  \fontsize #-2
  \italic { "  swing" }
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
  title = \markup {  \fontsize #4"motivational blues"}
  subtitle = \markup {  "motivational blues" \date }
  poet = "lyrics: Rickard Verner Hultgren"
  composer = "music: Rickard Verner Hultgren"
  copyright = "Creative Commons Attribution-ShareAlike 3.0"
}

keyTime = { \key c \major \time 4/4 }
ManualOneVoiceOneMusic = \relative c' {

      
      
  		c'8 b g b(b4) r4
		bes8  a  f  a(a4)  f4 
		e2 r2 
		r2 r8 c'8 c8 bes8
		g4 g g g
		g8 bes8 b8 c8(c4) r4
		r1 
		r2 r8 c8 c8 bes8
		g4 g g g
		g8 bes8 b8 c8(c4) r4
		r1
		r1   ^\markup { { "D.S. al Coda" \musicglyph #"scripts.coda" } }


        	
		
}


ManualOneVoiceOneMusicCoda = \relative c' {

  %% \mark \markup { "CODA" \musicglyph #"scripts.coda" }
  	 c'8 b g b(b4) r4
		bes8  a  f  a(a4)  f4 
		e2 r2 
		r1 		
}


ManualTwoTwoMusic = \relative c {
 <b d f g>1 <c d f a >1  <c e g>1 <b d f g>1 <c e g>1 <c e g>1 <c e g>1 <c e g>1 <c d f a>1 <c d f a>1 <c e g>1 <c e g>1 \bar ":|"
}

ManualTwoTwoMusicCoda = \relative c {
<b d f g>1 <c d f a >1  <c e g>1 <c e g>1 \bar ":|"
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
      \chords { g1:7 f1:7 c1 g1:7 c1 c1 c1 c1:7 f1: f1:7 c1 c1:7 }
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
        I a -- nd you \bold build \normal o -- ur va -- lue now. Let's view the [the end result object] respe -- ct the view. Just view the [chunked down result object] respe -- ct the view.
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
\midi {\tempo 4 = 140}
}
\score {
<<    
    
        \new PianoStaff <<
      
\chords { g1:7 f1:7 c1 c1 }      
      \new Staff = "ManualOneCoda" <<

\textLengthOn
\mark \markup { "CODA" \musicglyph #"scripts.coda" }
\keyTime  % set key and time signature
        \clef "treble"
        \new Voice {
          
          \voiceOne
          
          \ManualOneVoiceOneMusicCoda
          \bar "|."

        }
        \addlyrics {
        I a -- nd you \bold build \normal o -- ur va -- lue now.
        }
      >>  % end ManualOne Staff context
      
      %%\new Staff = "ManualTwoCoda" \with {
      
      %%} <<
        %%\keyTime
        %%\clef "bass"
        %%\new Voice {
          
        %%  \ManualTwoTwoMusicCoda
        %% \bar "|."
        %%}
       
      %%>>   % end ManualTwo Staff context
      
    >>
    
    
  >>


}



