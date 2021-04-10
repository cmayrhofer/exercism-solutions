class Garden:
    def __init__(
        self,
        diagram: str,
        students: list = [
            "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"
        ]
    ) -> None:
        self._students = sorted(students)
        self._diagram = diagram
        self._abbreveation_to_full_name = {
            "G": "Grass", "V": "Violets", "C": "Clover", "R": "Radishes"
        }
        self._plants_assignment = self._assign_plants()

    def _assign_plants(self) -> dict:
        first_row, second_row = self._diagram.split("\n")
        if len(first_row) != len(second_row) and len(first_row) != 2*len(self._students):
            raise ValueError(
                "Number of students does not fit the length of the garden")
        plants_assignment = dict()
        for i, student in enumerate(self._students):
            plants_assignment[student] = "".join(
                [first_row[2*i:2*(i+1)], second_row[2*i:2*(i+1)]]
            )
            plants_assignment[student] = [
                self._abbreveation_to_full_name[abb] for abb in plants_assignment[student]]
        return plants_assignment

    def plants(self, student: str) -> list:
        return self._plants_assignment[student]
