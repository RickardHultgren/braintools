\version "2.18.2" % Use LilyPond version 2.18.2

% Define the global score structure
global = {
    \key c \major % Key of C major
    \time 3/4 % Time signature 3/4
    \tempo 4 = 160 % Set tempo to Allegro (160 BPM)
}

% Define the melody and chords with lyrics
melodyWithChordsAndLyrics = \relative c' {
    \global

    % Define the melody with lyrics and chords
    <<
        \new Voice = "melody" {
            \voiceOne % Use voiceOne for melody
            {
                % First phrase: May you be happy; May you be healthy; May you be safe; May you live with ease.
                c d2 | d4 d d | d e2 | e4 e e |
                e4 f2 | f4 f2 | e4 d2 | e4 e e ||
            }
        }
        \new Lyrics \lyricsto melody {
            \set stanza = #"1. " % Set stanza number for lyrics
            May I be hap -- py; May I be health -- y; May I be safe; May I live
            with ease.
            
            \set stanza = #"2. " % Set stanza number for lyrics
            May you be hap -- py; May you be health -- y; May you be safe; May you live
            with ease.
            
            \set stanza = #"3. " % Set stanza number for lyrics
            May all be hap -- py; May all be health -- y; May all be safe; May all live
            with ease.
        }
        \new ChordNames {
            \set chordChanges = ##t % Enable automatic chord changes
            % Chord symbols for each measure
            {
            c2. | g2. | a:m | e |
            c2. | g2. | a4:m e2 | a2. |
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

    \header {
        title = "Compassion Romanesca"
        composer = "Rickar Verner Hultgren"
    }

    \layout { } % Hide LilyPond layout settings
    \midi { } % Hide LilyPond MIDI settings
}
