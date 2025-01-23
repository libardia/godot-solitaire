extends Node


const ACE_SPADE: StringName = &'AS'
const TWO_SPADE: StringName = &'2S'
const THREE_SPADE: StringName = &'3S'
const FOUR_SPADE: StringName = &'4S'
const FIVE_SPADE: StringName = &'5S'
const SIX_SPADE: StringName = &'6S'
const SEVEN_SPADE: StringName = &'7S'
const EIGHT_SPADE: StringName = &'8S'
const NINE_SPADE: StringName = &'9S'
const TEN_SPADE: StringName = &'10S'
const JACK_SPADE: StringName = &'JS'
const QUEEN_SPADE: StringName = &'QS'
const KING_SPADE: StringName = &'KS'

const ACE_CLUB: StringName = &'AC'
const TWO_CLUB: StringName = &'2C'
const THREE_CLUB: StringName = &'3C'
const FOUR_CLUB: StringName = &'4C'
const FIVE_CLUB: StringName = &'5C'
const SIX_CLUB: StringName = &'6C'
const SEVEN_CLUB: StringName = &'7C'
const EIGHT_CLUB: StringName = &'8C'
const NINE_CLUB: StringName = &'9C'
const TEN_CLUB: StringName = &'10C'
const JACK_CLUB: StringName = &'JC'
const QUEEN_CLUB: StringName = &'QC'
const KING_CLUB: StringName = &'KC'

const ACE_DIAMOND: StringName = &'AD'
const TWO_DIAMOND: StringName = &'2D'
const THREE_DIAMOND: StringName = &'3D'
const FOUR_DIAMOND: StringName = &'4D'
const FIVE_DIAMOND: StringName = &'5D'
const SIX_DIAMOND: StringName = &'6D'
const SEVEN_DIAMOND: StringName = &'7D'
const EIGHT_DIAMOND: StringName = &'8D'
const NINE_DIAMOND: StringName = &'9D'
const TEN_DIAMOND: StringName = &'10D'
const JACK_DIAMOND: StringName = &'JD'
const QUEEN_DIAMOND: StringName = &'QD'
const KING_DIAMOND: StringName = &'KD'

const ACE_HEART: StringName = &'AH'
const TWO_HEART: StringName = &'2H'
const THREE_HEART: StringName = &'3H'
const FOUR_HEART: StringName = &'4H'
const FIVE_HEART: StringName = &'5H'
const SIX_HEART: StringName = &'6H'
const SEVEN_HEART: StringName = &'7H'
const EIGHT_HEART: StringName = &'8H'
const NINE_HEART: StringName = &'9H'
const TEN_HEART: StringName = &'10H'
const JACK_HEART: StringName = &'JH'
const QUEEN_HEART: StringName = &'QH'
const KING_HEART: StringName = &'KH'

const ALL_VALUES = [
    ACE_SPADE,
    TWO_SPADE,
    THREE_SPADE,
    FOUR_SPADE,
    FIVE_SPADE,
    SIX_SPADE,
    SEVEN_SPADE,
    EIGHT_SPADE,
    NINE_SPADE,
    TEN_SPADE,
    JACK_SPADE,
    QUEEN_SPADE,
    KING_SPADE,

    ACE_CLUB,
    TWO_CLUB,
    THREE_CLUB,
    FOUR_CLUB,
    FIVE_CLUB,
    SIX_CLUB,
    SEVEN_CLUB,
    EIGHT_CLUB,
    NINE_CLUB,
    TEN_CLUB,
    JACK_CLUB,
    QUEEN_CLUB,
    KING_CLUB,

    ACE_DIAMOND,
    TWO_DIAMOND,
    THREE_DIAMOND,
    FOUR_DIAMOND,
    FIVE_DIAMOND,
    SIX_DIAMOND,
    SEVEN_DIAMOND,
    EIGHT_DIAMOND,
    NINE_DIAMOND,
    TEN_DIAMOND,
    JACK_DIAMOND,
    QUEEN_DIAMOND,
    KING_DIAMOND,

    ACE_HEART,
    TWO_HEART,
    THREE_HEART,
    FOUR_HEART,
    FIVE_HEART,
    SIX_HEART,
    SEVEN_HEART,
    EIGHT_HEART,
    NINE_HEART,
    TEN_HEART,
    JACK_HEART,
    QUEEN_HEART,
    KING_HEART
]

const VALUE_TO_RS: Dictionary = {
    ACE_SPADE: [Ranks.ACE, Suits.SPADE],
    TWO_SPADE: [Ranks.TWO, Suits.SPADE],
    THREE_SPADE: [Ranks.THREE, Suits.SPADE],
    FOUR_SPADE: [Ranks.FOUR, Suits.SPADE],
    FIVE_SPADE: [Ranks.FIVE, Suits.SPADE],
    SIX_SPADE: [Ranks.SIX, Suits.SPADE],
    SEVEN_SPADE: [Ranks.SEVEN, Suits.SPADE],
    EIGHT_SPADE: [Ranks.EIGHT, Suits.SPADE],
    NINE_SPADE: [Ranks.NINE, Suits.SPADE],
    TEN_SPADE: [Ranks.TEN, Suits.SPADE],
    JACK_SPADE: [Ranks.JACK, Suits.SPADE],
    QUEEN_SPADE: [Ranks.QUEEN, Suits.SPADE],
    KING_SPADE: [Ranks.KING, Suits.SPADE],

    ACE_CLUB: [Ranks.ACE, Suits.CLUB],
    TWO_CLUB: [Ranks.TWO, Suits.CLUB],
    THREE_CLUB: [Ranks.THREE, Suits.CLUB],
    FOUR_CLUB: [Ranks.FOUR, Suits.CLUB],
    FIVE_CLUB: [Ranks.FIVE, Suits.CLUB],
    SIX_CLUB: [Ranks.SIX, Suits.CLUB],
    SEVEN_CLUB: [Ranks.SEVEN, Suits.CLUB],
    EIGHT_CLUB: [Ranks.EIGHT, Suits.CLUB],
    NINE_CLUB: [Ranks.NINE, Suits.CLUB],
    TEN_CLUB: [Ranks.TEN, Suits.CLUB],
    JACK_CLUB: [Ranks.JACK, Suits.CLUB],
    QUEEN_CLUB: [Ranks.QUEEN, Suits.CLUB],
    KING_CLUB: [Ranks.KING, Suits.CLUB],

    ACE_DIAMOND: [Ranks.ACE, Suits.DIAMOND],
    TWO_DIAMOND: [Ranks.TWO, Suits.DIAMOND],
    THREE_DIAMOND: [Ranks.THREE, Suits.DIAMOND],
    FOUR_DIAMOND: [Ranks.FOUR, Suits.DIAMOND],
    FIVE_DIAMOND: [Ranks.FIVE, Suits.DIAMOND],
    SIX_DIAMOND: [Ranks.SIX, Suits.DIAMOND],
    SEVEN_DIAMOND: [Ranks.SEVEN, Suits.DIAMOND],
    EIGHT_DIAMOND: [Ranks.EIGHT, Suits.DIAMOND],
    NINE_DIAMOND: [Ranks.NINE, Suits.DIAMOND],
    TEN_DIAMOND: [Ranks.TEN, Suits.DIAMOND],
    JACK_DIAMOND: [Ranks.JACK, Suits.DIAMOND],
    QUEEN_DIAMOND: [Ranks.QUEEN, Suits.DIAMOND],
    KING_DIAMOND: [Ranks.KING, Suits.DIAMOND],

    ACE_HEART: [Ranks.ACE, Suits.HEART],
    TWO_HEART: [Ranks.TWO, Suits.HEART],
    THREE_HEART: [Ranks.THREE, Suits.HEART],
    FOUR_HEART: [Ranks.FOUR, Suits.HEART],
    FIVE_HEART: [Ranks.FIVE, Suits.HEART],
    SIX_HEART: [Ranks.SIX, Suits.HEART],
    SEVEN_HEART: [Ranks.SEVEN, Suits.HEART],
    EIGHT_HEART: [Ranks.EIGHT, Suits.HEART],
    NINE_HEART: [Ranks.NINE, Suits.HEART],
    TEN_HEART: [Ranks.TEN, Suits.HEART],
    JACK_HEART: [Ranks.JACK, Suits.HEART],
    QUEEN_HEART: [Ranks.QUEEN, Suits.HEART],
    KING_HEART: [Ranks.KING, Suits.HEART]
}


func rs_to_value(rank: StringName, suit: StringName) -> StringName:
    match suit:
        Suits.SPADE:
            match rank:
                Ranks.ACE: return ACE_SPADE
                Ranks.TWO: return TWO_SPADE
                Ranks.THREE: return THREE_SPADE
                Ranks.FOUR: return FOUR_SPADE
                Ranks.FIVE: return FIVE_SPADE
                Ranks.SIX: return SIX_SPADE
                Ranks.SEVEN: return SEVEN_SPADE
                Ranks.EIGHT: return EIGHT_SPADE
                Ranks.NINE: return NINE_SPADE
                Ranks.TEN: return TEN_SPADE
                Ranks.JACK: return JACK_SPADE
                Ranks.QUEEN: return QUEEN_SPADE
                Ranks.KING: return KING_SPADE
                _: return &''
        Suits.CLUB:
            match rank:
                Ranks.ACE: return ACE_CLUB
                Ranks.TWO: return TWO_CLUB
                Ranks.THREE: return THREE_CLUB
                Ranks.FOUR: return FOUR_CLUB
                Ranks.FIVE: return FIVE_CLUB
                Ranks.SIX: return SIX_CLUB
                Ranks.SEVEN: return SEVEN_CLUB
                Ranks.EIGHT: return EIGHT_CLUB
                Ranks.NINE: return NINE_CLUB
                Ranks.TEN: return TEN_CLUB
                Ranks.JACK: return JACK_CLUB
                Ranks.QUEEN: return QUEEN_CLUB
                Ranks.KING: return KING_CLUB
                _: return &''
        Suits.DIAMOND:
            match rank:
                Ranks.ACE: return ACE_DIAMOND
                Ranks.TWO: return TWO_DIAMOND
                Ranks.THREE: return THREE_DIAMOND
                Ranks.FOUR: return FOUR_DIAMOND
                Ranks.FIVE: return FIVE_DIAMOND
                Ranks.SIX: return SIX_DIAMOND
                Ranks.SEVEN: return SEVEN_DIAMOND
                Ranks.EIGHT: return EIGHT_DIAMOND
                Ranks.NINE: return NINE_DIAMOND
                Ranks.TEN: return TEN_DIAMOND
                Ranks.JACK: return JACK_DIAMOND
                Ranks.QUEEN: return QUEEN_DIAMOND
                Ranks.KING: return KING_DIAMOND
                _: return &''
        Suits.HEART:
            match rank:
                Ranks.ACE: return ACE_HEART
                Ranks.TWO: return TWO_HEART
                Ranks.THREE: return THREE_HEART
                Ranks.FOUR: return FOUR_HEART
                Ranks.FIVE: return FIVE_HEART
                Ranks.SIX: return SIX_HEART
                Ranks.SEVEN: return SEVEN_HEART
                Ranks.EIGHT: return EIGHT_HEART
                Ranks.NINE: return NINE_HEART
                Ranks.TEN: return TEN_HEART
                Ranks.JACK: return JACK_HEART
                Ranks.QUEEN: return QUEEN_HEART
                Ranks.KING: return KING_HEART
                _: return &''
        _: return &''


func value_to_rs(value: StringName) -> Array:
    return VALUE_TO_RS[value]
