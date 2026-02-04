class Card:
  # Card only has the key _value
  __slots__ = ("_value",)

  def __init__(self, value: int) -> None:
    self._value = value

  def __repr__(self) -> str:
    """printing the object returns this instead of mem address."""
    return f"[{self.value:2}]"

  def __eq__(self, value: object, /) -> bool:
    """how the class handles comparision, the / means you can't call use the value kwarg in the func call"""
    if not isinstance(value, Card):
      return False
    return self.value == value.value

  @property
  def value(self) -> int:
    return self._value
    

