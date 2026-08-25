import unittest

from vio_tools import default_seed, project_name


class ProjectTest(unittest.TestCase):
    def test_project_name(self) -> None:
        self.assertEqual(project_name(), "Vio Autonomous WALL-E")

    def test_default_seed(self) -> None:
        self.assertEqual(default_seed(), 42)


if __name__ == "__main__":
    unittest.main()
