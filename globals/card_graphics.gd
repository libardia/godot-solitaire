extends Node


var global_card_back: Texture2D = preload("res://img/cards/cardBack_blue2.png")

const VALUE_TO_GRAPHIC: Dictionary = {
    CardValues.ACE_SPADE: preload("res://img/cards/cardSpadesA.png"),
    CardValues.TWO_SPADE: preload("res://img/cards/cardSpades2.png"),
    CardValues.THREE_SPADE: preload("res://img/cards/cardSpades3.png"),
    CardValues.FOUR_SPADE: preload("res://img/cards/cardSpades4.png"),
    CardValues.FIVE_SPADE: preload("res://img/cards/cardSpades5.png"),
    CardValues.SIX_SPADE: preload("res://img/cards/cardSpades6.png"),
    CardValues.SEVEN_SPADE: preload("res://img/cards/cardSpades7.png"),
    CardValues.EIGHT_SPADE: preload("res://img/cards/cardSpades8.png"),
    CardValues.NINE_SPADE: preload("res://img/cards/cardSpades9.png"),
    CardValues.TEN_SPADE: preload("res://img/cards/cardSpades10.png"),
    CardValues.JACK_SPADE: preload("res://img/cards/cardSpadesJ.png"),
    CardValues.QUEEN_SPADE: preload("res://img/cards/cardSpadesQ.png"),
    CardValues.KING_SPADE: preload("res://img/cards/cardSpadesK.png"),

    CardValues.ACE_CLUB: preload("res://img/cards/cardClubsA.png"),
    CardValues.TWO_CLUB: preload("res://img/cards/cardClubs2.png"),
    CardValues.THREE_CLUB: preload("res://img/cards/cardClubs3.png"),
    CardValues.FOUR_CLUB: preload("res://img/cards/cardClubs4.png"),
    CardValues.FIVE_CLUB: preload("res://img/cards/cardClubs5.png"),
    CardValues.SIX_CLUB: preload("res://img/cards/cardClubs6.png"),
    CardValues.SEVEN_CLUB: preload("res://img/cards/cardClubs7.png"),
    CardValues.EIGHT_CLUB: preload("res://img/cards/cardClubs8.png"),
    CardValues.NINE_CLUB: preload("res://img/cards/cardClubs9.png"),
    CardValues.TEN_CLUB: preload("res://img/cards/cardClubs10.png"),
    CardValues.JACK_CLUB: preload("res://img/cards/cardClubsJ.png"),
    CardValues.QUEEN_CLUB: preload("res://img/cards/cardClubsQ.png"),
    CardValues.KING_CLUB: preload("res://img/cards/cardClubsK.png"),

    CardValues.ACE_DIAMOND: preload("res://img/cards/cardDiamondsA.png"),
    CardValues.TWO_DIAMOND: preload("res://img/cards/cardDiamonds2.png"),
    CardValues.THREE_DIAMOND: preload("res://img/cards/cardDiamonds3.png"),
    CardValues.FOUR_DIAMOND: preload("res://img/cards/cardDiamonds4.png"),
    CardValues.FIVE_DIAMOND: preload("res://img/cards/cardDiamonds5.png"),
    CardValues.SIX_DIAMOND: preload("res://img/cards/cardDiamonds6.png"),
    CardValues.SEVEN_DIAMOND: preload("res://img/cards/cardDiamonds7.png"),
    CardValues.EIGHT_DIAMOND: preload("res://img/cards/cardDiamonds8.png"),
    CardValues.NINE_DIAMOND: preload("res://img/cards/cardDiamonds9.png"),
    CardValues.TEN_DIAMOND: preload("res://img/cards/cardDiamonds10.png"),
    CardValues.JACK_DIAMOND: preload("res://img/cards/cardDiamondsJ.png"),
    CardValues.QUEEN_DIAMOND: preload("res://img/cards/cardDiamondsQ.png"),
    CardValues.KING_DIAMOND: preload("res://img/cards/cardDiamondsK.png"),

    CardValues.ACE_HEART: preload("res://img/cards/cardHeartsA.png"),
    CardValues.TWO_HEART: preload("res://img/cards/cardHearts2.png"),
    CardValues.THREE_HEART: preload("res://img/cards/cardHearts3.png"),
    CardValues.FOUR_HEART: preload("res://img/cards/cardHearts4.png"),
    CardValues.FIVE_HEART: preload("res://img/cards/cardHearts5.png"),
    CardValues.SIX_HEART: preload("res://img/cards/cardHearts6.png"),
    CardValues.SEVEN_HEART: preload("res://img/cards/cardHearts7.png"),
    CardValues.EIGHT_HEART: preload("res://img/cards/cardHearts8.png"),
    CardValues.NINE_HEART: preload("res://img/cards/cardHearts9.png"),
    CardValues.TEN_HEART: preload("res://img/cards/cardHearts10.png"),
    CardValues.JACK_HEART: preload("res://img/cards/cardHeartsJ.png"),
    CardValues.QUEEN_HEART: preload("res://img/cards/cardHeartsQ.png"),
    CardValues.KING_HEART: preload("res://img/cards/cardHeartsK.png")
}


func value_to_graphic(value: StringName) -> Texture2D:
    return VALUE_TO_GRAPHIC[value] as Texture2D
