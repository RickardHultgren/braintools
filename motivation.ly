\version "2.18.2"
 
%%\include "svenska.ly"
%%\include "english.ly"


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
  subtitle = \markup {  "motivational blues" }
  poet = "lyrics: Rickard Verner Hultgren"
  composer = "music: Rickard Verner Hultgren"

}

keyTime = { \key c \major \time 4/4 }
ManualOneVoiceOneMusic = \relative c' {
  
  		c'8 bes g bes r2 
		bes8  a  f  a  f2 
		r1 
		r2 r8 c'8 c8 bes8 | \break
		a4 a a a
		a8 bes8 b8 c8 r2 |
		r1 
		r2 r8 c8 c8 bes8 | \break
		a4 a a a
		a8 bes8 b8 c8 r2
		r1
		r1 | \break
  		c8 bes g bes r2 
		bes8  a  f  a  f2 
		r1
		r1 \bar "|."
		
}

ManualTwoTwoMusic = \relative c {
 <b d f g>1 <c d f a >1  <c e g>1 <b d f g>1 <c e g>1 <c e g>1 <c e g>1 <c e g>1 <c d f a>1 <c d f a>1 <c e g>1 <c e g>1 <b d f g>1 <c d f a >1  <c e g>1 <c e g>1 \bar ":|"
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
      
      \chords { g1:7 f1:7 c1 g1:7 c1 c1 c1 c1:7 f1: f1:7 c1 c1:7 g1:7 f1:7 c1 c1 }
      \new Staff = "ManualOne" <<
\textLengthOn
s1*6^\markup {humming mood}
\keyTime  % set key and time signature
        \clef "treble"
        \new Voice {
          
          \voiceOne
          
          \ManualOneVoiceOneMusic
          

        }
        \addlyrics {
        I a -- nd you \bold build \normal o -- ur va -- lue. Let's view the \italic The end result object \normal respe -- ct the view. Just view the \italic Chunked down result object \normal respe -- ct the view. I a -- nd you \bold build \normal o -- ur va -- lue.
        }
      >>  % end ManualOne Staff context
      \new Staff = "ManualTwo" \with {
        \override VerticalAxisGroup
          #'staff-staff-spacing #'stretchability = 5
      } <<
        \keyTime
        \clef "bass"
        \new Voice {
          \ManualTwoTwoMusic
        }
      >>  % end ManualTwo Staff context
    >> 
  >>
}



