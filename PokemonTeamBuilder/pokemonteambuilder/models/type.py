# type class model
# Type list is represented as a string of ints with each index corresponding
# to a different type
# List map: [Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground,
# Flying, Psychic, Bug, Rock, Ghost, Dragon, Dark, Steel, Fairy]

class Type:

    def __init__(self, type_name, strong_attack, weak_attack, strong_defense, weak_defense ):
        self.type_name = type_name
        self.strong_attack = strong_attack
        self.weak_attack = weak_attack
        self.strong_defense = strong_defense
        self.weak_defense = weak_defense

    def get_strong_attack(self) -> list[int]:
        return self.strong_attack

    def get_weaK_attack(self) -> list[int]:
        return self.weak_attack
    
    def get_strong_defense(self) -> list[int]:
        return self.strong_defense
    
    def get_weak_defernse(self) -> list[int]:
        return self.weak_defense
