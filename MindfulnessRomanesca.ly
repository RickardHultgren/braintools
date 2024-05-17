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
	title = \markup {  \fontsize #4"Compassion Romanesca"}
	subtitle = \markup {  "" \date }
	%poet = "lyrics: Rickard Verner Hultgren"
	composer = "Rickard Verner Hultgren"
	copyright = "Creative Commons Attribution-ShareAlike 4.0"

}

keyTime = { \key c \major \time 3/4 }
tempo 4 = 160
ManualOneVoiceOneMusic = \relative c' {


								c d d | d4 d d | d e4 e4 | e4 e e |
								e4 f f | f4 f f | e4 d d | e4 e e ||



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
			\chords { c2.  g2.  a:m  e c2.  g2.  a4:m e2  a2.}
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
						 \set stanza = #"1. " % Set stanza number for lyrics
						Ex -- ha -- le
						and pau -- se,
						draw in vi -- sce -- - -- ra,  
						Hear sou -- nds, see glo -- w,
						Taste sce -- nts, feel the skin.
				}
				\addlyrics {
						\set stanza = #"2. " % Set stanza number for lyrics
						May a -- ll be hap -- py; May a -- ll be health -- y; May a -- ll be safe; May a -- ll live
						with ea -- se.
				}
				\addlyrics {
						\set stanza = #"3. " % Set stanza number for lyrics
						Left wre -- nch holds the egg,
Brush -- es the right pink -- y,
Expl -- or -- ing the ring's pacts. The egg makes,
the ring change.
				}
				\addlyrics {
\set stanza = #"4. " % Set stanza number for lyrics
Left wre -- nch holds the egg,
Brush -- es the right palm's glow,
ex -- pect things that oth -- ers mut -- u -- all -- y ex -- pext.
				}
				\addlyrics {
\set stanza = #"5. " % Set stanza number for lyrics
Ex -- ha -- le with hiss -- ing, the li -- ver you push out. Act with force! You will guides! The ang -- ger fu -- - -- els.
				}
				\addlyrics {
\set stanza = #"6. " % Set stanza number for lyrics
						May y -- ou be hap -- py; May y -- ou be health -- y; May y -- ou be safe; May y -- ou live
						with ea -- se.
				}
				\addlyrics {
\set stanza = #"7. " % Set stanza number for lyrics
The e -- gg shifts left to right,
and trans -- forms in -- to a lar -- va that you brush ag -- ainst the left pa -- lm.
				}
				\addlyrics {
\set stanza = #"8. " % Set stanza number for lyrics
The right wrench holds_the lar -- va brushes the left pink -- y. Say dut -- ies, in -- hale into the heart! Lar -- va is a bee.
				}
				\addlyrics {
\set stanza = #"9. " % Set stanza number for lyrics
						May I -  be hap -- py; May I - be health -- y; May I - be safe; May I - live
						with ea -- se.
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