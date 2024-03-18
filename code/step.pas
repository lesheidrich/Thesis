    @staticmethod
    def step(threshold: float) -> bool:
        if random.uniform(0, 1) < threshold:
            return True
        return False