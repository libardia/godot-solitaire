extends Node


const ACE: StringName = &'A'
const TWO: StringName = &'2'
const THREE: StringName = &'3'
const FOUR: StringName = &'4'
const FIVE: StringName = &'5'
const SIX: StringName = &'6'
const SEVEN: StringName = &'7'
const EIGHT: StringName = &'8'
const NINE: StringName = &'9'
const TEN: StringName = &'10'
const JACK: StringName = &'J'
const QUEEN: StringName = &'Q'
const KING: StringName = &'K'

const ALL_RANKS = [
    ACE,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX,
    SEVEN,
    EIGHT,
    NINE,
    TEN,
    JACK,
    QUEEN,
    KING
]


func next(rank: StringName) -> StringName:
    if rank == KING: return &""
    return ALL_RANKS[ALL_RANKS.find(rank) + 1]


func previous(rank: StringName) -> StringName:
    if rank == ACE: return &""
    return ALL_RANKS[ALL_RANKS.find(rank) - 1]
