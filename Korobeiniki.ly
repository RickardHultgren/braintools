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
				title = "Korobeiniki"
				composer = "Traditional"
				key = "C minor"
				time = "4/4"
		}
% Define the global score structure
global = {
		\key c \minor % Key of C minor
		\time 4/4 % Time signature 4/4
		%\tempo 4 = 160 % Set tempo to Allegro (160 BPM)
}

% Define the melody and chords with lyrics
melodyWithChordsAndLyrics = \relative c' {
		\global
		\set Score.finalFineTextVisibility = ##t
		% Define the melody with lyrics and chords
		<<
				\new Voice = "melody" {
						\voiceOne % Use voiceOne for melody
						
						{
								% First phrase: Korobeiniki (Korobushka) melody in C minor
								\repeat volta 2 {g'4 d8 ees f4 ees8 d | c4 c8 ees g4 f8 ees | d4 d8 ees f4 g |
								ees c c r | r8 f4 aes8 c4 bes8 aes | g4. ees8 g4 f8 ees8 | d4 d8 ees f4 g |
								ees4 c c r | g'2 ees | f d | ees c |
								b d | g ees | f d | ees4 g c c | b1 |} 
						}
				}
				\new Lyrics \lyricsto melody {
						\set stanza = #"1. " % Set stanza number for lyrics
						%
						%
						%
						%

						\set stanza = #"2. " % Set stanza number for lyrics
						%
						%
						%
						%

						\set stanza = #"3. " % Set stanza number for lyrics
						%
						%
						%
						%
				}
\new ChordNames {
  \set chordChanges = ##t % Enable automatic chord changes
  \chordmode {
    g1 | c:m | g1 | c:m |
    f:m | c:m | g1 | c:m |
    c:m | g1 | c:m | g1 |
    c:m | g1 | c:m | g1 |
  }
}

		>>
}

% Create the score with melody, lyrics, and chords
\score {
		\new Staff {
				\clef treble % Set the clef to treble for melody
				\melodyWithChordsAndLyrics
		}

		\layout { } % Hide LilyPond layout settings
		\midi { } % Hide LilyPond MIDI settings
}
