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
            Exha -- le,
            pull visce -- ra,
            Hear sounds, see colo -- rs,
            Taste scents, feel the skin. 

            \set stanza = #"2. " % Set stanza number for lyrics
            May all be hap -- py; May all be health -- y; May all be safe; May all live
            with ease.

            \set stanza = #"3. " % Set stanza number for lyrics
            Left wrench cradles the fragile egg's weight,
Touches the right pinky's golden ring,
Exploring the pacts this object might create,
Pondering shifts this egg could bring.

\set stanza = #"4. " % Set stanza number for lyrics
Left hand holds the tender egg's sway,
Brushes against the right palm's soft glow,
Seeking mutual expectations in our way,
Bound by hopes that steadily grow.

\set stanza = #"5. " % Set stanza number for lyrics
Exhale with a hiss, an S-sound's breath,
Force out the liver's sigh,
Determined face, resolve in action,
Let your will guide, spirits high.

\set stanza = #"6. " % Set stanza number for lyrics
            May you be hap -- py; May all be health -- y; May you be safe; May you live
            with ease.

\set stanza = #"7. " % Set stanza number for lyrics
The egg shifts from left to right,
Transforms in the right's gentle care,
Emerging as a bright larva's light,
Brushing the palm with grace so rare.

\set stanza = #"8. " % Set stanza number for lyrics
The larva meets the left pinky's gentle touch,
Embracing change, responsibility as such.
Inhale, smile, heart's warm embrace so much,
Bee's journey carries on from egg's tender clutch.

\set stanza = #"9. " % Set stanza number for lyrics
            May I be hap -- py; May I be health -- y; May I be safe; May I live
            with ease.



        }
        \new ChordNames {
            \set chordChanges = ##t % Enable automatic chord changes
            % Chord symbols for each measure
            {
            c2. | g2. | e | a |
            c2. | g2. | a4 e2 | a2. |
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
